#/bin/bash
apt install docker.io --assume-yes
apt install docker-compose --assume-yes
/etc/init.d/docker start

docker login --username=et007 --password=3Milian)

docker network create demo-net

ln -s /home/nimbus /home/et
chown -R nimbus:nimbus /home/et

ifconfig eth0:1 inet 10.0.0.5
ifconfig eth0:2 inet 10.0.0.6
ifconfig eth0:3 inet 10.0.0.7
ifconfig eth0:4 inet 10.0.0.8
ifconfig eth0:4 inet 10.0.0.9	
ifconfig eth0:4 inet 10.0.0.10

docker run -d --name proxy -p 80:80 --net demo-net admpresales/azure:nginx
