#!/usr/bin/zsh


wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb \
  -O packages-microsoft-prod.deb
sudo dpkg -i \
  packages-microsoft-prod.deb
# rm packages-microsoft-prod.deb

sudo apt-get update
sudo apt-get install -y \
  dotnet-sdk-7.0 \
  aspnetcore-runtime-7.0


sudo apt install gnupg ca-certificates
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu nightly-focal main" \
  | sudo tee /etc/apt/sources.list.d/mono-official-nightly.list
echo "deb https://download.mono-project.com/repo/ubuntu preview-focal main" \
  | sudo tee /etc/apt/sources.list.d/mono-official-preview.list
sudo apt update

