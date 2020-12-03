export EDITOR=/usr/bin/vim
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export BROWSER=google-chrome-stable


if [[ "$(tty)" == "/dev/tty1" ]]; then
  pgrep i3 || startx
fi
