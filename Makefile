include .env
export $(shell sed 's/=.*//' .env)

init: docker-down docker-pull docker-build docker-up
up: docker-up
down: docker-down

sh:
	docker-compose exec jenkins bash

ssh:
	ssh ${USER}@${HOST} -p ${PORT}

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down -v --remove-orphans

docker-pull:
	docker-compose pull --include-deps

docker-build:
	docker-compose build

password-local:
	docker-compose exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword

deploy:
	ssh ${USER}@${HOST} -p ${PORT} 'rm -rf jenkins && mkdir jenkins'
	scp -P ${PORT} docker-compose.production.yml ${USER}@${HOST}:jenkins/docker-compose.yml
	scp -P ${PORT} -r docker ${USER}@${HOST}:jenkins/docker
	ssh ${USER}@${HOST} -p ${PORT} 'cd jenkins && echo "COMPOSE_PROJECT_NAME=jenkins" >> .env'
	ssh ${USER}@${HOST} -p ${PORT} 'cd jenkins && docker-compose pull --include-deps'
	ssh ${USER}@${HOST} -p ${PORT} 'cd jenkins && docker-compose up --build --remove-orphans -d'
