#!/bin/bash

wallpaper_picture='$HOME/.config/i3/backgrounds/jpg/relicanth.jpg'
compton_conf='$HOME/.config/compton.conf'

tint2 &
nm-applet &
volumeicon &
feh --bg-scale $wallpaper_picture
compton --config $compton_conf
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
