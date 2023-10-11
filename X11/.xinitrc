### X11 configuration ###

## Add configuration files to i3 config
xrdb -merge ~/.config/X11/.Xresources

## Start URxvt as a daemon
urxvtd -o -q -f

## Start i3 (needs to be at end of file)
exec i3

