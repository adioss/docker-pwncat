FROM docker AS build
RUN apk --no-cache add wget
RUN mkdir /workdir
WORKDIR /workdir
RUN wget https://raw.githubusercontent.com/cytopia/pwncat/master/bin/pwncat -O /workdir/pwncat \
    && chmod +x /workdir/pwncat

#FROM alpine:latest
FROM ubuntu:latest
USER root

#RUN apk update \
#    && apk add --no-cache bash
RUN dpkg --add-architecture i386 \
    && apt update -y \
    && apt upgrade -y \
    && apt install -y bash socat python3

COPY --from=build /workdir/pwncat /

EXPOSE 8080

WORKDIR /mnt

ENTRYPOINT ["/pwncat"]
CMD [""]