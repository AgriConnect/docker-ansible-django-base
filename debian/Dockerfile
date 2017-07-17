FROM debian:9

MAINTAINER Nguyễn Hồng Quân <ng.hong.quan@gmail.com>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen
ENV LANG=en_US.UTF-8
# Ref: https://github.com/William-Yeh/docker-ansible/
RUN apt-get install -y rsync wget python3-pip && \
    apt-get install -y sshpass openssh-client openssl ca-certificates && \
    apt-get install -y libpq-dev libffi-dev python3-dev libjpeg-dev && \
    pip3 install -U pip wheel && pip3 install cffi && \
    pip3 install cryptography && pip3 install ansible && \
    pip3 install Pillow psycopg2 pytest-flakes pytest-django && \
    mkdir -p /etc/ansible && echo 'localhost' > /etc/ansible/hosts && \
    rm -rf /var/cache/apt/* && rm -rf /root/.cache/pip
