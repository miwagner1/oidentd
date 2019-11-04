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

RUN touch /home/znc/.oidentd.conf \
    && chmod 0644 /home/znc/.oidentd.conf \
    && chmod 0711 /home/znc/

EXPOSE 113

CMD /usr/sbin/oidentd -i
