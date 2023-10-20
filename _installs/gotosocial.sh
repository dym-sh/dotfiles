
mkdir -p /gotosocial/storage/certs
cd  /gotosocial

wget 'https://github.com/superseriousbusiness/gotosocial/releases/download/v0.10.0-rc3/gotosocial_0.10.0-rc3_linux_amd64.tar.gz'
tar -xf gotosocial_*

cp ./example/config.yaml .
nano ./config.yaml

./gotosocial --config-path ./config.yaml server start

./gotosocial --config-path ./config.yaml admin account create --username dym --email dym@dym.sh --password '!TEST_123'

./gotosocial --config-path ./config.yaml admin account promote --username dym


useradd -r gotosocial
groupadd gotosocial
usermod -a -G gotosocial gotosocial
chown -R gotosocial:gotosocial /gotosocial

cp /gotosocial/example/gotosocial.service /etc/systemd/system/
systemctl enable --now gotosocial.service
killall gotosocial
# nohup ./gotosocial --config-path ./config.yaml server start  </dev/null &
systemctl start gotosocial.service


curl -L 'https://dym.sh/.well-known/webfinger?resource=acct:dym@dym.sh'
