FROM alpine:3.20.2

LABEL maintainer="Nguyễn Hồng Quân <ng.hong.quan@gmail.com>"


ENV LANG="en_US.UTF-8"
ENV PATH="/root/.local/bin:${PATH}"
ENV PIP_BREAK-SYSTEM-PACKAGES=1
# Ref: https://github.com/William-Yeh/docker-ansible/
RUN apk --update add bash python3 py3-pip py3-pysocks build-base tzdata rsync fd && \
    apk add sshpass openssh-client openssl ca-certificates git && \
    apk add postgresql-dev libffi-dev python3-dev jpeg-dev yaml-dev zlib-dev linux-headers gdal && \
    pip3 install -U pip wheel && pip3 install cffi --extra-index-url https://pypi.agriconnect.vn/musl/simple/ && \
    pip3 install cryptography --extra-index-url https://pypi.agriconnect.vn/musl/simple/ && \
    pip3 install ansible && \
    ln -s /usr/bin/python3 /usr/local/bin/python && \
    mkdir -p /etc/ansible && echo 'localhost' > /etc/ansible/hosts && \
    sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd

RUN pip3 install --ignore-installed poetry && poetry self add poetry-plugin-export
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /usr/local/bin/
RUN rm -rf /var/cache/apk/* && rm -rf /root/.cache/pip
