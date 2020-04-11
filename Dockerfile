FROM debian:bullseye

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qq \
    openconnect openvpn \
    python3 python3-socks python3-netifaces python3-dnslib python3-psutil

