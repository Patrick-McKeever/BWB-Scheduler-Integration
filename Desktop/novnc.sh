#!/bin/bash
export DISPLAY=:1
Xvfb :1 -screen 0 1024x800x16 & 
sleep 5
openbox-session & xsetroot -solid "#FFFFFF" &
x11vnc -display :1 -nopw -listen localhost -xkb -ncache 10 -ncache_cr -forever &
cd /root/noVNC && ln -s vnc_lite.html index.html && ./utils/launch.sh --vnc localhost:5900 