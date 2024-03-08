PROJECT ?= meta-server
ENV ?= development

# Common docker-compose method and arguments
COMPOSE = docker compose -f docker-compose.yml -f docker-compose.$(ENV).yml -p ${PROJECT}

# Tasks

.PHONY: build
build: ## Build containers
	$(COMPOSE) build

.PHONY: up
up: ## Start containers in background
	$(COMPOSE) up -d

.PHONY: down
down: ## Stop containers
	$(COMPOSE) down

.PHONY: contracts-off
contracts-off: ## Download and migrate contracts
	./scripts/migrate-contracts-off.sh

.PHONY: contracts-lifeforms
contracts-lifeforms: ## Download and migrate contracts
	./scripts/migrate-contracts-lifeforms.sh

.PHONY: contracts-wildcards
contracts-wildcards: ## Download and migrate contracts
	./scripts/migrate-contracts-wildcards.sh

.PHONY: contracts-mirrors
contracts-mirrors: ## Download and migrate contracts
	./scripts/migrate-contracts-mirrors.sh

.PHONY: ipfs
ipfs: ## Download and migrate contracts
	./scripts/ipfs-upload.sh

.PHONY: logs
logs: ## Follow container logs
	$(COMPOSE) logs -f --tail 100

.PHONY: clean
clean: ## Remove volumes
	docker volume prune --filter label=${PROJECT}

.PHONY: start
## Prune all volumes and start containers
start: | clean up