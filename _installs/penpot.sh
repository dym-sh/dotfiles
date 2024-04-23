#!/bin/sh

mkdir -p /Forks/penpot/
cd /Forks/penpot/

wget https://raw.githubusercontent.com/penpot/penpot/main/docker/images/docker-compose.yaml

docker compose \
	-p penpot \
	-f docker-compose.yaml \
	up -d


# upd after editing yaml
docker compose down
docker compose \
	-p penpot \
	-f docker-compose.yaml \
	up -d
