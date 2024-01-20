sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y \
  software-properties-common

sudo add-apt-repository -y \
  ppa:deadsnakes/ppa

sudo apt-get update -y
sudo apt-get install -y \
  python3.11 \
  python3.11-full

sudo ln -s `which python3.11` \
  /usr/bin/python3 \
  --force

curl -sS https://bootstrap.pypa.io/get-pip.py | sudo python3.11

python --version
pip --version


# OR


wget https://www.python.org/ftp/python/3.12.1/Python-3.12.1.tgz
tar -xzvf Python-3.12.1.tgz
cd Python-3.12.1/
./configure --enable-optimizations
make -j `nproc`
make altinstall
python3.12 -V
ln -s /usr/local/bin/python3.12 /usr/local/bin/python

