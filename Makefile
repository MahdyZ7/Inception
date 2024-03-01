list =  $(shell docker ps -aq)
build:
	mkdir -p /home/$(USER)/data/mariadb
	mkdir -p /home/$(USER)/data/wordpress
	docker compose -f ./srcs/docker-compose.yml up --build

down:
	docker compose -f ./srcs/docker-compose.yml down

restart:
	docker compose -f ./srcs/docker-compose.yml restart

all: build

cclean:
	docker stop $(list)
	docker rm $(list)

prune:
	yes | docker system prune -a 
	yes | docker volume prune
	rm -rf /home/$(USER)/data


rebuild: clean build run