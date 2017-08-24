FROM ubuntu
ADD scripts /scripts

FROM registry.aliyuncs.com/acs/alpine
MAINTAINER wbs9399@sina.com

RUN apk --update add curl iproute2 tcpdump docker ethtool drill bridge-utils && mv /usr/sbin/tcpdump /bin/tcpdump

COPY --from=0 /scripts /scripts

RUN curl -sSL https://releases.hashicorp.com/serf/0.8.0/serf_0.8.0_linux_amd64.zip > serf.zip && unzip -d /usr/bin/ serf.zip && rm -f serf.zip

VOLUME ["/var/run/netns"]

ENTRYPOINT ["/bin/sh"]
