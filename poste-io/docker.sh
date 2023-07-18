#!/usr/bin/zsh

# remove old versions
sudo apt-get remove -y \
  docker docker-engine \
  docker.io containerd runc


# install surrounding necessities
sudo apt-get update -y

sudo apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  lsb-release


# docker.com key file
curl -fsSL 'https://download.docker.com/linux/ubuntu/gpg' \
  | sudo gpg --dearmor -o \
    '/usr/share/keyrings/docker-archive-keyring.gpg'


# # the `lsb_release` prints linux-mint's codename
# # of which docker has no idea, so
U='UBUNTU_CODENAME='
DISTRO=`cat '/etc/os-release' | grep "$U"`
if [ ! -z "$DISTRO" ]; then
  DISTRO="${DISTRO/$U/}"
else
  DISTRO=`lsb_release -cs`
fi
echo "DISTRO: '$DISTRO'"

# add docker apt
echo "
deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
https://download.docker.com/linux/ubuntu \
$DISTRO stable \
" | sudo tee /etc/apt/sources.list.d/docker.list


# update sources
sudo apt-get update -y

# check avaliable versions
apt-cache \
  madison docker-ce

# install docker
sudo apt-get install -y \
  docker-ce docker-ce-cli containerd.io docker-compose


# manage rootless
sudo groupadd docker
sudo usermod -aG docker $USER
# logout from command line (open new terminal tab/window)
newgrp docker
docker run hello-world

# ubuntu desktop
curl https://desktop-stage.docker.com/linux/main/amd64/77103/docker-desktop.deb --output docker-desktop.deb
sudo apt-get install ./docker-desktop.deb
systemctl --user start docker-desktop




# image of OSX
# 40GB disk space required: 20GB original image 20GB your container.
docker pull sickcodes/docker-osx:auto

# boot directly into a real OS X shell with a visual display [NOT HEADLESS]
docker run -it \
    --device /dev/kvm \
    -p 50922:10022 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e "DISPLAY=${DISPLAY:-:0.0}" \
    -e GENERATE_UNIQUE=true \
    sickcodes/docker-osx:auto

# username is user
# passsword is alpine
