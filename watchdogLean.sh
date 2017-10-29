#/bin/bash
NumberImages=$(cat /home/nimbus/ImagesNumber)
while true
do
        Number=$(docker ps |wc -l)
        if [ $Number -ne $NumberImages ] ;
        then
                echo "different"
                echo $Number
                echo "file " $NumberImages
                sleep 5
        else
                echo "OK"
                sleep 5
                echo $Number
                echo "file " $NumberImages
        fi
done
