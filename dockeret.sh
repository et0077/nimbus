#/bin/bash
sudo su -
apt install docker.io --assume-yes
apt install docker-compose --assume-yes
/etc/init.d/docker start

cd /home/nimbus

git clone https://github.com/et0077/nimbus.git
mv /home/nimbus/nimbus/* /home/nimbus/
chmod +x /home/nimbus/changeProxy.sh
chmod +x /home/nimbus/launchAOS.sh
chmod +x /home/nimbus/launchAOSnew2
chmod +x /home/nimbus/calcimage.sh
chmod +x /home/nimbus/watchdogLean.sh
rm -r /home/nimbus/nimbus/

cp proxyet.conf proxy.conf

docker login --username="et007" --password="3Milian)"

docker network create --subnet 172.50.0.0/16 --gateway 172.50.0.1  demo-net

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

docker run -d --name devops -p 2022:22 --hostname devops.aos.com --ip=172.50.10.5 --net demo-net admpresales/devops:1.1.2.0
docker exec devops useradd -m -p $(echo "nimbusPassw0rd123" | openssl passwd -1 -stdin) nimbus
docker exec devops chown -R nimbus:nimbus /GitRepo
docker stop devops
docker cp /home/nimbus/AOSWEBBuildRoot.xml devops:/var/lib/jenkins/jobs/AOS_Web_Build_Root/config.xml
docker cp /home/nimbus/AOSWEBBuildAll.xml devops:/var/lib/jenkins/jobs/AOS_Web_Build_All/config.xml
docker cp /home/nimbus/AOSOctane.xml devops:/var/lib/jenkins/jobs/octane-update-apikey-util/config.xml
docker cp /home/nimbus/AOSWEBDeploy.xml devops:/var/lib/jenkins/jobs/AOS_Web_Deploy_Root/config.xml
docker cp /home/nimbus/AOSWEBRegression.xml devops:/var/lib/jenkins/jobs/AOS_Web_Regression_Test/config.xml
docker cp /home/nimbus/AOSWEBUndeploy.xml devops:/var/lib/jenkins/jobs/AOS_Web_Undeploy_Root/config.xml
docker start devops
if grep -q Only /home/nimbus/SIZE
then
  docker run -d --hostname autopass.aos.com --ip=172.50.10.10 --name autopass --net demo-net --restart=always admpresales/autopass:9.3_v2
  docker run -d --name leanft -p 5900:5900 -e LFT_LIC_SERVER=autopass -e LFT_LIC_ID=23078 -e VERBOSE=true --net demo-net  functionaltesting/leanft-chrome:14.01
  docker run -d --name proxy -p 80:80 --net demo-net -v /home/nimbus/proxy.conf:/etc/nginx/conf.d/default.conf admpresales/azure:nginx
else
docker run -d --hostname octane.aos.com --name octane --ip=172.50.10.6 --net demo-net --shm-size=2g admpresales/azure:octane
docker run -d --hostname autopass.aos.com --ip=172.50.10.10 --name autopass --net demo-net --restart=always admpresales/autopass:9.3_v2
docker run -d --name leanft -p 5900:5900 -e LFT_LIC_SERVER=autopass -e LFT_LIC_ID=23078 -e VERBOSE=true --net demo-net  functionaltesting/leanft-chrome:14.01
docker run -d --name proxy -p 80:80 --net demo-net -v /home/nimbus/proxy.conf:/etc/nginx/conf.d/default.conf admpresales/azure:nginx
if grep -q ALM /home/nimbus/SIZE
then
  docker run -d --hostname mc.aos.com --name mc --ip=172.50.10.9 --net demo-net --shm-size=2g admpresales/azure:mc
  docker run -d --name alm --hostname alm.aos.com --ip=172.50.10.11 --net demo-net --shm-size=2g admpresales/azure:alm
else
  if grep -q MC /home/nimbus/SIZE
    then
      docker run -d --hostname mc.aos.com --name mc --ip=172.50.10.9 --net demo-net --shm-size=2g admpresales/azure:mc
  fi
fi
fi
./calcimage.sh
./watchdogLean.sh > /dev/null &
