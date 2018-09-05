FROM alpine

ARG FRP_VER=0.21.0
ARG FRP_URL=https://github.com/fatedier/frp/releases/download/v${FRP_VER}/frp_${FRP_VER}_linux_amd64.tar.gz

RUN mkdir -p /frp \
    && cd /frp\
    && wget -qO- ${FRP_URL} | tar xz \
    && mv frp_*/frpc /usr/bin/ \
    && mv frp_*/frps /usr/bin/ \
    && mv frp_*/*.ini ./ \
    && rm frp_* -rf

VOLUME /frp

ENV ARGS=frps

CMD ${ARGS} -c /frp/${ARGS}.ini