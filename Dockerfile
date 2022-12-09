FROM ubuntu:latest

MAINTAINER Charles Chin <eallions@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive 

ENV TZ="Asia/Shanghai"

VOLUME /tmp

ADD ./tmp /tmp

RUN apt-get update  \
        && dpkg -i /tmp/hugo.deb  \
        && apt-get install -yq tzdata wget git \
        && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
        && dpkg-reconfigure -f noninteractive tzdata \
        && apt-get autoremove \
        && apt-get clean \
        && rm /tmp/hugo.deb 
