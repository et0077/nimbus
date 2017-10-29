#/bin/bash
NumberImages=$(cat /home/nimbus/ImagesNumber)
while true
do
        Number=$(docker ps |wc -l)
        if [ $Number -ne $NumberImages ] ;
        then
                docker run -d --name leanft -p 5900:5900 -e LFT_LIC_SERVER=autopass -e LFT_LIC_ID=23078 -e VERBOSE=true --net demo-net  functionaltesting/leanft-chrome:14.01
                sleep 5
        else
                sleep 5
        fi
done
