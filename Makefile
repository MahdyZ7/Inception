Container_list =  $(shell docker ps -aq)
Image_list = $(shell docker images -aq)
Volume_list = $(shell docker volume ls -q)
Network_list = $(shell docker network ls -q)
  


build:
	mkdir -p /home/$(USER)/data/mariadb
	mkdir -p /home/$(USER)/data/wordpress
	docker compose -f ./srcs/docker-compose.yml up --build

up:
	docker compose -f ./srcs/docker-compose.yml up

down:
	docker compose -f ./srcs/docker-compose.yml down

clean:
	docker compose -f ./srcs/docker-compose.yml down --volumes --rmi all


restart:
	docker compose -f ./srcs/docker-compose.yml restart

all: build

cclean:
	if [ -n "$(Container_list)" ]; then docker stop $(Container_list); fi
	if [ -n "$(Container_list)" ]; then docker rm $(Container_list); fi
	if [ -n "$(Image_list)" ]; then docker rmi $(Image_list); fi
	if [ -n "$(Volume_list)" ]; then docker volume rm $(Volume_list); fi
	if [ -n "$(Network_list)" ]; then docker network rm $(Network_list); fi


prune: cclean
	yes | docker system prune -a --volumes --force --filter "until=24h"
	yes | docker volume prune --force --filter "until=24h"
	rm -rf /home/$(USER)/data

test:
	if [ -n "$(list)" ]; then \
		echo "hello"; \
	fi


rebuild: clean build run