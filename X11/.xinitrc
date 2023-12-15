### X11 configuration ###

## Add configuration files to i3 config
xrdb -merge ~/.config/X11/.Xresources

## Start URxvt as a daemon
urxvtd -o -q -f

## Start udiskie
udiskie &

## Remap caps lock to esc
setxkbmap -option caps:escape

## Disable screen timeout
xset s off -dpms

## Start i3 (needs to be at end of file)
exec i3
