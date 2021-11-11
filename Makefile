init:
	docker-compose build app
	docker-compose run --rm app bundle install
	docker-compose run --rm app yarn install
	docker-compose up -d
	docker-compose run --rm app bundle exec rails db:create
	docker-compose down
