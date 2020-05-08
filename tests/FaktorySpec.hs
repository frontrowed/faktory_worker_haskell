module FaktorySpec
  ( spec
  ) where

import Faktory.Prelude

import Control.Concurrent (forkIO, threadDelay)
import Control.Concurrent.MVar
import Faktory.Client
import Faktory.Job
import Faktory.Settings
import Faktory.Worker
import Test.Hspec

spec :: Spec
spec = describe "Faktory" $ do
  it "can push and process jobs" $ do
    settings <- envSettings
    bracket (newClient settings Nothing) closeClient $ \client -> do
      void $ flush client
      void $ perform @Text mempty client "a"
      void $ perform @Text mempty client "b"
      void $ perform @Text mempty client "HALT"

    processedJobs <- newMVar ([] :: [Text])
    runWorker settings $ \job -> do
      modifyMVar_ processedJobs $ pure . (job :)
      when (job == "HALT") $ throw WorkerHalt

    jobs <- readMVar processedJobs
    jobs `shouldMatchList` ["a", "b", "HALT"]

  it "can push jobs with optional attributes" $ do
    settings <- envSettings
    bracket (newClient settings Nothing) closeClient $ \client -> do
      void $ flush client
      void $ perform @Text once client "a"
      void $ perform @Text (retry 0) client "b"
      void $ perform @Text mempty client "HALT"

    processedJobs <- newMVar ([] :: [Text])
    runWorker settings $ \job -> do
      modifyMVar_ processedJobs $ pure . (job :)
      when (job == "HALT") $ throw WorkerHalt

    jobs <- readMVar processedJobs
    jobs `shouldMatchList` ["a", "b", "HALT"]

  it "doesn't crash on a consumer timeout" $ do
    settings' <- envSettings
    let settings = settings' { settingsWorkerIdleDelay = 0 }

    void
      $ forkIO
      $ bracket (newClient settings Nothing) closeClient
      $ \client -> do
          void $ flush client
          threadDelay 500000 -- 0.5s
          void $ perform @Text mempty client "HALT"

    processedJobs <- newMVar ([] :: [Text])
    runWorker settings $ \job -> do
      modifyMVar_ processedJobs $ pure . (job :)
      when (job == "HALT") $ throw WorkerHalt

    jobs <- readMVar processedJobs
    jobs `shouldMatchList` ["HALT"]
