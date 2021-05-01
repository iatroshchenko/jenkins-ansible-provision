init: docker-down docker-pull docker-build docker-up
up: docker-up
down: docker-down

sh:
	docker-compose exec jenkins bash

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down -v --remove-orphans

docker-pull:
	docker-compose pull --include-deps

docker-build:
	docker-compose build

password:
	docker-compose exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
