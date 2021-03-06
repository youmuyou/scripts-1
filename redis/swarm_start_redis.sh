#! /bin/bash

docker service create \
	--name redis \
	--hostname redis \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--endpoint-mode dnsrr \
	--user 1000:1000 \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,source=/data/redis,target=/data \
	redis redis-server --appendonly yes
