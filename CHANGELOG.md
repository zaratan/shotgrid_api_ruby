# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.2.1.1] - 2026-05-11

### Changed

- Replaced the Prettier toolchain (`@prettier/plugin-ruby` + `prettier` npm packages, and the `prettier` Ruby gem) with `syntax_tree` invoked directly via `bundle exec stree`. Per the upstream `@prettier/plugin-ruby` maintainers, the plugin is no longer recommended in favor of using Syntax Tree directly.
- CI now checks formatting via `bundle exec stree check ...` instead of `yarn prettier -c ...`. The `release` job's `needs:` was updated from `[tests, prettier]` to `[tests, format]`.
- Overcommit `Prettier` hooks (pre-commit and pre-push) renamed to `SyntaxTree`; `bin/prettirun` renamed to `bin/streerun` and rewritten to call `bundle exec stree check`.
- Inlined the Style/Layout cop disablement (previously inherited via `inherit_gem: prettier: rubocop.yml`) directly into `.rubocop.yml` — RuboCop still does not enforce style.

### Added

- `syntax_tree` dev dependency (it used to be transitive via the `prettier` gem)
- `.streerc` configuring the `single_quotes` and `trailing_comma` plugins to preserve the existing code style

### Removed

- `package.json`, `yarn.lock`, `.prettierrc.js` — the gem no longer needs a JavaScript toolchain
- `prettier` Ruby gem from `Gemfile` (and its transitive `syntax_tree-haml`, `syntax_tree-rbs`)

## [0.2.1.0] - 2026-05-11

### Changed

- Bumped `faraday` constraint from `~> 1` to `~> 2.0`
- Replaced `connection.dup` with `connection.clone` in `Preferences`, `Entities`, `Schema`, `Summarize`: Faraday 2's `RackBuilder#dup` drops singleton extensions, breaking VCR's hook injection in consumer test suites. `clone` shares the builder (preserving extensions) while keeping `url_prefix` mutations isolated on the `Connection` itself.

### Added

- `faraday-net_http ~> 3.0` runtime dependency: Faraday 2 ships the adapters as separate gems, so `Faraday.default_adapter` (`:net_http`) is now loaded explicitly via `require 'faraday/net_http'`

### Removed

- Implicit transitive Faraday adapter/middleware gems pulled by the Faraday 1.x metagem and never used in code: `faraday-em_http`, `faraday-em_synchrony`, `faraday-excon`, `faraday-httpclient`, `faraday-multipart`, `faraday-net_http_persistent`, `faraday-patron`, `faraday-rack`, `faraday-retry`, `multipart-post`, `ruby2_keywords`

## [0.2.0.9] - 2026-05-11

### Changed

- Replaced `activesupport` runtime dependency with `dry-inflector` (~> 1.0): only `String#camelize`/`singularize` were used, no need for the full ActiveSupport tree

### Added

- `ruby-lsp` as the canonical Ruby language server for development

### Removed

- `activesupport` runtime dependency (along with its tree: `concurrent-ruby`, `i18n` transitive, `tzinfo`, `drb`, `minitest`, …)
- `solargraph` dev dependency (and its tree: `backport`, `kramdown`, `reverse_markdown`, `nokogiri`, …) — superseded by `ruby-lsp`

## [0.2.0.8] - 2026-05-10

### Added

- Explicit dependency on `ostruct` (no longer in default gems on Ruby 4.0+)

### Changed

- Bumped minimum Ruby to 3.3 and updated the CI matrix to non-EOL versions (3.3, 3.4, 4.0)
- Upgraded Sorbet/Tapioca stack (sorbet-static now ships arm64-darwin-25 binaries)
- Bumped RuboCop and migrated `require:` extensions to the new `plugins:` syntax; `TargetRubyVersion` raised to 3.3
- Refreshed gem RBIs against the updated dependencies

### Fixed

- Gemspec metadata: `homepage_uri`, `source_code_uri` and `changelog_uri` were silently overwritten by a subsequent `spec.metadata = {…}` assignment; consolidated into a single hash literal so all entries are published

## [0.2.0.6] - 2023-01-29

### Added

- Adding Ruby 3.2 to the test matrix

## [0.2.0.5] - 2022-04-04

### Removed

- Removing Ruby 2.6 after EOL

### Changed

- ActiveSupport 7+

## [0.2.0.4] - 2022-01-04

### Changed

- Moving to bundler 2
- Updating all dependencies

### Added

- Adding Ruby 3.1 to test matrix

## [0.2.0.1] - 2021-10-12

### Changed

- Fixing Rubocop

## [0.2.0] - 2021-08-27

### Added

- Adding Sorbet

## [0.1.3.3] - 2021-08-28

### Added

- Issue default format

## [0.1.3.2] - 2021-08-24

### Added

- Code Of Conduct

## [0.1.3.1] - 2021-08-24

### Changed

- Correctly advertising the minimum ruby version to 2.6

## [0.1.3] - 2021-08-24

### Changed

- Updated tooling
- Adding `ShotgridCallError` to capture call errors and give access to the raw Faraday response

## [0.1.2] - 2021-06-16

### Changed

- Renamed to Shotgrid

## [0.1.1] - 2021-06-15

### Added

- summarize and count support

## [0.1.0] - 2021-06-14

### Added

- Complete test coverage (Unit + Integration tests)
- Adding minimum coverage for tests
- Adding Guard

### Changed

- Fixed many edge-case bugs

### Removed

- Removed the `Gemfile.lock` since it shouldn't be commited in gems

## [0.0.8.5] - 2021-01-15

### Added

- Added prettier for ruby style

## [0.0.8.4] - 2021-01-07

### Changed

- Safer eager_load

## [0.0.8.3] - 2021-01-07

### Added

- eager_load files to fix weird bugs in rspec

## [0.0.8] - 2020-12-16

### Added

- Schema: read
- Schema: read fields

## [0.0.7] - 2020-12-16

### Added

- Entities: update
- Entities: create
- Entities: delete
- Entities: revive

[unreleased]: https://github.com/shotgunsoftware/shotgrid_api_ruby/compare/v0.2.0...HEAD
[0.2.0.5]: https://github.com/shotgunsoftware/shotgrid_api_ruby/releases/tag/v0.2.0.5
[0.2.0.4]: https://github.com/shotgunsoftware/shotgrid_api_ruby/releases/tag/v0.2.0.4
[0.2.0.1]: https://github.com/shotgunsoftware/shotgrid_api_ruby/releases/tag/v0.2.0.1
[0.2.0]: https://github.com/shotgunsoftware/shotgrid_api_ruby/releases/tag/v0.2.0
[0.1.3.3]: https://github.com/shotgunsoftware/shotgrid_api_ruby/releases/tag/v0.1.3.3
[0.1.3.2]: https://github.com/shotgunsoftware/shotgrid_api_ruby/releases/tag/v0.1.3.2
[0.1.3.1]: https://github.com/shotgunsoftware/shotgrid_api_ruby/releases/tag/v0.1.3.1
[0.1.3]: https://github.com/shotgunsoftware/shotgrid_api_ruby/releases/tag/v0.1.3
[0.1.2]: https://github.com/shotgunsoftware/shotgrid_api_ruby/releases/tag/v0.1.2
[0.1.1]: https://github.com/shotgunsoftware/shotgrid_api_ruby/releases/tag/v0.1.1
[0.1.0]: https://github.com/shotgunsoftware/shotgrid_api_ruby/releases/tag/v0.1.0
[0.0.8.5]: https://github.com/shotgunsoftware/shotgrid_api_ruby/releases/tag/v0.0.8.5
[0.0.8.4]: https://github.com/shotgunsoftware/shotgrid_api_ruby/releases/tag/v0.0.8.4
[0.0.8.3]: https://github.com/shotgunsoftware/shotgrid_api_ruby/releases/tag/v0.0.8.3
[0.0.8]: https://github.com/shotgunsoftware/shotgrid_api_ruby/releases/tag/v0.0.8
[0.0.7]: https://github.com/shotgunsoftware/shotgrid_api_ruby/releases/tag/v0.0.7
