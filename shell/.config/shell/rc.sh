[ -n "$RC_LOADED" ] && return || RC_LOADED=1

as_root() {
	local admin
	if which doas >/dev/null; then
		admin="$(which doas)"
	else
		admin="$(which sudo)"
	fi

	$($admin $@)
}

is_laptop() {
	host="$(hostname)"
	[ "$host" = 'peach' ] ||
		[ "$host" = 'birikht' ] ||
		[ "$host" = 'buddy' ]
}

init_aliases() {
	alias f="source fcd"
	alias ls="ls --color=auto"
}

init_colors() {
	# Normal Colors
	export BLACK=$'\033[0;30m'  # Black
	export RED=$'\033[0;31m'    # Red
	export GREEN=$'\033[0;32m'  # Green
	export YELLOW=$'\033[0;33m' # Yellow
	export BLUE=$'\033[0;34m'   # Blue
	export PURPLE=$'\033[0;35m' # Purple
	export CYAN=$'\033[0;36m'   # Cyan
	export WHITE=$'\033[0;37m'  # White

	# Bold
	export BOLD_BLACK=$'\033[1;90m'  # Black
	export BOLD_RED=$'\033[1;91m'    # Red
	export BOLD_GREEN=$'\033[1;92m'  # Green
	export BOLD_YELLOW=$'\033[1;93m' # Yellow
	export BOLD_BLUE=$'\033[1;94m'   # Blue
	export BOLD_PURPLE=$'\033[1;95m' # Purple
	export BOLD_CYAN=$'\033[1;96m'   # Cyan
	export BOLD_WHITE=$'\033[1;97m'  # White

	# Background
	export BG_BLACK=$'\033[40m'  # Black
	export BG_RED=$'\033[41m'    # Red
	export BG_GREEN=$'\033[42m'  # Green
	export BG_YELLOW=$'\033[43m' # Yellow
	export BG_BLUE=$'\033[44m'   # Blue
	export BG_PURPLE=$'\033[45m' # Purple
	export BG_CYAN=$'\033[46m'   # Cyan
	export BG_WHITE=$'\033[47m'  # White

	# Background Bold
	export BOLD_BG_BLACK=$'\033[100m'  # Black
	export BOLD_BG_RED=$'\033[101m'    # Red
	export BOLD_BG_GREEN=$'\033[102m'  # Green
	export BOLD_BG_YELLOW=$'\033[103m' # Yellow
	export BOLD_BG_BLUE=$'\033[104m'   # Blue
	export BOLD_BG_PURPLE=$'\033[105m' # Purple
	export BOLD_BG_CYAN=$'\033[106m'   # Cyan
	export BOLD_BG_WHITE=$'\033[107m'  # White

	export COLOR_RESET=$'\033[m' # Color Reset

	export LS_COLORS="*~=0;38;2;122;112;112:bd=0;38;2;102;217;239;48;2;51;51;51:ca=0:cd=0;38;2;249;38;114;48;2;51;51;51:di=0;38;2;102;217;239:do=0;38;2;0;0;0;48;2;249;38;114:ex=1;38;2;249;38;114:fi=0:ln=0;38;2;249;38;114:mh=0:mi=0;38;2;0;0;0;48;2;255;74;68:no=0:or=0;38;2;0;0;0;48;2;255;74;68:ow=0:pi=0;38;2;0;0;0;48;2;102;217;239:rs=0:sg=0:so=0;38;2;0;0;0;48;2;249;38;114:st=0:su=0:tw=0:*.a=1;38;2;249;38;114:*.c=0;38;2;0;255;135:*.d=0;38;2;0;255;135:*.h=0;38;2;0;255;135:*.m=0;38;2;0;255;135:*.o=0;38;2;122;112;112:*.p=0;38;2;0;255;135:*.r=0;38;2;0;255;135:*.t=0;38;2;0;255;135:*.z=4;38;2;249;38;114:*.7z=4;38;2;249;38;114:*.as=0;38;2;0;255;135:*.bc=0;38;2;122;112;112:*.bz=4;38;2;249;38;114:*.cc=0;38;2;0;255;135:*.cp=0;38;2;0;255;135:*.cr=0;38;2;0;255;135:*.cs=0;38;2;0;255;135:*.di=0;38;2;0;255;135:*.el=0;38;2;0;255;135:*.ex=0;38;2;0;255;135:*.fs=0;38;2;0;255;135:*.go=0;38;2;0;255;135:*.gv=0;38;2;0;255;135:*.gz=4;38;2;249;38;114:*.hh=0;38;2;0;255;135:*.hi=0;38;2;122;112;112:*.hs=0;38;2;0;255;135:*.jl=0;38;2;0;255;135:*.js=0;38;2;0;255;135:*.ko=1;38;2;249;38;114:*.kt=0;38;2;0;255;135:*.la=0;38;2;122;112;112:*.ll=0;38;2;0;255;135:*.lo=0;38;2;122;112;112:*.md=0;38;2;226;209;57:*.ml=0;38;2;0;255;135:*.mn=0;38;2;0;255;135:*.nb=0;38;2;0;255;135:*.pl=0;38;2;0;255;135:*.pm=0;38;2;0;255;135:*.pp=0;38;2;0;255;135:*.ps=0;38;2;230;219;116:*.py=0;38;2;0;255;135:*.rb=0;38;2;0;255;135:*.rm=0;38;2;253;151;31:*.rs=0;38;2;0;255;135:*.sh=0;38;2;0;255;135:*.so=1;38;2;249;38;114:*.td=0;38;2;0;255;135:*.ts=0;38;2;0;255;135:*.ui=0;38;2;166;226;46:*.vb=0;38;2;0;255;135:*.wv=0;38;2;253;151;31:*.xz=4;38;2;249;38;114:*.aif=0;38;2;253;151;31:*.ape=0;38;2;253;151;31:*.apk=4;38;2;249;38;114:*.arj=4;38;2;249;38;114:*.asa=0;38;2;0;255;135:*.aux=0;38;2;122;112;112:*.avi=0;38;2;253;151;31:*.awk=0;38;2;0;255;135:*.bag=4;38;2;249;38;114:*.bak=0;38;2;122;112;112:*.bat=1;38;2;249;38;114:*.bbl=0;38;2;122;112;112:*.bcf=0;38;2;122;112;112:*.bib=0;38;2;166;226;46:*.bin=4;38;2;249;38;114:*.blg=0;38;2;122;112;112:*.bmp=0;38;2;253;151;31:*.bsh=0;38;2;0;255;135:*.bst=0;38;2;166;226;46:*.bz2=4;38;2;249;38;114:*.c++=0;38;2;0;255;135:*.cfg=0;38;2;166;226;46:*.cgi=0;38;2;0;255;135:*.clj=0;38;2;0;255;135:*.com=1;38;2;249;38;114:*.cpp=0;38;2;0;255;135:*.css=0;38;2;0;255;135:*.csv=0;38;2;226;209;57:*.csx=0;38;2;0;255;135:*.cxx=0;38;2;0;255;135:*.deb=4;38;2;249;38;114:*.def=0;38;2;0;255;135:*.dll=1;38;2;249;38;114:*.dmg=4;38;2;249;38;114:*.doc=0;38;2;230;219;116:*.dot=0;38;2;0;255;135:*.dox=0;38;2;166;226;46:*.dpr=0;38;2;0;255;135:*.elc=0;38;2;0;255;135:*.elm=0;38;2;0;255;135:*.epp=0;38;2;0;255;135:*.eps=0;38;2;253;151;31:*.erl=0;38;2;0;255;135:*.exe=1;38;2;249;38;114:*.exs=0;38;2;0;255;135:*.fls=0;38;2;122;112;112:*.flv=0;38;2;253;151;31:*.fnt=0;38;2;253;151;31:*.fon=0;38;2;253;151;31:*.fsi=0;38;2;0;255;135:*.fsx=0;38;2;0;255;135:*.gif=0;38;2;253;151;31:*.git=0;38;2;122;112;112:*.gvy=0;38;2;0;255;135:*.h++=0;38;2;0;255;135:*.hpp=0;38;2;0;255;135:*.htc=0;38;2;0;255;135:*.htm=0;38;2;226;209;57:*.hxx=0;38;2;0;255;135:*.ico=0;38;2;253;151;31:*.ics=0;38;2;230;219;116:*.idx=0;38;2;122;112;112:*.ilg=0;38;2;122;112;112:*.img=4;38;2;249;38;114:*.inc=0;38;2;0;255;135:*.ind=0;38;2;122;112;112:*.ini=0;38;2;166;226;46:*.inl=0;38;2;0;255;135:*.ipp=0;38;2;0;255;135:*.iso=4;38;2;249;38;114:*.jar=4;38;2;249;38;114:*.jpg=0;38;2;253;151;31:*.kex=0;38;2;230;219;116:*.kts=0;38;2;0;255;135:*.log=0;38;2;122;112;112:*.ltx=0;38;2;0;255;135:*.lua=0;38;2;0;255;135:*.m3u=0;38;2;253;151;31:*.m4a=0;38;2;253;151;31:*.m4v=0;38;2;253;151;31:*.mid=0;38;2;253;151;31:*.mir=0;38;2;0;255;135:*.mkv=0;38;2;253;151;31:*.mli=0;38;2;0;255;135:*.mov=0;38;2;253;151;31:*.mp3=0;38;2;253;151;31:*.mp4=0;38;2;253;151;31:*.mpg=0;38;2;253;151;31:*.nix=0;38;2;166;226;46:*.odp=0;38;2;230;219;116:*.ods=0;38;2;230;219;116:*.odt=0;38;2;230;219;116:*.ogg=0;38;2;253;151;31:*.org=0;38;2;226;209;57:*.otf=0;38;2;253;151;31:*.out=0;38;2;122;112;112:*.pas=0;38;2;0;255;135:*.pbm=0;38;2;253;151;31:*.pdf=0;38;2;230;219;116:*.pgm=0;38;2;253;151;31:*.php=0;38;2;0;255;135:*.pid=0;38;2;122;112;112:*.pkg=4;38;2;249;38;114:*.png=0;38;2;253;151;31:*.pod=0;38;2;0;255;135:*.ppm=0;38;2;253;151;31:*.pps=0;38;2;230;219;116:*.ppt=0;38;2;230;219;116:*.pro=0;38;2;166;226;46:*.ps1=0;38;2;0;255;135:*.psd=0;38;2;253;151;31:*.pyc=0;38;2;122;112;112:*.pyd=0;38;2;122;112;112:*.pyo=0;38;2;122;112;112:*.rar=4;38;2;249;38;114:*.rpm=4;38;2;249;38;114:*.rst=0;38;2;226;209;57:*.rtf=0;38;2;230;219;116:*.sbt=0;38;2;0;255;135:*.sql=0;38;2;0;255;135:*.sty=0;38;2;122;112;112:*.svg=0;38;2;253;151;31:*.swf=0;38;2;253;151;31:*.swp=0;38;2;122;112;112:*.sxi=0;38;2;230;219;116:*.sxw=0;38;2;230;219;116:*.tar=4;38;2;249;38;114:*.tbz=4;38;2;249;38;114:*.tcl=0;38;2;0;255;135:*.tex=0;38;2;0;255;135:*.tgz=4;38;2;249;38;114:*.tif=0;38;2;253;151;31:*.tml=0;38;2;166;226;46:*.tmp=0;38;2;122;112;112:*.toc=0;38;2;122;112;112:*.tsx=0;38;2;0;255;135:*.ttf=0;38;2;253;151;31:*.txt=0;38;2;226;209;57:*.vcd=4;38;2;249;38;114:*.vim=0;38;2;0;255;135:*.vob=0;38;2;253;151;31:*.wav=0;38;2;253;151;31:*.wma=0;38;2;253;151;31:*.wmv=0;38;2;253;151;31:*.xcf=0;38;2;253;151;31:*.xlr=0;38;2;230;219;116:*.xls=0;38;2;230;219;116:*.xml=0;38;2;226;209;57:*.xmp=0;38;2;166;226;46:*.yml=0;38;2;166;226;46:*.zip=4;38;2;249;38;114:*.zsh=0;38;2;0;255;135:*.zst=4;38;2;249;38;114:*TODO=1:*hgrc=0;38;2;166;226;46:*.bash=0;38;2;0;255;135:*.conf=0;38;2;166;226;46:*.dart=0;38;2;0;255;135:*.diff=0;38;2;0;255;135:*.docx=0;38;2;230;219;116:*.epub=0;38;2;230;219;116:*.fish=0;38;2;0;255;135:*.flac=0;38;2;253;151;31:*.h264=0;38;2;253;151;31:*.hgrc=0;38;2;166;226;46:*.html=0;38;2;226;209;57:*.java=0;38;2;0;255;135:*.jpeg=0;38;2;253;151;31:*.json=0;38;2;166;226;46:*.less=0;38;2;0;255;135:*.lisp=0;38;2;0;255;135:*.lock=0;38;2;122;112;112:*.make=0;38;2;166;226;46:*.mpeg=0;38;2;253;151;31:*.opus=0;38;2;253;151;31:*.orig=0;38;2;122;112;112:*.pptx=0;38;2;230;219;116:*.psd1=0;38;2;0;255;135:*.psm1=0;38;2;0;255;135:*.purs=0;38;2;0;255;135:*.rlib=0;38;2;122;112;112:*.sass=0;38;2;0;255;135:*.scss=0;38;2;0;255;135:*.tbz2=4;38;2;249;38;114:*.tiff=0;38;2;253;151;31:*.toml=0;38;2;166;226;46:*.webm=0;38;2;253;151;31:*.webp=0;38;2;253;151;31:*.woff=0;38;2;253;151;31:*.xbps=4;38;2;249;38;114:*.xlsx=0;38;2;230;219;116:*.yaml=0;38;2;166;226;46:*.cabal=0;38;2;0;255;135:*.cache=0;38;2;122;112;112:*.class=0;38;2;122;112;112:*.cmake=0;38;2;166;226;46:*.dyn_o=0;38;2;122;112;112:*.ipynb=0;38;2;0;255;135:*.mdown=0;38;2;226;209;57:*.patch=0;38;2;0;255;135:*.scala=0;38;2;0;255;135:*.shtml=0;38;2;226;209;57:*.swift=0;38;2;0;255;135:*.toast=4;38;2;249;38;114:*.xhtml=0;38;2;226;209;57:*README=0;38;2;0;0;0;48;2;230;219;116:*passwd=0;38;2;166;226;46:*shadow=0;38;2;166;226;46:*.config=0;38;2;166;226;46:*.dyn_hi=0;38;2;122;112;112:*.flake8=0;38;2;166;226;46:*.gradle=0;38;2;0;255;135:*.groovy=0;38;2;0;255;135:*.ignore=0;38;2;166;226;46:*.matlab=0;38;2;0;255;135:*COPYING=0;38;2;182;182;182:*INSTALL=0;38;2;0;0;0;48;2;230;219;116:*LICENSE=0;38;2;182;182;182:*TODO.md=1:*.desktop=0;38;2;166;226;46:*.gemspec=0;38;2;166;226;46:*Doxyfile=0;38;2;166;226;46:*Makefile=0;38;2;166;226;46:*TODO.txt=1:*setup.py=0;38;2;166;226;46:*.DS_Store=0;38;2;122;112;112:*.cmake.in=0;38;2;166;226;46:*.fdignore=0;38;2;166;226;46:*.kdevelop=0;38;2;166;226;46:*.markdown=0;38;2;226;209;57:*.rgignore=0;38;2;166;226;46:*COPYRIGHT=0;38;2;182;182;182:*README.md=0;38;2;0;0;0;48;2;230;219;116:*configure=0;38;2;166;226;46:*.gitconfig=0;38;2;166;226;46:*.gitignore=0;38;2;166;226;46:*.localized=0;38;2;122;112;112:*.scons_opt=0;38;2;122;112;112:*CODEOWNERS=0;38;2;166;226;46:*Dockerfile=0;38;2;166;226;46:*INSTALL.md=0;38;2;0;0;0;48;2;230;219;116:*README.txt=0;38;2;0;0;0;48;2;230;219;116:*SConscript=0;38;2;166;226;46:*SConstruct=0;38;2;166;226;46:*.gitmodules=0;38;2;166;226;46:*.synctex.gz=0;38;2;122;112;112:*.travis.yml=0;38;2;230;219;116:*INSTALL.txt=0;38;2;0;0;0;48;2;230;219;116:*LICENSE-MIT=0;38;2;182;182;182:*MANIFEST.in=0;38;2;166;226;46:*Makefile.am=0;38;2;166;226;46:*Makefile.in=0;38;2;122;112;112:*.applescript=0;38;2;0;255;135:*.fdb_latexmk=0;38;2;122;112;112:*CONTRIBUTORS=0;38;2;0;0;0;48;2;230;219;116:*appveyor.yml=0;38;2;230;219;116:*configure.ac=0;38;2;166;226;46:*.clang-format=0;38;2;166;226;46:*.gitattributes=0;38;2;166;226;46:*.gitlab-ci.yml=0;38;2;230;219;116:*CMakeCache.txt=0;38;2;122;112;112:*CMakeLists.txt=0;38;2;166;226;46:*LICENSE-APACHE=0;38;2;182;182;182:*CONTRIBUTORS.md=0;38;2;0;0;0;48;2;230;219;116:*.sconsign.dblite=0;38;2;122;112;112:*CONTRIBUTORS.txt=0;38;2;0;0;0;48;2;230;219;116:*requirements.txt=0;38;2;166;226;46:*package-lock.json=0;38;2;122;112;112:*.CFUserTextEncoding=0;38;2;122;112;112"
}

dir_prompt() {
	printf "%s@%s:\w\$ " "$USER" "$(hostname)"
}

init_prompt() {
	export PS1="$(dir_prompt)"
}

init_exports() {
	export PATH="$PATH:$HOME/bin"
	export PATH="$PATH:$HOME/.local/bin"
	export PATH="$PATH:$HOME/.cargo/bin"
	export PATH="$PATH:$HOME/.volta/bin"
	export PATH="$PATH:$HOME/go/bin"
	export PATH="$PATH:$HOME/bin/saman"

	[ -n "$TMUX" ] && export TERM='tmux-256color'

	export VISUAL=nvim
	export EDITOR=$VISUAL
	export TERMINAL=xfce4-terminal
	export LESS='-R -S -z 5'
	export PAGER=less
	export MANPAGER="sh -c 'sed -e s/.\\\\x08//g | bat -l man -p'"
	export BLOCK_SIZE='human-readable'

	if [ "$(hostname)" = "hayede" ]; then
		export BROWSER="/usr/bin/google-chrome-stable"
	else
		export BROWSER="/usr/bin/chromium"
	fi

	export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/config"

	export PHP_CS_FIXER_IGNORE_ENV=1

	export HISTSIZE=10000
	export HISTFILESIZE=10000

	export NNN_PLUG='d:dragdrop;f:fzcd;b:cdpath;'
	export NNN_COLORS='#0a1b2c3d;1234'
}

init_less_colors() {
	export LESS_TERMCAP_mb=$BOLD_YELLOW
	export LESS_TERMCAP_md=$BOLD_GREEN
	export LESS_TERMCAP_so=$BOLD_RED
	export LESS_TERMCAP_us=$BOLD_YELLOW
	export LESS_TERMCAP_se=$(
		tput rmso
		tput sgr0
	)
	export LESS_TERMCAP_me=$WHITE
	export LESS_TERMCAP_ue=$(
		tput rmul
		tput sgr0
	)
	export LESS_TERMCAP_mr=$(tput rev)
	export LESS_TERMCAP_mh=$(tput dim)
	export LESS_TERMCAP_ZN=$(tput ssubm)
	export LESS_TERMCAP_ZV=$(tput rsubm)
	export LESS_TERMCAP_ZO=$(tput ssupm)
	export LESS_TERMCAP_ZW=$(tput rsupm)
	export GROFF_NO_SGR=1
}

enable_vi_mode() {
	set -o vi
	bind '"kj": "\e"'
}

enable_grc() {
	export GRC_ALIASES=true
	. /etc/grc.sh
}

setup_fzf() {
	source /usr/share/fzf/key-bindings.bash
	source /usr/share/fzf/completion.bash
	bind -m vi-command '"\C-f": "\C-z\ec\C-z"'
	bind -m vi-insert '"\C-f": "\C-z\ec\C-z"'
	bind -r "\ec"
}

paste_from_clipboard() {
	local shift=$1

	local head=${READLINE_LINE:0:READLINE_POINT+shift}
	local tail=${READLINE_LINE:READLINE_POINT+shift}

	local paste=$(xclip -out -selection clipboard)
	local paste_len=${#paste}

	READLINE_LINE=${head}${paste}${tail}
	let READLINE_POINT+=$paste_len+$shift-1
}

yank_line_to_clipboard() {
	echo -n "$READLINE_LINE" | xclip -in -selection clipboard
}

kill_line_to_clipboard() {
	yank_line_to_clipboard
	READLINE_LINE=""
}

setup_clipboard() {
	bind -m vi-command -x '"P": paste_from_clipboard 0'
	bind -m vi-command -x '"p": paste_from_clipboard 1'
	bind -m vi-command -x '"yy": yank_line_to_clipboard'
	bind -m vi-command -x '"dd": kill_line_to_clipboard'
}

setup_shell() {
	init_aliases
	init_colors
	init_prompt
	init_exports
	init_less_colors
	enable_vi_mode
	enable_grc
	setup_fzf
	setup_clipboard
}
