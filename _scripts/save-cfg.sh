rm -rf /Site/config/desktop-ubuntu
sudo cp -r /Cfg /Site/config/desktop-ubuntu
sudo chown -R $USER:$USER /Site/config/desktop-ubuntu/
cd /Site/config/desktop-ubuntu/
git add .
shipit
