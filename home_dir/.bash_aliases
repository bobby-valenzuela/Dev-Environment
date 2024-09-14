# Some very handy aliases

export ALIASES_LOADED=1

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
alias apacherestart='sudo service apache2 restart'
alias rr="sudo service apache2 restart && echo 'Apache Restarted!'" # Restart Apache2
alias ee="tail -f /var/log/apache2/error.log"
alias e0="tail -f -n 0 /var/log/apache2/error.log" # Tail Apache error log - only show added lines
alias re="rr && ee"     # Restart Apache and tail error log
alias er="watch egrep -i 'DBD::' /var/log/apache2/error.log"        # Tail error log for SQL errors


## Git
alias showmerges="git log --oneline --merges -E --grep 'DEV-[0-9]+' -n 15" # Shows last 15 merges

# SSH/SCP
alias cc='quickconnect'
alias scpdownloads='cd /mnt/c/Users/BobbyValenzuela/OneDrive\ -\ Probax/Documents/SCP-Downloads'
alias ssh-keyupdate="{ eval $(ssh-agent -s) ; } && ssh-add ~/.ssh/id_rsa"



