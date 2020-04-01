.PHONY: help

.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build:## Build Poetry container locally
	@echo "Building Poetry container locally"
	@docker build --tag python-poetry:latest .

lint:## Lint dockerfile
	@docker run -v ${PWD}/Dockerfile:/Dockerfile -v ${PWD}/.dockerfilelintrc:/.dockerfilelintrc replicated/dockerfilelint /Dockerfile
	@docker run -it --rm -v "${PWD}/Dockerfile":/Dockerfile:ro redcoolbeans/dockerlint
	
dive:## Launch dive test on image
	@CI=true dive --ci-config=.dive.yaml python-poetry:latest

cst:## Launch container structure test on image
	@container-structure-test test --image python-poetry:latest --config cst.yaml

test:## WIP
	@docker run -v ${PWD}/Dockerfile:/Dockerfile -v ${PWD}/.dockerfilelintrc:/.dockerfilelintrc replicated/dockerfilelint /Dockerfile
	@docker run -it --rm -v "${PWD}/Dockerfile":/Dockerfile:ro redcoolbeans/dockerlint
	@CI=true dive --ci-config=.dive.yaml python-poetry:latest
	@container-structure-test test --image python-poetry:latest --config cst.yaml