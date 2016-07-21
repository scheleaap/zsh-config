# Basic file handling
alias mv='\mv -i' # ask before overwrite file
alias cp='\cp -i' # ask before overwrite file
alias rm='\rm -i' # ask before remove file
alias mkdir='mkdir -p'
alias ..='cd ..'
alias ...='cd ../..'

# Pretty-print of the PATH variable:
alias path='echo -e ${PATH//:/\\n}'

alias du='du -kh'
alias df='df -kTh'

# ls
alias ls='ls -Gl' # colorize types
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

# other
alias mci='mvn clean install'
alias xopen='xdg-open'

# Deposit Solutions
alias tmp='cd ~/tmp'
alias work='cd ~/workspace'
alias btc='cd ~/workspace/ds-comonea-b2c'
alias doc='cd ~/workspace/ds-comonea-documentation'
alias scr='cd ~/workspace/ds-comonea-scripts'
alias mig='cd ~/workspace/ds-comonea-b2c/cb2c-businesslogic/cb2c-bl-db-migration/src/main/resources/db/migration'
