# output coloring & timing
include .scripts/mara-app/init.mk

# virtual env creation, package updates, db migration
include .scripts/mara-app/install.mk

# if you don't want to download the two big
sync-bigquery-csv-data-sets-from-s3:
	.venv/bin/aws s3 sync s3://mara-example-project-data data --delete --no-progress --no-sign-request

docker-build-postgres:
	docker build -t mara:postgres_image .scripts/docker/postgres

docker-run-postgres:
	docker run -i -t --rm --name mara-postgres -v $(shell pwd)/.pg_data:/var/lib/postgresql/data -p 5433:5432 mara:postgres_image -c 'config_file=/etc/postgresql/postgresql.conf'
