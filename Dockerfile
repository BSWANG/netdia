FROM registry.aliyuncs.com/acs/alpine
MAINTAINER wbs9399@sina.com

RUN  apk --update add iproute2 tcpdump docker

VOLUME ["/var/run/netns"]

ENTRYPOINT ["/bin/sh"]
