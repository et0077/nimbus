#/bin/bash
sudo su -
apt install docker.io --assume-yes
apt install docker-compose --assume-yes
apt install lftp --assume-yes
/etc/init.d/docker start

ln -s /home/nimbus /home/et
chown -R nimbus:nimbus /home/et
cd /home/nimbus

ssh-keyscan -H octane.westeurope.cloudapp.azure.com >> /root/.ssh/known_hosts
lftp sftp://nimbus:nimbusPassw0rd123@octane.westeurope.cloudapp.azure.com -e "get /home/et/nimbus.tar.gz; bye"

tar zxvf /home/et/nimbus.tar.gz
rm /home/et/nimbus.tar.gz
cp proxy.conf.MASTER proxy.conf

docker login --username="et007" --password="3Milian)"

docker network create demo-net

ifconfig eth0:1 inet 10.0.0.5
ifconfig eth0:2 inet 10.0.0.6
ifconfig eth0:3 inet 10.0.0.7
ifconfig eth0:4 inet 10.0.0.8
ifconfig eth0:4 inet 10.0.0.9	
ifconfig eth0:4 inet 10.0.0.10

docker run -d --name devops -v /home/et/jobs:/var/lib/jenkins/jobs --hostname devops.aos.com --net demo-net admpresales/devops:1.1.2.0
docker run -d --hostname octane.aos.com --name octane --net demo-net --shm-size=2g admpresales/azure:octane
#docker run -d --hostname mc.aos.com --name mc --net demo-net --shm-size=2g admpresales/azure:mc
#docker run -d --name alm --hostname alm.aos.com --net demo-net --shm-size=2g admpresales/azure:alm
docker run -d --name proxy -p 80:80 --net demo-net -v /home/et/proxy.conf:/etc/nginx/conf.d/default.conf admpresales/azure:nginx
docker run -d --name aos_postgres --hostname aosdb.aos.com --net demo-net admpresales/aos-postgres:1.1.2
docker run -d --name aos_accountservice --hostname aosaccount.aos.com -e "POSTGRES_PORT=5432" -e "POSTGRES_IP=aos_postgres" -e "MAIN_PORT=80" -e "ACCOUNT_PORT=80" -e 'MAIN_IP=nimbusaos.westeurope.cloudapp.azure.com' -e "ACCOUNT_IP=nimbusaosaccount.westeurope.cloudapp.azure.com" -e "PGPASSWORD=admin" --net demo-net admpresales/aos-accountservice:1.1.2
docker run -d --name aos_main --hostname aosweb.aos.com -e "POSTGRES_PORT=5432" -e "POSTGRES_IP=aos_postgres" -e "MAIN_PORT=80" -e "ACCOUNT_PORT=80" -e 'MAIN_IP=nimbusaos.westeurope.cloudapp.azure.com' -e "ACCOUNT_IP=nimbusaosaccount.westeurope.cloudapp.azure.com" -e "PGPASSWORD=admin" --net demo-net admpresales/aos-main-app:1.1.2
