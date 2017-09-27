#!/bin/sh
set +x
network=$1
ip_list=`docker network inspect -f '{{range $key, $value := .Containers}} {{$value.IPv4Address}} {{"\n"}} {{end}}' $network`
issue=0
for ip in $ip_list; do
  #echo $ip | cut -d '/' -f 1
  if ! echo $ip | cut -d '/' -f 1 | xargs ping -w1 -c1 > /dev/null; then
    issue=$(( $issue + 1 ));
    echo `ip route get $ip | awk '/src/{print $NF}'`"->"${ip} ping have issue;
  fi
done
exit $issue
