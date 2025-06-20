#!/bin/sh
# Copy config file to new machine

CALLING_USER=$(whoami)

# Maintain user's home (even if calling with sudo)
HOME=$(getent passwd "$CALLING_USER" | cut -d: -f6)

SUDO=""

# if not root, run as sudo
if [ "$(id -u)" -ne 0 ]; then
    SUDO="sudo"
    printf "[+] Not running as root - adding sudo\n"
else
    printf "[+] Running as root\n"
fi

printf "[+] Home: $HOME\n"

# Execute from the dir the script is in
cd "$(dirname "$0")" || exit

# Sync local config files with cloned repo so i can push up my changes
cp -f -v ./config/.bash_aliases  $HOME/
cp -f -v ./config/.bash_git  $HOME/
cp -f -v ./config/.bash_pbx  $HOME/
cp -f -v ./config/.bash_utils  $HOME/
cp -f -v ./config/.bashrc  $HOME/
cp -f -v ./config/.p10k.zsh  $HOME/
cp -f -v ./config/.tmux.conf  $HOME/
cp -f -v ./config/.vimrc  $HOME/
cp -f -v ./config/.zshrc   $HOME/
cp -f -v ./config/.zsh_customizations  $HOME/
cp -f -v ./config/.tmux_init.sh  $HOME/



if [ ! -d $HOME/.config/ ]; then
    mkdir -p $HOME/.config/
fi

cp -v -r ./config/.config/nvim  $HOME/.config/
cp -v -f -r ./config/.config/lazygit  $HOME/.config/

$SUDO cp -f -v ./config/usr_local_bin/* /usr/local/bin/


if [ "$1" = "install" ]; then
    printf "[+] Removing stale lockfiles...\n\n"
    $SUDO rm -f /var/lib/dpkg/lock-frontend
    $SUDO rm -f /var/lib/dpkg/lock

    printf "[+] Installing packages...\n\n"
    $SUDO apt-get update && $SUDO apt install python3 wget zsh lua5.4 curl tar ripgrep fzf make gcc unzip git git-all python3-pygments xclip build-essential p7zip-full jq locate sshpass xsel cmake nodejs npm libstdc++6 vim-gtk3 libc6-dev libc6-dev-i386 nasm binutils -y

    printf "[+] Installing latest neovim stable release...\n\n"
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    $SUDO rm -rf /opt/nvim
    $SUDO tar -C /opt -xzf nvim-linux-x86_64.tar.gz
    # echo 'export PATH="/opt/nvim-linux-x86_64/bin:$PATH"' >> $HOME/.zshrc

    printf "[+] Installing nvm...\n\n"
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

    # Download and install lazygit
    printf "[+] Installing lazygit...\n\n"
    LAZYGIT_VERSION='0.40.2'
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" \
    && tar xf lazygit.tar.gz lazygit \
    && mv -f lazygit /usr/local/bin/ \
    && rm lazygit.tar.gz
    
    printf "[+] Installing oh-my-zsh...\n\n"
    # sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    printf "[+] Installing powerlevel10k...\n\n"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"

    printf "[+] Sourcing .zshrc ...\n\n"
    cp -v ./config/.zshrc   $HOME/
    echo 'export PATH="/opt/nvim-linux-x86_64/bin:$PATH"' >> $HOME/.zshrc
    zsh

    printf "[+] Setting default shell...\n\n"
    if which zsh >/dev/null 2>&1; then
        chsh -s $(which zsh)
    fi
fi

echo "Done!"

