#!/usr/bin/zsh

sudo apt-get remove -y \
  python3-cryptography

pip3 install \
  certbot \
  cryptography


certbot certonly \
  -d 'source.garden' \
  -d '*.source.garden' \
  --email 'certbot+source.garden@dym.sh' \
  --agree-tos \
  --manual-public-ip-logging-ok \
  --renew-by-default \
  --rsa-key-size 4096 \
  --no-bootstrap \
  --manual \
  --preferred-challenges dns-01 \
  --server https://acme-v02.api.letsencrypt.org/directory


certbot certonly \
  -d 'dym.sh' \
  -d '*.dym.sh' \
  --email 'certbot+dym.sh@dym.sh' \
  --agree-tos \
  --manual-public-ip-logging-ok \
  --renew-by-default \
  --rsa-key-size 4096 \
  --no-bootstrap \
  --manual \
  --preferred-challenges dns-01 \
  --server https://acme-v02.api.letsencrypt.org/directory


# check every month and on server-restart
echo '
# letsencrypt renews
1 1 1 * * letsencrypt renew --nginx --quiet
@reboot letsencrypt renew --nginx --quiet
' >> /etc/crontab

#
systemctl restart cron.service
