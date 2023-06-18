

# from https://github.com/X3n0m0rph59/eruption

sudo add-apt-repository -y \
  ppa:x3n0m0rph59/eruption
sudo apt update -y
sudo apt install -y \
  eruption

systemctl --user enable --now eruption-audio-proxy.service
systemctl --user enable --now eruption-process-monitor.service

sudo systemctl enable --now eruption.service

