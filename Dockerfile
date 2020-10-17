FROM debian:stretch

ENV INSIDE_DOCKER_CONTAINER 1

RUN apt-get update \
    && apt-get -y install curl apt-transport-https gnupg gnupg2 gnupg1 \
    && curl -sSL https://dtcooper.github.io/raspotify/key.asc | apt-key add -v - \
    && echo 'deb https://dtcooper.github.io/raspotify raspotify main' | tee /etc/apt/sources.list.d/raspotify.list \
    && apt-get update \
    && apt-get -y install raspotify
RUN /bin/mkdir -m 0755 -p /var/cache/raspotify \
    && chown raspotify:raspotify /var/cache/raspotify

ENV DEVICE_NAME="lyd"
ENV BITRATE="160"
ENV CACHE_ARGS="--disable-audio-cache"
ENV VOLUME_ARGS="--enable-volume-normalisation --linear-volume --initial-volume=100"
ENV BACKEND_ARGS="--backend alsa"

COPY config/raspotify /etc/default/raspotify
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["sh", "-c", "/usr/local/bin/docker-entrypoint.sh"]
