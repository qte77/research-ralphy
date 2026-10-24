# research-ralphy

> Self-improvement offspring of the [ralph-loop template](https://github.com/qte77/ralph-loop-cc-tdd-wt-vibe-kanban-template): turns external research into tested improvements for the template.

[![License](https://img.shields.io/badge/license-Apache--2.0-58f4c2.svg)](LICENSE)
[![lint-md-links](https://github.com/qte77/research-ralphy/actions/workflows/lint-md-links.yml/badge.svg)](https://github.com/qte77/research-ralphy/actions/workflows/lint-md-links.yml)
[![ralphy-weekly](https://github.com/qte77/research-ralphy/actions/workflows/ralphy-weekly.yaml/badge.svg)](https://github.com/qte77/research-ralphy/actions/workflows/ralphy-weekly.yaml)

## What

> **Status:** not yet running end to end. The weekly workflow has never succeeded and is disabled; fixes are
> tracked in [issues](https://github.com/qte77/research-ralphy/issues).

- Compounds *what's new*: papers, best practices, blog posts and new Claude Code features become improvements to the
  ralph-loop template
- Research is curated upstream in [ai-agents-research](https://github.com/qte77/ai-agents-research); this repo
  does not search the web itself
- Weekly cycle: discover → select top 3-5 → PRD → ralph TDD loop → pull request in this repo
- Never pushes to the template; good changes are picked back by the owner
- Sibling of [learnings-ralphy](https://github.com/qte77/learnings-ralphy), which does the same for our own learnings

## How

```bash
make ralphy_evolve   # generate PRD from research, then run the ralph loop
```

Feeds, target and constraints: [docs/UserStory.md](docs/UserStory.md). PRD workflow:
[config/prd-generation-prompt.md](config/prd-generation-prompt.md). Agent conventions: [AGENTS.md](AGENTS.md).

## Why

Research findings pile up in triage folders and digests without reaching the tooling we build with. Turning the best
of them into tested template changes means every project started from the template benefits. Design:
[template#32](https://github.com/qte77/ralph-loop-cc-tdd-wt-vibe-kanban-template/issues/32).

## Refs

- [docs/UserStory.md](docs/UserStory.md)
- [AGENTS.md](AGENTS.md)
- [config/prd-generation-prompt.md](config/prd-generation-prompt.md)
- [ralph-loop template](https://github.com/qte77/ralph-loop-cc-tdd-wt-vibe-kanban-template)
- [template#32 — self-improvement design](https://github.com/qte77/ralph-loop-cc-tdd-wt-vibe-kanban-template/issues/32)
- [learnings-ralphy](https://github.com/qte77/learnings-ralphy)
- [ai-agents-research](https://github.com/qte77/ai-agents-research)
- [An Open Agentic Coding Harness](https://qte77.github.io/open-agentic-coding-harness/)

## License

Apache-2.0 - see [LICENSE](LICENSE).
