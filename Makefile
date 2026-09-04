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

.PHONY: nightscout-up
nightscout-up: ## Stop containers
	docker compose -f docker-compose.nightscout.yml up -d

.PHONY: nightscout-down
nightscout-down: ## Stop containers
	docker compose -f docker-compose.nightscout.yml down

# FEED — the Rhizome auction piece. Its own stack, like nightscout: it shares
# nothing with meta-server, so `make down` must not take it offline. Source is
# pulled from git at the ref pinned in docker-compose.feed.yml — nothing needs
# to be checked out on this box.
FEED = docker compose -f docker-compose.feed.yml -p feed

.PHONY: feed-build
feed-build: ## Build FEED from the pinned ref
	$(FEED) build --pull

.PHONY: feed-up
feed-up: ## Start FEED
	$(FEED) up -d

.PHONY: feed-down
feed-down: ## Stop FEED
	$(FEED) down

.PHONY: feed-logs
feed-logs: ## Follow FEED logs
	$(FEED) logs -f --tail 100

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
