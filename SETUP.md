### Table of Contents

- [Setup](#setup)
- [Trouble Shooting (WSL)](#trouble-shooting-wsl)

---


# Setup

Preliminaries
- [Install Wezterm Editor](https://wezfurlong.org/wezterm/install/linux.html)  
  - If on WSL then you will need to copy your ~/.wezterm.lua file to your windows home dir: `cp ~/.wezterm.lua /mnt/c/Users/<username>`
- Common Generals
```bash
sudo apt install make gcc ripgrep unzip git git-all xclip zsh build-essential p7zip-full jq curl locate sshfs sshpass xsel lua5.3 cmake xse libstdc++6 -y
```
- [Install Python](https://www.python.org/downloads/source/) => Download source and compile  
- [Install Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-download)  => Download binary from tar and just extract into /opt/nvim-linux64  
- [Install node version manager (nvm)](https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating)
- [Install Node using nvm](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04)
 - ```bash
    nvm list-remote       # avaiable versions
    nvm install v14.10.0  # install a version
    nvm list              # View installed versions
    nvm use v14.10.0      # Use specific version
   ```


<br />

## ZSH
- [Install ZSH with OhMyZsh](https://ohmyz.sh/) 
  - ⚠️Replace ~/.zshrc with one saved.
- [ZSH Syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)
  - ⚠️ This can be skipped if you're copying my ~/.zshrc and ~/.oh-my-zsh. (I already have bit in zshrc that checks and clones repo)  
  - Just run this (Ubuntu) .zsrhc already has needed snippet (checks for /usr/share/zsh-syntax-highlighting)
  - ```bash
      sudo apt install zsh-syntax-highlighting -y
    ```  
- [Install Powerline10k Theme](https://github.com/romkatv/powerlevel10k)
  - ⚠️ _(use ohmyzsh installation)_
  - Be sure to install the fonts mentioned and select those fonts for your terminal.
  - [Down and Install a NerdFont](https://www.nerdfonts.com/)
    - I already have the JetBrains fonts I prefer zipped up in this repo.  
    - [OLD] For WSL I used to install "MesloLGS NF" and "DroidSansM Nerd Font" and set the "DroidSansM" in terminal. DroidSansM: https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/DroidSansMono.zip 
  - Replace ~/.p10k.zshrc with one saved and source.
  - [Font glyphs from Nerdfont](https://www.nerdfonts.com/cheat-sheet)
- [Install ZSH syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)
  - One cmd: `mkdir ~/zsh_utils/ && cd ~/zsh_utils && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git`


<br />

## TMUX
- [Install tmux: Terminal MultiPlexer](https://github.com/tmux/tmux/wiki/Installing)
- [Install tmux plugin manager](https://github.com/tmux-plugins/tpm)
  - One cmd: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm` 
- [Install Catppuccin Theme](https://github.com/catppuccin/tmux)
  - Already installed is tpm is installed. 
- Install all plugins loaded with `<prefix>+I` in a tmux session.
- Replace ~/.tmux.conf with saved one and source with `tmux source-file ~/.tmux.conf`

<br />

## VIM
- [Install Vim-Plug plugin manager](https://github.com/junegunn/vim-plug)
- - Actually, this is more of a backup as I've added the auto-install snippet for vim-plug into the .vimrc file
- Replace ~/.vimrc with saved one (source with :so % or just close/re-open)
- If you have ~/.vimrc.plug, replace that with saved ones
- Load plugins by opening .vimrc or vimrc.plug file (whichever has plugins loaded) and running `:PlugInstall`
- Make sure to do both the Linux and Neovim install

<br />

---
## Neovim (via lazy vim)
- [Install Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md)
- [Install LazyVim](https://www.lazyvim.org/installation)  


LazyGit tutorial: https://www.youtube.com/watch?v=Ihg37znaiBo  

Use `:LazyExtras` to enable some extra plugins
- Harpoon
- mini.indentscope
Check `nvim/lazy-lock.json` for full current list in use.

<br />

### INSTALL PERL LANGUAGE SERVER ###

General Guide: https://climatechangechat.com/setting_up_lsp_nvim-lspconfig_and_perl_in_neovim.html#basic-setup-get-a-perl-language-server-up-and-running-with-neovim


--- Install PLS package
```
perl -MCPAN -e shell
install PLS
```

add this into `init.lua` OR `~/.config/nvim/lua/config/lazy.lua`  

```
local lspconfig = require("lspconfig")

-- Perl PLS (Perl Language Server)
lspconfig.perlpls.setup({})
```

<br />

### PERL SYNTAX HIGHLIGHTING ###

Install Treesitter-perl: https://metacpan.org/pod/Text::Treesitter

In your `~/.config/nvim/lua/plugins/treesitter.lua` (or a similar file where you configure plugins):

```lua
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Ensure that Tree-sitter parsers are installed
      ensure_installed = {
        "perl", -- Add Perl as a language to be supported by Tree-sitter
        -- You can include other languages here too
      },
      highlight = {
        enable = true, -- Enable syntax highlighting
      },
    })
  end,
}
```

<br />

---
## Trouble Shooting (WSL)

I've been using this without issue in WSL, butin case you're having issues, it could be to do with your `DISPLAY1 environment variable.
If you still get the “cannot open display” error, set the DISPLAY variable as shown below.
```bash
echo "export DISPLAY=localhost:0.0" >> ~/.bashrc
```
Note: IP is the local workstation’s IP where you want the GUI application to be displayed.  

__Helpful Related Links (WSL + GUI)__
- [Link 0](https://learn.microsoft.com/en-us/windows/wsl/tutorials/gui-apps)
- [Link 1](https://aalonso.dev/blog/how-to-use-gui-apps-in-wsl2-forwarding-x-server-cdj)
- [Link 2](https://wiki.ubuntu.com/WSL#Running_Graphical_Applications)
- [Link 3](https://wiki.iihe.ac.be/Use_X11_forwarding_with_WSL)

<br />

<br />

__Installing vulkan drivers__

```bash
sudo apt update
sudo apt install mesa-utils vulkan-tools
```

<br />

---
# Utils
- Lazygit https://github.com/jesseduffield/lazygit
- Harlequin https://github.com/tconbeer/harlequin
  - - Install DB Adapters `uv tool install 'harlequin[postgres,mysql,s3,sql-server,odbc]'`  and `sudo apt install unixodbc -y`
- Posting https://github.com/darrenburns/posting
- Lazydocker https://github.com/jesseduffield/lazydocker
- ggh https://github.com/byawitz/ggh
- Yazi file manager https://github.com/sxyazi/yazi
- Tere (cd | ls) https://github.com/mgunyho/tere
- csvlens https://github.com/YS-L/csvlens
- tufw https://github.com/peltho/tufw
- Eget https://github.com/zyedidia/eget  
- Dust https://github.com/bootandy/dust
- Youtube Downloader https://github.com/yt-dlp/yt-dlp
- mpv https://mpv.io/
- go https://go.dev/doc/install


 <br />  

General Must haves
```bash
sudo apt install curl -y
sudo apt install sshfs -y
sudo apt install sshpass -y
```




