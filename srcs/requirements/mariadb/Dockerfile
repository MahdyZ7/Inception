# Syntax=docker/dockerfile:1

FROM debian:bullseye

USER root

RUN apt-get update && apt-get upgrade -y
RUN apt-get install mariadb-server mariadb-client -y

COPY . .
RUN chmod +x ./tools/mariadb-set.sh
CMD ["./tools/mariadb-set.sh"]

