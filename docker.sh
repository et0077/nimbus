#/bin/bash
sudo su -
apt install docker.io --assume-yes
apt install docker-compose --assume-yes
apt install lftp --assume-yes
/etc/init.d/docker start

cd /home/nimbus

git clone https://github.com/et0077/nimbus.git
mv /home/nimbus/nimbus/* /home/nimbus/

#ssh-keyscan -H octane.westeurope.cloudapp.azure.com >> /root/.ssh/known_hosts
#lftp sftp://nimbus:nimbusPassw0rd123@octane.westeurope.cloudapp.azure.com -e "get /home/nimbus/nimbus.tar.gz; bye"
#tar zxvf /home/nimbus/nimbus.tar.gz
#rm /home/nimbus/nimbus.tar.gz

cp proxy.conf.MASTER proxy.conf

docker login --username="et007" --password="3Milian)"

docker network create demo-net

ifconfig eth0:1 inet 10.0.0.5
ifconfig eth0:2 inet 10.0.0.6
ifconfig eth0:3 inet 10.0.0.7
ifconfig eth0:5 inet 10.0.0.8
ifconfig eth0:6 inet 10.0.0.9
ifconfig eth0:7 inet 10.0.0.10

./changeProxy.sh

docker run -d --name aos_postgres --hostname aosdb.aos.com --net demo-net admpresales/aos-postgres:1.1.2

./launchAOS.sh
./launchAOSnew2

docker run -d --name devops -v /home/nimbus/AOSWEBUndeploy.xml:/var/lib/jenkins/jobs/AOS_Web_Undeploy_Root/config.xml -v /home/nimbus/AOSWEBDeploy.xml:/var/lib/jenkins/jobs/AOS_Web_Deploy_Root/config.xml -v /home/nimbus/AOSOctane.xml:/var/lib/jenkins/jobs/octane-update-apikey-util/config.xml -v /home/nimbus/AOSWEBBuildRoot.xml:/var/lib/jenkins/jobs/AOS_Web_Build_Root/config.xml -v /home/nimbus/AOSWEBRegression.xml:/var/lib/jenkins/jobs/AOS_Web_Regression_Test/config.xml -p 2022:22 --hostname devops.aos.com --net demo-net admpresales/devops:1.1.2.0
docker run -d --hostname octane.aos.com --name octane --net demo-net --shm-size=2g admpresales/azure:octane
#docker run -d --hostname mc.aos.com --name mc --net demo-net --shm-size=2g admpresales/azure:mc
#docker run -d --name alm --hostname alm.aos.com --net demo-net --shm-size=2g admpresales/azure:alm
#docker run -d --hostname autopass.aos.com --name autopass --net demo-net --restart=always admpresales/autopass:9.3_v2
docker run -d --name proxy -p 80:80 --net demo-net -v /home/nimbus/proxy.conf:/etc/nginx/conf.d/default.conf admpresales/azure:nginx
