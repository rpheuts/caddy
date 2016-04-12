FROM alpine:3.3
MAINTAINER Robert Heuts <robert.p.heuts@gmail.com>
LABEL caddy_version="0.8.2" architecture="amd64"

ENV CADDY_FEATURES git,hugo
ENV CADDY_ARCH amd64
ENV CADDY_OS linux

RUN apk add --update openssh-client git tar

RUN wget "https://caddyserver.com/download/build?os=${CADDY_OS}&arch=${CADDY_ARCH}&features=${CADDY_FEATURES}" -O- | tar -C /usr/bin/ -xz caddy && chmod 0755 /usr/bin/caddy

WORKDIR /srv

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/srv/Caddyfile"]

EXPOSE 80 443
