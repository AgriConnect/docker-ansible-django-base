FROM alpine:3.5

MAINTAINER Nguyễn Hồng Quân <ng.hong.quan@gmail.com>


# Ref: https://github.com/William-Yeh/docker-ansible/
RUN apk --update add su-exec && \
    apk add python3 build-base redis postgresql rsync && \
    apk add sshpass openssh-client openssl ca-certificates && \
    apk add postgresql-dev libffi-dev python3-dev jpeg-dev yaml-dev && \
    pip3 install -U pip && pip3 install cffi && pip3 install ansible && \
    mkdir -p /etc/ansible && echo 'localhost' > /etc/ansible/hosts && \
    rm -rf /var/cache/apk/* && rm -rf /root/.cache/pip

RUN ["/etc/init.d/postgresql", "start"]

# Later on, please use su-exec to switch to 'postgres' user if need to do PostgreSQL tasks

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
