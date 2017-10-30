#/bin/bash
AOS=$(cat /home/nimbus/DNSAOS )
AOSA=$(cat /home/nimbus/DNSAOSAccount )
DNS=$(cat /home/nimbus/DNS )
Octane=$(cat /home/nimbus/DNSOctane )
Jenkins=$(cat /home/nimbus/DNSJenkins )
cat /home/nimbus/launchAOS | sed  "s/nimbusaos/$AOS/g"  > /home/nimbus/launchAOSnew
cat /home/nimbus/launchAOSnew | sed  "s/applicationaccount/$AOSA/g" >> /home/nimbus/launchAOSnewtemp
cat /home/nimbus/launchAOSnewtemp | sed  "s/westeurope/$DNS/g" >> /home/nimbus/launchAOSnew2
cat /home/nimbus/AOSWEBUndeploy.xml | sed  "s/aos.westeurope.cloudapp.azure.com/$AOS.$DNS.cloudapp.azure.com/g" > /home/nimbus/AOSWEBUndeployNew.xml
cp /home/nimbus/AOSWEBUndeployNew.xml /home/nimbus/AOSWEBUndeploy.xml
cat /home/nimbus/AOSWEBDeploy.xml | sed  "s/aos.westeurope.cloudapp.azure.com/$AOS.westeurope.cloudapp.azure.com/g" > /home/nimbus/AOSWEBDeployNew.xml
cat /home/nimbus/AOSWEBDeployNew.xml | sed  "s/sis.westeurope.cloudapp.azure.com/$AOSA.westeurope.cloudapp.azure.com/g" > /home/nimbus/AOSWEBDeploy.xml
cat /home/nimbus/AOSWEBDeploy.xml | sed  "s/westeurope/$DNS/g" > /home/nimbus/AOSWEBDeployNew.xml
cp /home/nimbus/AOSWEBDeployNew.xml /home/nimbus/AOSWEBDeploy.xml
cat /home/nimbus/AOSOctane.xml | sed  "s/octane:8080/$Octane.$DNS.cloudapp.azure.com/g" > /home/nimbus/AOSOctaneNew.xml
cp /home/nimbus/AOSOctaneNew.xml /home/nimbus/AOSOctane.xml
cat /home/nimbus/JenkConfig.xml | sed  "s/nimbusserver:8090/$Jenkins.$DNS.cloudapp.azure.com/g" > /home/nimbus/JenkConfigNew.xml
cp /home/nimbus/JenkConfigNew.xml /home/nimbus/JenkConfig.xml
cat /home/nimbus/OctanePluging.xml | sed  "s/octane:8080/$Octane.$DNS.cloudapp.azure.com/g" > /home/nimbus/OctanePlugingNew.xml
cp /home/nimbus/OctanePlugingNew.xml /home/nimbus/OctanePluging.xml
