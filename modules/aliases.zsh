# Basic file handling
alias mv='\mv -i' # ask before overwrite file
alias cp='\cp -i' # ask before overwrite file
alias rm='\rm -i' # ask before remove file
alias mkdir='mkdir -p'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Pretty-print of the PATH variable:
alias path='echo -e ${PATH//:/\\n}'

alias du='du -kh'
alias df='df -kTh'

# ls
alias ls='ls -h --color=auto'
alias l='ls -lhv'
alias ll='ls -lAhv'

# #-------------------------------------------------------------
# # The 'ls' family (this assumes you use a recent GNU ls).
# #-------------------------------------------------------------
# # Add colors for filetype and  human-readable sizes by default on 'ls':
# alias ls='ls -h --color'
# alias lx='ls -lXB'         #  Sort by extension.
# alias lk='ls -lSr'         #  Sort by size, biggest last.
# alias lt='ls -ltr'         #  Sort by date, most recent last.
# alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
# alias lu='ls -ltur'        #  Sort by/show access time,most recent last.
#
# # The ubiquitous 'll': directories first, with alphanumeric sorting:
# alias ll="ls -lv --group-directories-first"
# alias lm='ll |more'        #  Pipe through 'more'
# alias lr='ll -R'           #  Recursive ls.
# alias la='ll -A'           #  Show hidden files.
# alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...

# grep
alias grep='grep --color=auto' # colorize matching parts

# Maven
alias mvn="mvn-colorized"
alias mcc='mvn clean compile'
alias mcp='mvn clean package'
alias mci='mvn clean install'

# Git
alias gap='git add -p'
alias gsa='git stash apply'
alias gsd='git stash drop'
alias gss='git stash save'
alias gitg='nohup gitg > /dev/null 2>&1 &'

# Kubernetes
alias kc='kubectl'
alias kx='kubectx'
alias kn='kubens'

# Terraform
alias tfa='terraform apply'
alias tfd='terraform destroy'
alias tfp='terraform plan'

# other
alias man='man-colorized'
alias xopen='xdg-open'
alias dc='docker-compose'
alias copy-tab='echo "\\t" | xclip'
