#/bin/bash
Jenkins=$(cat /home/nimbus/DNSJenkins )
Octane=$(cat /home/nimbus/DNSOctane )
AOS=$(cat /home/nimbus/DNSAOS )
MC=$(cat /home/nimbus/DNSMC )
ALM=$(cat /home/nimbus/DNSALM )
AOSA=$(cat /home/nimbus/DNSAOSAccount )
DNS=$(cat /home/nimbus/DNS )
cat /home/nimbus/proxy.conf | sed  "s/application/$AOS/g"  > /home/nimbus/proxynew
cat /home/nimbus/proxynew | sed  "s/account/$AOSA/g" > /home/nimbus/proxy.conf
cat /home/nimbus/proxy.conf | sed  "s/hpejenkins/$Jenkins/g"  > /home/nimbus/proxynew
cat /home/nimbus/proxynew | sed  "s/octane/$Octane/g" > /home/nimbus/proxy.conf
cat /home/nimbus/proxy.conf | sed  "s/hpemobile/$MC/g"  > /home/nimbus/proxynew
cat /home/nimbus/proxynew | sed  "s/hpealm/$ALM/g" > /home/nimbus/proxy.conf
cat /home/nimbus/proxy.conf | sed  "s/westeurope/$DNS/g"  > /home/nimbus/proxynew
cp /home/nimbus/proxynew /home/nimbus/proxy.conf
