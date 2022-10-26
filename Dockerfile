FROM ubuntu:20.04
RUN echo deb http://be.archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse >> /etc/apt/sources.list
RUN apt-get update && DEBIAN_FRONTEND=noninteractive TZ=Europe/Belgium apt-get install -y openssh-client openssh-server git mc mcedit curl wget dnsutils iproute2 vim && rm -rf /var/lib/apt/lists/*

WORKDIR /server_work_dir
COPY init.sh /server_work_dir
RUN chmod +x /server_work_dir/init.sh
