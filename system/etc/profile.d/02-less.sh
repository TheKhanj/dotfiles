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
