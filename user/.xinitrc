if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrandr --auto
xrdb -merge "$HOME/.Xresources"
systemctl --user start desktop.target
i3
systemctl --user stop desktop.target

# vi: ft=sh
