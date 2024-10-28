#!/bin/sh

SSID=$(nmcli device show wlp1s0 | awk '/GENERAL.CONNECTION/ {printf("%s", $(2))}')
IPv4=$(nmcli device show wlp1s0 | awk '/IP4.ADDRESS/ {printf("%s", $(2))}')

echo " $SSID $IPv4 "
