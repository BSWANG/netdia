#!/bin/sh
set +x
service=$1
ip_list=`nslookup tasks.$service 2>&1 | awk '/^Address/{print $3}'`
issue=0
for ip in $ip_list; do
  #echo $ip | cut -d '/' -f 1
  if ! echo $ip | cut -d '/' -f 1 | xargs ping -w1 -c1 > /dev/null; then
    issue=$(( $issue + 1 ));
    echo `date`" "`ip route get $ip | awk '/src/{print $NF}'`"->"${ip} ping have issue;
  fi
done
exit $issue
