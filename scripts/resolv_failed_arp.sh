#!/bin/sh
eval $(ip neigh | grep FAILED | awk '{out="";for(i=1;i<NF;i++)out=out$i" "; split($1,ip,"."); printf("ip neigh change %s lladdr 02:42:%x:%x:%x:%x;\n", out, ip[1], ip[2], ip[3], ip[4])}')

