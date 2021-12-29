. $HOME/.config/shell/colors.sh
. $HOME/.config/shell/less.sh
. $HOME/.config/shell/aliases.sh
. $HOME/.config/shell/exports.sh

export PATH="$PATH:$HOME/digikala/vpn"
export SUPERNOVA_DEV_DIR="$HOME/digikala/supernova-env-dev"
export PATH="$PATH:$SUPERNOVA_DEV_DIR/scripts"

PS1="$($HOME/.config/shell/prompt.sh) "

set -o vi
