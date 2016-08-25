autoload -U colors && colors

# colorize manpage
function man-colorized {
  env \
    LESS_TERMCAP_md=$(printf "${fg_bold[green]}") \
    LESS_TERMCAP_us=$(printf "${fg_bold[blue]}") \
    LESS_TERMCAP_ue=$(printf "${fg_bold[default]}") \
    PAGER="${commands[less]:-$PAGER}" \
    _NROFF_U=1 \
    'man' $@
}
