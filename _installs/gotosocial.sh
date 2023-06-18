mkdir -p /gotosocial/storage/certs

wget 'https://github.com/superseriousbusiness/gotosocial/releases/download/v0.5.2/gotosocial_0.5.2_linux_amd64.tar.gz'
tar -xzf gotosocial_

cp ./example/config.yaml .
nano ./config.yaml

./gotosocial --config-path ./config.yaml server start

./gotosocial --config-path ./config.yaml admin account create --username dym --email dym@dym.sh --password '!gts_pass_123'

./gotosocial --config-path ./config.yaml admin account promote --username dym


sudo useradd -r gotosocial
sudo groupadd gotosocial
sudo usermod -a -G gotosocial gotosocial
sudo chown -R gotosocial:gotosocial /gotosocial

sudo cp /gotosocial/example/gotosocial.service /etc/systemd/system/
sudo systemctl enable --now gotosocial.service


curl -L https://dym.sh/.well-known/webfinger\?resource\=acct:dym@dym.com

