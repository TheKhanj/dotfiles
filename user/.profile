__setup_path() {
	export PATH="$PATH:$HOME/.local/bin"
	export PATH="$PATH:$HOME/.cargo/bin"
	export PATH="$PATH:$HOME/.volta/bin"
	export PATH="$PATH:$HOME/go/bin"
	export PATH="$PATH:$HOME/.pyenv/shims"
}

__setup_apps() {
	export VISUAL=nvim
	export EDITOR=$VISUAL
	export LESS='-R -S -z 5'
	export PAGER=less
	export MANPAGER=less
	export BLOCK_SIZE='human-readable'
	export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/config"
	export HISTSIZE=10000
	export HISTFILESIZE=10000
	export NNN_PLUG='d:dragdrop;f:fzcd;b:cdpath;'
	export NNN_COLORS='#0a1b2c3d;1234'
	export BROWSER="/usr/bin/chromium"
}

__setup_aliases() {
	alias ls="ls --color=auto"
	alias yt='ytfzf -t --async-thumbnails --keep-cache --preview-side=right --ytdl-pref="bestvideo[height<=?1080][fps<=?30][vcodec!~=\"vp0?9\"]+bestaudio/best"'
	alias cpy='xclip -selection clipboard'
	alias pst='xclip -o -selection clipboard'
}

__setup_grc() {
	export GRC_ALIASES=true
	! [ -f "/etc/grc.sh" ] &&
		sudo curl 'https://raw.githubusercontent.com/garabik/grc/master/grc.sh' -Lo '/etc/grc.sh'
	. /etc/grc.sh
}

. /etc/profile
__setup_path
__setup_apps
__setup_aliases
__setup_grc
