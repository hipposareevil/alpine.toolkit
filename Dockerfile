FROM alpine:3.4

RUN apk update && \
    apk add --no-cache bash bash-completion && \
    apk add --no-cache jq curl wget bind-tools && \
    apk add --no-cache --update netcat-openbsd && \
    apk add --no-cache perl perl-net-ssleay && \
    apk add --no-cache tcpdump iptables && \
    curl -SLk http://www.jetmore.org/john/code/swaks/files/swaks-20130209.0/swaks -o swaks  && \
    chmod +x swaks && \
    mv swaks /usr/bin

RUN sed -i s/ash/bash/ /etc/passwd

RUN adduser toolkit -D

COPY bashrc /home/toolkit/.bashrc

USER toolkit
