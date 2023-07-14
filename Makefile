DOCKER_TAG=dbmate:test
.DEFAULT_GOAL := help

.PHONY: help
help: ## show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

docker-build:
	docker build --quiet . -t $(DOCKER_TAG)

docker-sh: docker-build
	@mkdir -p db/migrations
	@docker run -it --rm \
		--network=host \
		-e DATABASE_URL=$(DATABASE_URL) \
		-v $(PWD)/db:/app/db \
		--entrypoint /bin/bash \
		$(DOCKER_TAG)
