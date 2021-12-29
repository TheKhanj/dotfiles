. $HOME/.config/shell/utils.sh

if is_linux
then
  export ZSH="$HOME/git/ohmyzsh"
  plugins=(zsh-autosuggestions)
  if [ -n "$DISPLAY" ]; then
    plugins+=zsh-system-clipboard
  fi
  . $ZSH/oh-my-zsh.sh
fi

. $HOME/.config/shell/init.sh
. $HOME/.config/zsh/vi.zsh
