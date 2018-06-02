FROM debian:jessie

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    echo 'deb http://http.debian.net/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list && \
    apt-get update && \
    apt-get install -y apt-utils && \
    apt-get upgrade -y && \
    apt-get install -y -t jessie-backports openjdk-8-jre-headless && \
    rm -f /etc/apt/sources.list.d/jessie-backports.list && \
    apt-get install -y \
        systemd \
        apache2 \
        python \
        python-apt \
        sudo \
        cron \
        rsync && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    a2enmod ssl rewrite proxy proxy_http headers

