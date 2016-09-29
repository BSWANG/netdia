FROM registry.aliyuncs.com/acs/alpine
MAINTAINER wbs9399@sina.com

RUN  apk --update add iproute2 && apk --update add tcpdump

VOLUME ["/var/run/netns"]

RUN curl -sSL http://acs-public-mirror.oss-cn-hangzhou.aliyuncs.com/docker-engine/internet
 | sh -

ENTRYPOINT ["/bin/sh"]
