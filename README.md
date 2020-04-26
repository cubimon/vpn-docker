# VPN in docker

Some scripts/files I use for fine granular vpn access on domain/port basis.
It creates a vpn container for a virtual network with a openconnect/vpn tunnel.
A proxy in the container is used for vpn access.
A local proxy proxyserver based on domain decides if direct connection or vpn proxy in docker container is used.
proxychains-ng is used to transparently force proxy for most applications.
Chromium/go applications need special handling for use with proxychains-ng.
For chromium you can add `--proxy-server=socks5h://localhost:1080` parameter.
Go applications should be built with go-pie.
Static linking should be avoided since proxychains-ng uses `LD_PRELOAD` to override some c standard library functions.

## Architecture:

direct connection:
```
-------------    ----------------    -----------------------------
|Application| -> |proxychains-ng| -> |localhost:1080 socks5 proxy| -
-------------    ----------------    ----------------------------- |
                                                                   |
-------------------------------------------------------------------|
|
|  ------------------------
|->|directly/local network|
   ------------------------

```

vpn connection:
```
-------------    ----------------    -----------------------------
|Application| -> |proxychains-ng| -> |localhost:1080 socks5 proxy| -
-------------    ----------------    ----------------------------- |
                                                                   |
-------------------------------------------------------------------|
|
|  ------------------------------------    ------------
|->|localhost:1081 docker socks5 proxy| -> |vpn tunnel|
   ------------------------------------    ------------
```

## Notes

If someone finds a better way, e.g. based on iptables I would be grateful to know.

