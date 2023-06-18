sudo apt update -y
sudo apt upgrade -y
sudo apt install -y \
  software-properties-common

sudo add-apt-repository -y \
  ppa:deadsnakes/ppa

sudo apt update -y
sudo apt install -y \
  python3.11 \
  python3.11-full

sudo ln -s `which python3.11` \
  /usr/bin/python3 \
  --force

curl -sS https://bootstrap.pypa.io/get-pip.py | sudo python3.11

python --version
pip --version
