-include ralph/Makefile

ralphy_generate_prd:  ## Generate PRD from feed sources
	claude -p "$$(cat config/prd-generation-prompt.md)" --max-turns 15

ralphy_evolve:  ## Full evolution cycle: generate PRD + run ralph
	$(MAKE) ralphy_generate_prd
	$(MAKE) ralph_init_loop
	$(MAKE) ralph_run
