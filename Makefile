IMAGE_NAME = nginx-img 
CONTAINER_NAME = nginx-container

list =  $(shell docker ps -aq)
build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run --init --name $(CONTAINER_NAME) -dp 127.0.0.1:3000:3000 $(IMAGE_NAME)

cclean:
	docker stop $(list)
	docker rm $(list)

clean:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)

rebuild: clean build run