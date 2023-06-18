#!/usr/bin/zsh

# OpenGL
sudo apt-get install -y \
  ibus ibus-data ibus-gtk ibus-gtk3 \
  libegl1-mesa libgl1-mesa-glx \
  libxcb-xtest0 python3-ibus-1.0

# nvidia vulkan support
sudo add-apt-repository -y \
  ppa:graphics-drivers/ppa

sudo apt upgrade -y
sudo apt install -y \
  vulkan-tools

sudo nvidia-xconfig \
  -a --cool-bits=28 \
  --allow-empty-initial-configuration

sudo apt-mark hold 'nvidia-*'


# ffmpeg for nvidia

git clone  --depth 1 \
  'https://git.videolan.org/git/ffmpeg/nv-codec-headers.git'
cd nv-codec-headers

sudo make install

sudo apt-get install -y \
  build-essential \
  yasm \
  cmake \
  libtool \
  libc6 \
  libc6-dev \
  unzip  \
  wget \
  libnuma1 \
  libnuma-dev

cd ../
git clone  --depth 1 \
  'https://git.ffmpeg.org/ffmpeg.git'
cd ./ffmpeg


./configure \
  --enable-nonfree \
  --enable-cuda-nvcc \
  --enable-libnpp \
  --extra-cflags=-I/usr/local/cuda/include \
  --extra-ldflags=-L/usr/local/cuda/lib64 \
  --disable-static \
  --enable-shared

make -j 8

sudo make install
