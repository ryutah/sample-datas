user_name := sa
password := Password1234

.PHONY: help
help: ## Prints help for targets with comments
	@cat $(MAKEFILE_LIST) | grep -E '^[\/a-zA-Z_-]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: init
init: ## Initialize apps
	mkdir -p .tmp/baks
	curl -L \
		-o .tmp/baks/AdventureWorksDW2022.bak \
		https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2022.bak
	docker network create adventure-works

.PHONY: db/start
db/start: ## Run db container
	docker container run \
		-d \
		--net adventure-works \
		--rm \
		-e "ACCEPT_EULA=Y" \
		-e "MSSQL_SA_PASSWORD=${password}" \
		-p 1433:1433 \
		-v ${PWD}/.tmp/baks:/var/opt/mssql/backup \
		--name sql1 \
		mcr.microsoft.com/mssql/server:2022-latest

.PHONY: db/stop
db/stop: ## Stop db container
	docker container stop sql1

.PHONY: db/restore
db/restore: ## Restore AdventureWorksDW2022 databse
	sqlcmd \
		-S localhost:1433 \
		-U sa \
		-P ${password} \
		-Q "RESTORE DATABASE [AdventureWorksDW2022] FROM DISK = '/var/opt/mssql/backup/AdventureWorksDW2022.bak' WITH MOVE 'AdventureWorksDW2022' TO '/var/opt/mssql/data/AdventureWorksDW2022_Data.mdf', MOVE 'AdventureWorksDW2022_log' TO '/var/opt/mssql/data/AdventureWorksDW2022_Data_log.ldf', FILE = 1, NOUNLOAD, STATS = 5" \
		-W \
		-h -1

.PHONY: db/tbls
db/tbls: ## Generate ER diagram by tbls
	sudo rm -rf ./tbls
	docker container run \
		--net adventure-works \
		--rm \
		-v ${PWD}:/work \
		-w /work ghcr.io/k1low/tbls doc mssql://${user_name}:${password}@sql1:1433/AdventureWorksDW2022 /work/tbls

.PHONY: db/schemaspy
db/schemaspy: ## Generate ER diagram by schemaspy
	sudo rm -rf ./schemaspy/*
	docker container run \
		--rm \
		--net adventure-works \
		-v ${PWD}/schemaspy:/output \
		-v ${PWD}/resources/drivers:/drivers \
		-v ${PWD}/schemaspy.properties:/schemaspy.properties schemaspy/schemaspy:6.2.4 -debug

.PHONY: db/export_json
db/export_json: ## Export db schema to json
	./scripts/export.sh localhost:1433 ${user_name} ${password} AdventureWorksDW2022
