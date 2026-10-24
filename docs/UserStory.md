# Self-Evolving Research Implementer

## Problem

ai-agents-research collects and triages new Claude Code features, community
patterns, papers, best practices and ecosystem changes. These discoveries are
triaged but not turned into improvements to the tooling we build with.

## Users

- ralph-loop template (the target: every project started from it benefits)

## Value

Automatically turn research discoveries into tested improvements to the
ralph-loop template, so it compounds *what's new*. Design:
[template#32](https://github.com/qte77/ralph-loop-cc-tdd-wt-vibe-kanban-template/issues/32).

## Feeds

- ai-agents-research `triage/` (uncovered Claude Code features)
- ai-agents-research `docs/learnings/cross-repo-digest.md`
- `registry/index.json`

External sources are collected upstream in ai-agents-research; this repo does
not search the web itself.

## Stories

- Read ai-agents-research/triage/ for uncovered features
- Read ai-agents-research/docs/learnings/ for cross-repo patterns
- Generate PRD with stories for highest-value template improvements
- Implement via strict TDD (Red-Green-Refactor)
- Write back novel learnings to ai-agents-research

## Constraints

- Must not break existing functionality
- Uni-directional: changes land via pull request in this repo, never pushed to
  the template; the owner picks good changes back (mechanism open in #32)
- Max budget per weekly run: configurable via RALPH_MAX_ITERATIONS
