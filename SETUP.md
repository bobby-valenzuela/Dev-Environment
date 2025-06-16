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
sudo apt install make gcc ripgrep unzip git git-all xclip zsh build-essential p7zip-full jq python3-pygments curl locate sshfs sshpass xsel lua5.3 cmake xse libstdc++6 vim-gtk3 libc6-dev libc6-dev-i386 nasm binutils -y 
```
- [Install Python](https://www.python.org/downloads/source/) => Download source and compile  
- [Install Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-download)  => Download binary from tar and just extract into /opt/nvim-linux64  
- [Install node version manager (nvm)](https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating)
- [Install Node using nvm](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04)
- [Install powerline fonts](https://github.com/powerline/fonts)
- [Install yazi](https://yazi-rs.github.io/docs/installation/#debian)
- [Install fzf](https://github.com/junegunn/fzf)
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
  - ⚠️ This can be skipped if you're copying my ~/.zshrc (I already have bit in zshrc that checks and clones repo)  
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
- uv https://docs.astral.sh/


 <br />  

General Must haves
```bash
sudo apt install curl -y
sudo apt install sshfs -y
sudo apt install sshpass -y
```





---
### Other  

__Harlequin SQL__
- `F2` - focus on query editor  
- `F5` Focus on the Results Viewer.  
- `F6` Focus on the Data Catalog.  
- `F8` Show the Query History Viewer.  
- `F9`, `ctrl+b` Toggle the sidebar.  
- `F10` Toggle full screen mode for the current widget.  
- `ctrl+e` Export the returned data to a CSV, Parquet, or JSON file.  
- `ctrl+r` Refresh the Data Catalog.  
- `ctrl+enter`, `ctrl+j` Run the query  
- `ctrl+s` Save the contents of the Query Editor to a file.  
- `ctrl+n` Create a new buffer (editor tab).  
- `ctrl+w` Close the current buffer (editor tab).  
- `ctrl+k` View the next buffer (editor tab).  
- `ctrl+/`, `ctrl+\_` Toggle comments on selected line(s).  
- MySQL Connection: `harlequin -a mysql -h server.com -p 3306 -U user --password pass --theme tokyo-night`  
- SQL Server: `harlequin -a odbc 'Driver={ODBC Driver 18 for SQL Server};Server=tcp:server.com,1433;Database=mydb;Uid=user;Pwd=pass;Encrypt=yes;TrustServerCertificate=yes;Connection Timeout=30;' --theme tokyo-night`  

Initialize project, Install harlequin, and add adapters
```bash
uv init
uv tool install harlequin
uv tool install 'harlequin[postgres,mysql,s3,odbc]'

```

<br />

__Dadbod DB setup__
- Install MySql
 ```bash
sudo apt install mysql-server
```
- Install sqlcmd: https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-setup-tools?view=sql-server-ver16&tabs=redhat-install
- Install ODBC: https://learn.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver16&tabs=alpine18-install%2Calpine17-install%2Cdebian8-install%2Credhat7-13-install%2Crhel7-offline

Adding Connections:
- sql server: `sqlserver://{user}:{password>}@{host>}:{port}/{database}?trustServerCertificate=yes`  
- mysql: `mysql://{user}:{password}@{host}:{port}/{database}`

<br />

Executing query under cursor with `<leader>rr`, add this custom key binding (lua).
```lua
vim.keymap.set('n', '<leader>rr', '<Plug>(DBUI_ExecuteQuery)', { desc= 'Execute query under cursor (DBUI)', noremap = true, silent = true })
```


<br />

__Kickstart notes__  
https://github.com/bobby-valenzuela/kickstart.nvim.git  
`git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim-kickstart`  
When you run Neovim using nvim-kickstart alias it will use the alternative config directory and the matching local directory ~/.local/share/nvim-kickstart. You can apply this approach to any Neovim distribution that you would like to try out.  
`alias nvim-custom='NVIM_APPNAME="nvim-kickstart" nvim'`

<br />

__Running Neovim on older machines__  
https://mihai.fm/running-neovim-on-older-linux-boxes/  
https://stackoverflow.com/questions/46534957/configure-error-these-critical-programs-are-missing-or-too-old-gcc-make-w/62252633#62252633  


patchelf --set-interpreter /home/ubuntu/glibc/lib/ld-linux-x86-64.so.2 --set-rpath /home/ubuntu/glibc/lib:/usr/lib64 ./nvim-linux64/bin/nvim
