FROM alpine:3.5

MAINTAINER Nguyễn Hồng Quân <ng.hong.quan@gmail.com>


RUN apk --update add sudo && \
    apk add python3 openssl ca-certificates build-base redis postgresql && \
    apk add postgresql-dev libffi-dev python3-dev jpeg-dev && \
    pip3 install -U pip && pip3 install ansible && \
    mkdir -p /etc/ansible && echo 'localhost' > /etc/ansible/hosts && \
    rm -rf /var/cache/apk/* && rm -r /root/.cache
