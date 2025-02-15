FROM docker.io/alpine AS downloader

WORKDIR /plugins-local/src/github.com

RUN apk add --no-cache git

RUN mkdir acouvreur \
    && cd acouvreur \
    && git clone -b v1.2.0 --depth 1 --single-branch https://github.com/acouvreur/traefik-ondemand-plugin.git

FROM docker.io/traefik:2.6.1

COPY --from=downloader /plugins-local /plugins-local
