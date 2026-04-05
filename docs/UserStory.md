# Self-Evolving Research Implementer

## Problem
ai-agents-research monitors discover new CC features, community patterns,
and ecosystem changes weekly. These discoveries are triaged but not
automatically implemented as adoptions or integrations.

## Users
- 9 contrib repos (SimpleAgents, compass-mcp, openclaude, etc.)
- cc-utils-plugin (new skills from discoveries)
- polyforge-orchestrator (new presets, integrations)

## Value
Automatically turn research discoveries into implementations:
feature adoptions, new integrations, contribution PRs.

## Stories
- Read ai-agents-research/triage/ for uncovered features
- Read ai-agents-research/docs/learnings/ for cross-repo patterns
- Generate PRD with stories for highest-value implementations
- Implement via strict TDD (Red-Green-Refactor)
- Write back novel learnings to ai-agents-research

## Constraints
- Must not break existing functionality
- Changes via fork+PR workflow (never direct push)
- Max budget per weekly run: configurable via RALPH_MAX_ITERATIONS
