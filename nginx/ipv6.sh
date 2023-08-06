#!/usr/bin/zsh

# enable_ipv6

ip addr add 2a02:c206:3009:9964::1/112 dev eth0
ip -6 addr show

ip route add default via fe80::1 dev eth0
ip -6 route show

ping -6 2a02:c206:3009:9964::1
