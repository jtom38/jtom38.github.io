.PHONY: help
help: ## Shows this help command
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

new-page: ## Creates a new blog post based on a template
	hugo new ./content/posts/placeholder.md

start-dev: ## Starts the dev server and redirects to the localhost
	hugo server --baseURL localhost