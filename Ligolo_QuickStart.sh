#!/usr/bin/bash

RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

echo -e "${GREEN}Run in the same folder that proxy is in${ENDCOLOR}"
echo -e "${RED}Remember when you get a hit type session then start on ligolo interface${ENDCOLOR}"

read -p "Internal network (ex 10.10.10.0/24)   " ip
sudo ip tuntap add user $USER mode tun ligolo
sudo ip link set ligolo up
sudo ip route add $ip dev ligolo
./proxy -selfcert
