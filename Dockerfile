FROM xhofe/alist:latest
LABEL MAINTAINER="i@nn.ci"
VOLUME /opt/alist/data/
WORKDIR /opt/alist/
COPY entrypoint.sh /entrypoint.sh
RUN apk add --no-cache aria2 curl; \
    chmod +x /entrypoint.sh
RUN wget https://github.com/ekzhang/bore/releases/download/v0.4.1/bore-v0.4.1-x86_64-unknown-linux-musl.tar.gz -O-|tar xz -C /usr/local/bin; \
    wget https://github.com/P3TERX/aria2.conf/archive/refs/heads/master.zip; \
    unzip master.zip -d /root; \
    mv /root/aria2.conf-master /root/.aria2; \
    sed -i 's|rpc-secret|#rpc-secret|g' /root/.aria2/aria2.conf; \
    touch /root/.aria2/aria2.session
ENV PUID=0 PGID=0 UMASK=022
EXPOSE 5244
ENTRYPOINT [ "/entrypoint.sh" ]