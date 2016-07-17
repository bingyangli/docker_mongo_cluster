sudo mkdir -p /home/core
cd /home/core

sudo openssl rand -base64 741 > mongodb-keyfile

ssh root@cfg3 'mkdir -p /home/core'
sudo scp /home/core/mongodb-keyfile root@cfg3:/home/core/

cd /home/core/
sudo chmod 400 mongodb-keyfile
sudo chown 999 mongodb-keyfile

