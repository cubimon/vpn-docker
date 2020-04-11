#!/bin/bash
export vpn_usergroup=
export vpn_user=
export vpn_hostname=
export vpn_interface=
sudo docker-compose up --build -d
sudo docker exec -it vpn openconnect --usergroup=${vpn_usergroup} --user=${vpn_user} ${vpn_hostname} --interface=${vpn_interface}

