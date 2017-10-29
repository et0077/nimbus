#/bin/bash
CONTAINER_NAME='leanft'
while true
do
        CID=$(docker ps -q -f status=running -f name=^/${CONTAINER_NAME}$)
        if [ ! "${CID}" ]; then
                docker rm -f leanft
                docker run -d --name leanft -p 5900:5900 -e LFT_LIC_SERVER=autopass -e LFT_LIC_ID=23078 -e VERBOSE=true --net demo-net  functionaltesting/leanft-chrome:14.01
        fi
        unset CID
done
