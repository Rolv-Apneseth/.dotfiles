#!/bin/env sh

while true; do
    killall swaybg
    swaybg --image "$(find "$HOME"/repos/Wallpapers/main/ -type f | shuf -n 1)" &
    sleep 1800
done
