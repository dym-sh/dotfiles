#!/usr/bin/zsh

# enable_ipv6

ip addr add 2a02:c207:3009:3300::1/64 dev eth0
ip -6 addr show

ip route add default via fe80::1 dev eth0
ip -6 route show

ping6 2a02:c207:3009:3300::1
