# Some very handy aliases

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias mkdir='mkdir -pv'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

## Update cache and upgrade binaries
alias upandup='sudo apt update && sudo apt upgrade'

## Apache
alias apachelogerr='tail -n15 -f /var/log/apache2/error.log'
alias apachelogacc='tail -n15 -f /var/log/apache2/access.log'
alias apacher='sudo service apache2 restart'

## Git
alias ssh-keyupdate="{ eval $(ssh-agent -s) ; } && ssh-add ~/.ssh/id_rsa"
alias showmerges="git log --oneline --merges -E --grep 'DEV-[0-9]+' -n 15" # Shows last 15 merges

