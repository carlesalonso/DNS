FROM debian:latest

RUN apt update && apt install bind9 -y && rm -rf /var/lib/apt/lists/*

EXPOSE 53/tcp
EXPOSE 53/udp

USER bind:bind

CMD ["/usr/sbin/named", "-f"]