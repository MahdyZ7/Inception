list =  $(shell docker ps -aq)

build:
	mkdir -p /home/$(USER)/data/mariadb
	mkdir -p /home/$(USER)/data/wordpress
	docker compose -f ./srcs/docker-compose.yml up --build

up:
	docker compose -f ./srcs/docker-compose.yml up

down:
	docker compose -f ./srcs/docker-compose.yml down

restart:
	docker compose -f ./srcs/docker-compose.yml restart

all: up

cclean:
	if [ "$(docker ps -aq)" ]; then docker stop $(docker ps -aq); fi
	if [ "$(docker ps -aq)" ]; then docker rm $(docker ps -aq); fi

prune: cclean
	yes | docker system prune -a 
	yes | docker volume prune
	rm -rf /home/$(USER)/data


rebuild: clean build run