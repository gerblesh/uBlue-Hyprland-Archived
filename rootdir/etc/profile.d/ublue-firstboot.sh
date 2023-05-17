#!/bin/bash

#if test "$(id -u)" -gt "0" && test -d "$HOME"; then
#    if test ! -e "$HOME"/.config/autostart/ublue-firstboot.desktop; then
#        mkdir -p "$HOME"/.config/autostart
#        cp -f /etc/skel.d/.config/autostart/ublue-firstboot.desktop "$HOME"/.config/autostart
#    fi
#fi

if test "$(id -u)" -gt "0" && test -d "$HOME"; then
	cp /etc/homedir/.config/* "$HOME"/.config/
	cp /etc/homedir/* "$HOME"/
