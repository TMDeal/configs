#!/bin/bash
scrot /tmp/tmp.png
convert -blur 0x5 /tmp/tmp.png /tmp/screen_lock.png
i3lock --image=/tmp/screen_lock.png
rm /tmp/screen_lock.png /tmp/tmp.png
