
# First thing, load zsh theme customizations
[[ -s ~/.zsh_customizations ]] && source ~/.zsh_customizations


# This ensures that tmux always starts with 256-color support - good for vim/neovim
alias tmux="tmux -2"
# export TERM=screen-256color
# Works better with vim
export TERM=xterm-256color

# NODE VERSION MANAGER
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Set base for posting
export POSTING_ROOT=/home/bobby/posting/
export POSTING_EDITOR=vim

# _________ PATH UPDATES ___________

# export MANPATH="/usr/local/man:$MANPATH"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Add path for go installs
export PATH="$PATH:$HOME/go/bin"

# Add /usr/local/go/bin to PATH in case you have a later version here
export PATH=/usr/local/go/bin:$PATH

# Add .local/bin to PATH
export PATH="$HOME/.local/bin":$PATH
export PATH="$HOME/.local/lib":$PATH

# NVIM to use binary PATH in /opt if it exists there
if [[ -s /opt/nvim-linux64/bin/nvim && ! -s /usr/local/bin/nvim ]]; then
    export PATH="/opt/nvim-linux64/bin":$PATH
elif [[ -s /usr/local/bin/nvim ]]; then
    export PATH="/usr/local/bin":$PATH
fi

# Go to use binary PATH in /usr/local/bin if it exists there
if [[ -s /usr/local/bin/go ]]; then
    alias go="/usr/local/bin/go"
fi

# Tmux to use binary PATH in /usr/local/bin if it exists there
if [[ -s /usr/local/bin/tmux ]]; then
    alias tmux="/usr/local/bin/tmux -2"
fi

##### Google Cloud SDK
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/bobby_vz/sandbox/google-cloud-sdk/path.zsh.inc' ]; then . '/home/bobby_vz/sandbox/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/bobby_vz/sandbox/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/bobby_vz/sandbox/google-cloud-sdk/completion.zsh.inc'; fi



# _________ SHELL VARIABLE UPDATES ___________

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# SET CUSTOM MANPAGER APP
export MANPAGER='vim +MANPAGER -'


# _________ OTHER ___________

# cheat.sh cmdline tool (cht.sh)
PATH_DIR="$HOME/bin"  # or another directory on your $PATH
mkdir -p "$PATH_DIR"
[ ! -f "$PATH_DIR/cht.sh" ] && curl https://cht.sh/:cht.sh > "$PATH_DIR/cht.sh"
chmod +x "$PATH_DIR/cht.sh"
alias ch="$PATH_DIR/cht.sh"



# Force other bash files to load
[[ -s ~/.bash_aliases ]] && source ~/.bash_aliases
[[ -s ~/.bash_pbx ]] && source ~/.bash_pbx
[[ -s ~/.bash_git ]] && source ~/.bash_git
[[ -s ~/.bash_utils ]] && source ~/.bash_utils
[[ -s ~/.oh-my-zsh/oh-my-zsh.sh ]] && source ~/.oh-my-zsh/oh-my-zsh.sh















# Mount SSHFS dirs as needed
# SSHFS_MOUNT_COUNT=$(ps aux | grep -i sftp | grep -v grep | wc -l )
# [[ ${SSHFS_MOUNT_COUNT} -eq 0 ]] && sudo sshfs alpha:/home/control-io/ /home/bobby/alpha -oIdentityFile=/home/bobby/.ssh/pbx-pems/<key>.pem


# Load other bash files if not loaded
#[[ ${ALIASES_LOADED} -ne 1 && -s ~/.bash_aliases ]] && source ~/.bash_aliases
#[[ ${PBX_LOADED} -ne 1 && -s ~/.bash_pbx ]] && source ~/.bash_pbx
#[[ ${GIT_LOADED} -ne 1 && -s ~/.bash_git ]] && source ~/.bash_git
#[[ ${UTILS_LOADED} -ne 1 && -s ~/.bash_utils ]] && source ~/.bash_utils




