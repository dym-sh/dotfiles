#!/usr/bin/zsh

# rust & co

# install road-1
sudo apt install -y \
  cmake pkg-config python3 \
  openssl libssl1.1 libssl-dev \
  libfreetype6-dev \
  libfontconfig1-dev \
  libxcb-xfixes0-dev \
  libdbus-1-dev

  # libgtk-3-dev \
  # libgtksourceview-4.0-dev \
  # webkit2gtk-4.0 \
  # libappindicator3-dev \
  # libwebkit2gtk-4.0-dev \
  # libudev-dev \
  # libevdev-dev \
  # libhidapi-dev \
  # liblua5.4-dev


# install road-2
curl --proto '=https' --tlsv1.2 -sSf \
  https://sh.rustup.rs \
  | sh -s -- --default-toolchain none -y

source $HOME/.cargo/env

rustup toolchain install nightly \
  --allow-downgrade \
  --profile minimal \
  --component clippy

rustup default nightly

env LIBSSH2_SYS_USE_PKG_CONFIG='' \
  cargo install \
    cargo-update

## cargo apps
cargo install \
  xh bat exa fd-find \
  broot jql sd \
  xargo
