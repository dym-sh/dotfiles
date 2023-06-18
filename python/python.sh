#!/usr/bin/zsh

# get python3 and pip
sudo apt-get install -y \
  python3 python3-pip python-is-python3 \
  python3-dev build-essential

sudo ln -s /usr/bin/pip3 \
      /usr/local/bin/pip


sudo -H pip3 install -U pipenv

# upgdate all the already installed scripts
pip install \
  bpyutils pipupgrade

pipupgrade -y --pip --ignore-error \
  --pip-path `which pip3`


# scrapy
sudo apt install -y \
   libffi-dev libxml2-dev libxslt1-dev zlib1g-dev

pip install --no-cache-dir --upgrade \
  scrapy



# pycairo
sudo apt install -y \
   libcairo2-dev

pip install --no-cache-dir --upgrade --ignore-installed \
  pycairo



# pycurl
sudo apt install -y \
  libcurl4-openssl-dev libssl-dev

pip install --no-cache-dir --upgrade \
  pycurl


# PyGObject
sudo apt install -y \
  libgirepository1.0-dev

sudo pip3 install --no-cache-dir --upgrade \
  PyGObject


# Markdown
sudo pip3 install --no-cache-dir --upgrade \
  Markdown


# PyICU
#    Please install pkg-config on your system or set the ICU_VERSION environment
sudo pip3 install --no-cache-dir --upgrade --ignore-installed \
  PyICU


# protobuf
sudo pip3 install --no-cache-dir --upgrade --ignore-installed \
 protobuf


# packaging
sudo pip3 install --no-cache-dir --upgrade --ignore-installed \
  packaging


# pyparted
sudo apt install -y \
  libparted-dev

sudo pip3 install --no-cache-dir --upgrade \
  pyparted


# pycups
sudo apt install -y \
  libcups2-dev

pip install --no-cache-dir --upgrade \
  pycups


# priority
pip install --no-cache-dir --upgrade \
  priority


# dbus-python
sudo apt install -y \
  libdbus-1-dev libdbus-glib-1-dev

pip install --no-cache-dir --upgrade \
  dbus-python


# Updating 16 of 77 packages: httplib2
# bpyutils | 2022-06-18 15:49:23,472 | ERROR | Error executing command /usr/bin/pip3 install httplib2 --no-cache-dir --upgrade: ERROR: launchpadlib 1.10.13 requires testresources, which is not installed.

# Updating 52 of 77 packages: PyYAML
# bpyutils | 2022-06-18 15:51:56,735 | ERROR | Error executing command /usr/bin/pip3 install PyYAML --no-cache-dir --upgrade: ERROR: docker-compose 1.29.2 has requirement PyYAML<6,>=3.10, but you'll have pyyaml 6.0 which is incompatible.

# Updating 54 of 77 packages: requests
# bpyutils | 2022-06-18 15:52:02,919 | ERROR | Error executing command /usr/bin/pip3 install requests --no-cache-dir --upgrade: ERROR: docker-compose 1.29.2 has requirement PyYAML<6,>=3.10, but you'll have pyyaml 6.0 which is incompatible.

# Updating 65 of 77 packages: texttable
# bpyutils | 2022-06-18 15:52:22,270 | ERROR | Error executing command /usr/bin/pip3 install texttable --no-cache-dir --upgrade: ERROR: docker-compose 1.29.2 has requirement PyYAML<6,>=3.10, but you'll have pyyaml 6.0 which is incompatible.

# Updating 70 of 77 packages: urllib3
# bpyutils | 2022-06-18 15:52:33,215 | ERROR | Error executing command /usr/bin/pip3 install urllib3 --no-cache-dir --upgrade: ERROR: docker-compose 1.29.2 has requirement PyYAML<6,>=3.10, but you'll have pyyaml 6.0 which is incompatible.

