. $HOME/.config/shell/utils.sh
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.volta/bin"
export PATH="$PATH:$HOME/go/bin"

if ! is_linux; then
  export VISUAL=vim
else
  export VISUAL=nvim
fi

[ -n "$TMUX" ] && export TERM='tmux-256color'

export EDITOR=$VISUAL
export TERMINAL=xfce4-terminal
export LESS='-R -S -z 5'
export PAGER=less
export MANPAGER="sh -c 'sed -e s/.\\\\x08//g | bat -l man -p'"
export BLOCK_SIZE=human-readable
export BROWSER=chromium
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/config"

export PHP_CS_FIXER_IGNORE_ENV=1
