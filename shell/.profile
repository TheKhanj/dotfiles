if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] && [[ $USER != 'root' ]]
then
  startx
fi
