curl -fsSL https://get.docker.com | sudo sh

docker run \
	--init \
	--sig-proxy=false \
	--name nextcloud-aio-mastercontainer \
	--restart always \
	--publish 8080:8080 \
	--env APACHE_PORT=11000 \
	--env APACHE_IP_BINDING=0.0.0.0 \
	--volume nextcloud_aio_mastercontainer:/mnt/docker-aio-config \
	--volume /var/run/docker.sock:/var/run/docker.sock:ro \
	nextcloud/all-in-one:latest


firefox 'https://<server>:8080'
