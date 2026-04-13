You are generating an implementation PRD from research discoveries.

## Pre-synthesis

First run these skills to gather context:
1. /cc-meta:distilling-plan-learnings --time-range 7d
2. /cc-meta:synthesizing-cc-bigpicture --time-range 7d

## Discovery

Read ai-agents-research/triage/ for the latest uncovered features.
Read ai-agents-research/docs/learnings/cross-repo-digest.md for patterns.
Check registry/index.json for active repos and their stacks.

## Selection

Identify the top 3-5 discoveries that would benefit the contrib repos:
- Uncovered CC features that enable new capabilities
- Community patterns that solve known pain points
- Research findings with concrete implementation paths

## Output

Generate docs/PRD.md following the ralph PRD template at ralph/docs/templates/prd.md.template.
Each discovery becomes a story with acceptance criteria and target files.
Then run: python ralph/scripts/generate_prd_json.py
