FROM registry.aliyuncs.com/acs-sample/ubuntu:14.04
MAINTAINER wbs9399@sina.com

RUN apt-get update && apt-get install -y curl tcpdump dnsutils iptables ethtool bridge-utils && rm -rf /var/lib/apt/lists/*

VOLUME ["/var/run/netns"]

RUN curl -sSL http://acs-public-mirror.oss-cn-hangzhou.aliyuncs.com/docker-engine/internet | sh - 

ENTRYPOINT ["/bin/bash"]
