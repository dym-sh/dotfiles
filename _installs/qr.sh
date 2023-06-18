i \
	autoconf \
	automake \
	autotools-dev \
	libtool \
	pkg-config \
	libpng-dev


git clone --depth 1 \
  https://github.com/fukuchi/libqrencode.git

cd libqrencode

./configure
make
sudo make install
sudo ldconfig
