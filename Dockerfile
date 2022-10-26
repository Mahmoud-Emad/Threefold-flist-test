FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Etc/UTC

# RUN echo deb http://be.archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse >> /etc/apt/sources.list

RUN apt-get -y update && \
    apt-get -y install wget openssh-client openssh-server python3 python3-pip \
    vim && rm -rf /var/lib/apt/lists/*

RUN wget -O /sbin/zinit https://github.com/threefoldtech/zinit/releases/download/v0.2.5/zinit && \
  chmod +x /sbin/zinit

COPY zinit /etc/zinit
COPY start.sh /start.sh

RUN chmod +x /sbin/zinit && chmod +x /start.sh
ENTRYPOINT  ["zinit", "init"]