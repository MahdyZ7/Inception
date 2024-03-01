list =  $(shell docker ps -aq)
build:
	mkdir -p /home/$(USER)/data/mariadb
	mkdir -p /home/$(USER)/data/wordpress
	docker compose ./srcs/docker-compose up --build

run:
	docker compose up

cclean:
	docker stop $(list)
	docker rm $(list)

prune:
	yes | docker system prune -a 
	yes | docker volume prune
	rm -rf /home/$(USER)/data


rebuild: clean build run