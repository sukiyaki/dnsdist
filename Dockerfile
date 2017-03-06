FROM debian:jessie
MAINTAINER Sukiyaki Project <noc@sukiyaki.ski>

ADD dnsdist.list /etc/apt/sources.list.d/dnsdist.list
ADD dnsdist /etc/apt/preferences.d/dnsdist
ADD FD380FBB-pub.asc /
RUN apt-key add /FD380FBB-pub.asc \
 && apt-get update \
 && apt-get install -y dnsdist \
 && rm -rf /var/lib/apt/lists/* \
 && rm /FD380FBB-pub.asc

EXPOSE 53/tcp 53/udp
CMD ["/usr/bin/dnsdist"]
