#/bin/bash
dockerLogin=$(cat /home/nimbus/dockerLogin )
dockerPSW=$(cat /home/nimbus/dockerPSW )
cat /home/nimbus/docker.sh | sed  "s/e.tizzoni/$dockerLogin/g"  > /home/nimbus/newDocker.sh
cat /home/nimbus/newDocker.sh | sed  "s/PASSWORD/$dockerPSW/g"  > /home/nimbus/docker.sh
