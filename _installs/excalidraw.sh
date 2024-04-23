#!/bin/sh

mkdir -p  /var/www/excalidraw/
cd /var/www/excalidraw/
git clone https://github.com/excalidraw/excalidraw.git .

yarn
yarn start
# OR
docker-compose up --build -d


# OR
docker build -t excalidraw/excalidraw .
docker run --rm -dit --name excalidraw -p 5000:80 excalidraw/excalidraw:latest
