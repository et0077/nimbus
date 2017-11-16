#/bin/bash
for pid in `ps -ef |grep su|grep -v grep|grep -v sudo|awk {'print $2'}`; do kill -9 $pid; done
