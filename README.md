# SEEDRS demo application with Rails 6, GRAPE API and Docker

This app demonstrates Rails 6 with PostgreSQL, all running in Docker.

## Initial setup
copy ```config/example.database.yml``` file and create ```database.yml``` inside ```config``` directory, then run this command
```
docker compose build
docker compose run --rm web bin/rails db:setup
```
## Running the Rails app
```
docker compose up
```
## Seed campaign data into database
```
docker-compose run web rake db:seed
```
## Running the Rails console
When the app is already running with docker-compose up, attach to the container:
```
docker compose exec web bin/rails c
```
## When no container running yet, start up a new one:
```
docker compose run --rm web bin/rails c
```
## Running tests
```
docker compose run --rm web bundle exec rspec
```
