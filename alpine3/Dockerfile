FROM alpine:3.8

MAINTAINER Nguyễn Hồng Quân <ng.hong.quan@gmail.com>


ENV LANG en_US.UTF-8
ENV PGDATA /var/lib/postgresql/data
# Ref: https://github.com/William-Yeh/docker-ansible/
RUN apk --update add su-exec postgresql && \
    apk add python3 build-base redis postgresql rsync && \
    apk add sshpass openssh-client openssl ca-certificates && \
    apk add postgresql-dev libffi-dev python3-dev jpeg-dev yaml-dev zlib-dev && \
    pip3 install -U pip wheel && pip3 install cffi && \
    pip3 install cryptography && pip3 install ansible && \
    pip3 install Pillow psycopg2 pytest-flakes pytest-django && \
    mkdir -p /etc/ansible && echo 'localhost' > /etc/ansible/hosts && \
    rm -rf /var/cache/apk/* && rm -rf /root/.cache/pip

# Later on, please use su-exec to switch to 'postgres' user if need to do PostgreSQL tasks
COPY start-postgres.sh /start-postgres.sh
RUN ["/start-postgres.sh"]
# In your app, should run "su-exec postgres pg_ctl start -w" to start Postgres server
