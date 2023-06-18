#!/usr/bin/zsh

apt install ssh

nano /etc/ssh/sshd_config
```cfg
Match group sftp
ChrootDirectory /home
X11Forwarding no
AllowTcpForwarding no
ForceCommand internal-sftp
```

systemctl restart ssh
addgroup sftp
useradd -m sftpuser -g sftp
passwd sftpuser
chmod 700 /home/sftpuser/

sftp sftpuser@127.0.0.1

open sftp://127.0.0.1