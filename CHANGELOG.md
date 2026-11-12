# Changelog

All notable changes to this project are documented in this file.

The format is based on
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

### Security

- `actions/checkout` in `ralphy-weekly.yaml` pinned to a full commit SHA (`@v7` → `3d3c42e5aac5ba805825da76410c181273ba90b1`), matching the org's Actions policy requiring full-length SHA pins.

### Fixed

- `config/compound.env` paths can be overridden from the environment (`WORKSPACE_ROOT`, `CLAUDE_HOME` and each variable), instead of hard-coded Codespace paths that do not exist on Actions runners; `docs/configuration.md` documents them and the workflow secrets (#21).

### Added

- `CHANGELOG.md` in Keep a Changelog format (#25).
- `.github/dependabot.yml` `github-actions` entry (weekly), grouping security updates together and version updates (minor/patch only; majors stay ungrouped for individual review).

### Changed

- `AGENTS.md` asks for a CHANGELOG entry on non-trivial changes (#25).
- README states the ralph-loop template self-improvement intent and
  current status; intent detail moves to `docs/UserStory.md` (#23).
- README rewritten to the estate doc-structure canon (#22).
