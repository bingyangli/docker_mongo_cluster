sudo mkdir -p /home/core
cd /home/core

sudo openssl rand -base64 741 > mongodb-keyfile

ssh root@cfg3 'mkdir -p /home/core'
sudo scp /home/core/mongodb-keyfile root@cfg3:/home/core/

