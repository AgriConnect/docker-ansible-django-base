FROM alpine:3.13

MAINTAINER Nguyễn Hồng Quân <ng.hong.quan@gmail.com>


ENV LANG en_US.UTF-8
ENV PATH "/root/.poetry/bin:${PATH}"
# Ref: https://github.com/William-Yeh/docker-ansible/
RUN apk --update add bash python3 py3-pip build-base rsync fd nodejs yarn cargo && \
    apk add sshpass openssh-client openssl ca-certificates git && \
    apk add postgresql-dev libffi-dev python3-dev jpeg-dev yaml-dev zlib-dev linux-headers && \
    pip3 install -U pip wheel && pip3 install cffi --extra-index-url https://pypi.agriconnect.vn/musl/simple/ && \
    pip3 install cryptography --extra-index-url https://pypi.agriconnect.vn/musl/simple/ && \
    pip3 install ansible && \
    pip3 install Pillow psycopg2 pytest-flakes pytest-django && \
    wget -qO- https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 && \
    ln -s /usr/bin/python3 /usr/local/bin/python && \
    mkdir -p /etc/ansible && echo 'localhost' > /etc/ansible/hosts && \
    rm -rf /var/cache/apk/* && rm -rf /root/.cache/pip && \
    sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd
