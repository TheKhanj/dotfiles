export KEYTIMEOUT=20
bindkey kj vi-cmd-mode

function zle-keymap-select {
  case $KEYMAP in
    vicmd) echo -ne '\e[1 q';;      # block
    viins|main) echo -ne '\e[5 q';; # beam
  esac
}

function zle-line-init {
  # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set
  # elsewhere)
  zle -K viins
  echo -ne "\e[5 q"
}

zle -N zle-keymap-select
zle -N zle-line-init
