#!/bin/bash
export proxy_path=
export proxy_exec=
sudo docker-compose up --build -d
sudo docker cp /etc/hostname vpn:/etc/hostname
sudo docker cp ${proxy_path} vpn:/proxy
sudo docker exec -it vpn bash -c "cd /proxy && ${proxy_exec}"

