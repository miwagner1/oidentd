FROM alpine:3.10

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache \
 	oidentd

RUN set -x \
    && adduser -S znc \
    && addgroup -S znc \
    && echo "**** install build packages ****" \
    && apk add --no-cache \
    oidentd

RUN touch /home/znc/.oidentd.conf

EXPOSE 113

COPY entrypoint.sh /
COPY 01-options.sh /startup-sequence/
COPY 20-chown.sh /startup-sequence/
COPY 99-launch.sh /startup-sequence/

ENTRYPOINT ["/entrypoint.sh"]
