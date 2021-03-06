## [*Unreleased*](https://github.com/frontrowed/faktory_worker_haskell/compare/v1.1.0.0...main)

None

## [v1.1.0.0](https://github.com/frontrowed/faktory_worker_haskell/compare/v1.0.3.1...v1.1.0.0)

- Pass value of type `Job arg` (not `arg`) to run-worker loops

  This will give consumer loops access to details like `jobJid` and
  `jobOptions`, so they can (for example) call `TRACK SET`.

  Call `jobArg` to get back what you were getting before this change.

- Support `BATCH STATUS`
- Add `tracked` Job Option
- Deprecate `trackPerform` (use `perform (options <> tracked)` instead)

## [v1.0.3.1](https://github.com/frontrowed/faktory_worker_haskell/compare/v1.0.3.0...v1.0.3.1)

- Export lower-level `BATCH` functions

## [v1.0.3.0](https://github.com/frontrowed/faktory_worker_haskell/compare/v1.0.2.3...v1.0.3.0)

- Support for `TRACK` (Enterprise only)

## [v1.0.2.3](https://github.com/frontrowed/faktory_worker_haskell/compare/v1.0.2.2...v1.0.2.3)

- Remove dependencies upper bounds

## [v1.0.2.2](https://github.com/frontrowed/faktory_worker_haskell/compare/v1.0.2.1...v1.0.2.2)

- Relax dependencies upper bounds

## [v1.0.2.1](https://github.com/frontrowed/faktory_worker_haskell/compare/v1.0.2.0...v1.0.2.1)

- Fix bug in `at` parsing of consumed Job payloads

## [v1.0.2.0](https://github.com/frontrowed/faktory_worker_haskell/compare/v1.0.1.6...v1.0.2.0)

- Partial `BATCH` support (Enterprise only)
- Support for `custom` field in Job payloads
- Lower-level `buildJob` and `commandByteString` functions

## [v1.0.1.6](https://github.com/frontrowed/faktory_worker_haskell/compare/v1.0.1.5...v1.0.1.6)

- Relax dependencies upper bounds

## [v1.0.1.5](https://github.com/frontrowed/faktory_worker_haskell/compare/v1.0.1.4...v1.0.1.5)

- Maintain version bounds

## [v1.0.1.4](https://github.com/frontrowed/faktory_worker_haskell/compare/v1.0.1.3...v1.0.1.4)

- Various CI and dependency bounds changes

## [v1.0.1.3](https://github.com/frontrowed/faktory_worker_haskell/compare/v1.0.1.2...v1.0.1.3)

- Add support for queue namespacing

## [v1.0.1.2](https://github.com/frontrowed/faktory_worker_haskell/compare/v1.0.1.1...v1.0.1.2)

- Fix internal handling of invalid Server Replies

## [v1.0.1.1](https://github.com/frontrowed/faktory_worker_haskell/compare/v1.0.1.0...v1.0.1.1)

- Include non-OK reply in `commandOK` error
- Build with GHC-8.8

## [v1.0.1.0](https://github.com/frontrowed/faktory_worker_haskell/compare/v1.0.0.0...v1.0.1.0)

- Upgrade to `megaparsec-7`

## [v1.0.0.0](https://github.com/frontrowed/faktory_worker_haskell/tree/v1.0.0.0)

Initial release.
