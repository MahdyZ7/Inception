# Syntax=docker/dockerfile:1

FROM debian:bullseye

USER root

RUN apt update && apt upgrade -y
RUN apt install mariadb-server mariadb-client -y

COPY . .
RUN chmod +x ./tools/mariadb-set.sh
CMD ["./tools/mariadb-set.sh"]

