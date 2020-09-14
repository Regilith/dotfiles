# automatically run startx when logging in on tty1
#[ $XDG_VTNR -eq 1 ] && exec startx # the old startup
[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1 &> /dev/null #startup without text