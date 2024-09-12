# Preliminaries
- Install Curl and Git

<br />

# ZSH
- [Install ZSH with OhMyZsh](https://ohmyz.sh/)
  - Replace ~/.zshrc with one saved.
- [Install Powerline10k Theme](https://github.com/romkatv/powerlevel10k)
  - Be sure to install the fonts mentioned and select those fonts for your terminal.
  - For WSL I install "MesloLGS NF" and "DroidSansM Nerd Font" and set the "DroidSansM" in terminal.
    - DroidSansM: https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/DroidSansMono.zip 
  - Replace ~/.p10k.zshrc with one saved and source.
  - [Font glyphs from Nerdfont](https://www.nerdfonts.com/cheat-sheet)
- [Install ZSH syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)
  - One cmd: `mkdir ~/zsh_utils/ && cd ~/zsh_utils && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git`


<br />

# TMUX
- [Install tmux: Terminal MultiPlexer](https://github.com/tmux/tmux/wiki/Installing)
- [Install tmux plugin manager](https://github.com/tmux-plugins/tpm)
  - One cmd: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm` 
- [Install Catppuccin Theme](https://github.com/catppuccin/tmux)
  - Already installed is tpm is installed. 
- Install all plugins loaded with `<prefix>+I` in a tmux session.
- Replace ~/.tmux.conf with saved one and source with `tmux source-file ~/.tmux.conf`

<br />

# VIM
- [Install Vim-Plug plugin manager](https://github.com/junegunn/vim-plug)
- - Actually, this is more of a backup as I've added the auto-install snippet for vim-plug into the .vimrc file
- Replace ~/.vimrc with saved one (source with :so % or just close/re-open)
- If you have ~/.vimrc.plug, replace that with saved ones
- Load plugins by opening .vimrc or vimrc.plug file (whichever has plugins loadede) and running `:PlugInstall`

<br />

# Trouble Shooting (WSL)

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
