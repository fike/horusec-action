FROM debian:stable-slim

ENV DEBIAN_FRONTEND=noninteractive

COPY entrypoint.sh /entrypoint.sh

RUN apt update && \
    apt install curl -y && \
    curl -fsSL  https://horusec.io/bin/latest/linux_x64/horusec -o horusec && \
    mv horusec /usr/local/bin/horusec && \
    chmod 0775 /usr/local/bin/horusec /entrypoint.sh

WORKDIR /opt/data

ENTRYPOINT ["/entrypoint.sh"]