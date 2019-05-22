# Promt ########################################################################

# ↓↑●✖✚

setopt NOTIFY # Report the status of background jobs immediately, rather than waiting until just before printing a prompt.
setopt INTERACTIVE_COMMENTS # Allowes to use #-sign as comment within commandline

# Edit the current command line in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

autoload -U colors && colors

# configure vcs_info
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats "in ${fg[magenta]}%r$reset_color on ${fg[green]}%b$reset_color %m%u%c"
zstyle ':vcs_info:*' actionformats "in ${fg[magenta]}%r$reset_color on ${fg[green]}%b$reset_color (%a) %m%u%c"
zstyle ':vcs_info:git*+set-message:*' hooks git-st
function +vi-git-st() {
    local ahead behind
    local -a gitstatus

    ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
    (( $ahead )) && gitstatus+=( "↑ ${ahead}" )

    behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
    (( $behind )) && gitstatus+=( "↓ ${behind}" )

    hook_com[misc]+=${(j:/:)gitstatus}
}

# count prompt for command
local CMD_ID=0
function preexec {
  CMD_ID=$(expr $CMD_ID + 1)
}

#print all default colors
function fg_print {
  for k in "${(@k)fg}"; do
    echo "fg      $fg[$k]$k$reset_color"
    echo "fg_bold $fg_bold[$k]$k$reset_color"
    echo "bg      $bg[$k]$k$reset_color"
    echo "bg_bold $bg_bold[$k]$k$reset_color"
  done
}

# setopt print_exit_value         # Alert me if something's failed
# print exit code on error
local FAILD_CMD_ID=0
function precmd {
  exit_code=$?
  if [ $exit_code -ne 0 ] && [ $FAILD_CMD_ID -ne $CMD_ID ]; then
    FAILD_CMD_ID=$CMD_ID
    echo "${fg[red]}✖ $exit_code$reset_color"
  fi

  vcs_info # load VCS information

  current_user=$(whoami)
  current_host=$(hostname -s)
  current_dir=$(pwd | sed -e "s|^$HOME|~|" -e 's-\([^/.]\)[^/]*/-\1/-g')
  #current_git_repo=$([ -d .git ] || basename $(git rev-parse --show-toplevel))
  #current_git_branch=$(git branch 2> /dev/null | sed -n '/\* /s///p' | sed 's/^( *//;s/ *)$//;')

  # precmd start
  precmd="${fg[default]}#$reset_color "

  # current_user & current_host
  if [ "$current_user" = "root" ]; then precmd+="${fg_bold[red]}"; else precmd+="${fg[cyan]}"; fi
  precmd+="$current_user$reset_color${fg[default]}@$reset_color${fg[blue]}$current_host$reset_color"

  # current_dir
  precmd+=" ${fg[default]}in$reset_color ${fg[yellow]}$current_dir$reset_color"

  ## current_git_repo
  #if [ -n "$current_git_repo" ]; then
  #  precmd+=" ${fg[magenta]}$current_git_repo$reset_color"
  #fi

  ## current_git_branch
  #if [ -n "$current_git_branch" ]; then
  #  if [[ "$current_git_branch" != "detached "* ]]; then
  #    precmd+=" ${fg[default]}on$reset_color"
  #  fi;
  #  precmd+=" ${fg[green]}$current_git_branch$reset_color"
  #fi
  precmd+=" ${vcs_info_msg_0_}"

  echo "$precmd"
}

# setopt promptsubst # substitude variables within prompt string
#PS1='❯ '
PS1='🐵 '
#PS1='🧀 '
PS2='▪ '

# right prompt
#RPROMPT='[%D{%H:%M:%S}]' # date
