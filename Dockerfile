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

RUN adduser -D oidentd
RUN touch /home/oidentd/.oidentd.conf

EXPOSE 113

CMD /usr/sbin/oidentd -i
