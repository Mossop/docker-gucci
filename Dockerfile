FROM debian:stable-slim

ADD https://github.com/noqcks/gucci/releases/download/1.6.5/gucci-v1.6.5-linux-amd64 /usr/local/bin/gucci

COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY build.sh /build.sh

RUN apt-get update && \
    apt-get install -y jq inotify-tools && \
    chmod 755 /usr/local/bin/gucci && \
    mkdir -p /templates

ENTRYPOINT /docker-entrypoint.sh
