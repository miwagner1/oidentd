FROM lsiobase/alpine:3.10

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache \
 	oidentd

RUN adduser -D oidentd
RUN touch /home/oidentd/.oidentd.conf

EXPOSE 113

RUN /usr/sbin/oidentd -i
