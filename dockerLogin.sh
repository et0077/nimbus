#/bin/bash
dockerLogin=$(cat /home/nimbus/dockerLogin )
dockerPSW=$(cat /home/nimbus/dockerPSW )

docker login --username=$dockerLogin --password=$dockerPSW
