xrdb -merge "$HOME/.Xresources"
systemctl --user start desktop.target
exec i3

# vi: ft=sh
