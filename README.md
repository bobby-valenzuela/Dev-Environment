### Table of Contents

- [Setup](#setup)
  - [ZSH](#zsh)
  - [TMUX](#tmux)
  - [VIM](#vim)
  - [Trouble Shooting (WSL)](#trouble-shooting-wsl)
- [Quick Reference](#quick-reference)
  - [TMUX](#tmux-1)
  - [Vim](#vim-1)

---



# Setup

Preliminaries
- [Install Wezterm Editor](https://wezfurlong.org/wezterm/install/linux.html)
  - If on WSL then you will need to copy your ~/.wezterm.lua file to your windows home dir: `cp ~/.wezterm.lua /mnt/c/Users/<username>`
- [Install node version manager (nvm)](https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating)
```bash
sudo apt install libstdc++6 -y
sudo apt install curl -y
sudo apt install gcc -y
sudo apt install git-all
sudo apt install xse
sudo apt install lua5.3 # Or later version
```

<br />

## ZSH
- [Install ZSH with OhMyZsh](https://ohmyz.sh/)
  - Replace ~/.zshrc with one saved.
- [ZSH Syntaz highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)
- [Install Powerline10k Theme](https://github.com/romkatv/powerlevel10k)
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

## Neovim (via lazy vim)
- [Install Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md)
- [Install LazyVim](https://www.lazyvim.org/installation)

<br />

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

# Quick Reference

Quick references for key-bindings I commonly use.

<br />

### General copy/paste/searching within this setup

<br />

__Tmux search__
- Enter copy mode: `<bind-key> + [` 
- Start search: `/`
- Enter search term and then `<Enter>` (then use `n/N` to search throughout matches - search starts at top of page, use `N` to search backwards)
- End search: `q`

<br />

__tmux copy/paste [MAIN]__  _(copy to tmux buffer and clipboard)_
- Enter copy mode: <bind-key>  `[`
- Use arrows to find text to start to copy from
-Start Selection: `v`
- Copy: `y`
- Paste (from tmux buffer): `<bind-key> + ]`
- Paste (from system clipboard): `Ctrl+Shift+V`

<br />

__Neovim and Cli quick copy commands__
- Tmux quick copy (from cli to system clipboard): `Mouse select + y (while selecting)`
- Neovim copy (clipboard) => `Select (mouse/v) + y`

<br />

## TMUX

- Enable TMUX plugins by install TPM: `https://github.com/tmux-plugins/tpm`
- Reload config file: `tmux source ~/.tmux.conf`
- Reload TMUX environment: `Ctrl+I`  _For re-loading Theme for example_

<br />

### Sessions
Open tmux as a named session: `tmux new -s <name>`  
To detach a tmux session: `Ctrl+B+D`  
View tmux sessions (from cli): `tmux ls`  
Re-attach to session (from cli): `tmux attach -t 0`  
Rename tmux sessions (from cli): `tmux rename-sesssion -t 0 <name>`  
Killing tmux sessions (from cli): `tmux kill-sesssion -t 0 <name>` 
__Where ‘0’ is your session id/name__

<br />

### Windows
Rename Window: `Ctrl+B+,`  
Create new Window: `Ctrl+B+C`  
Show all Windows: `Ctrl+B+S`  
Show all Windows (with preview): `Ctrl+B+W` _Enter to select_  
Switch between windows: `Ctrl+B+<number>`  
Close Window: `exit`

<br />

### Panes
Split Windows Vertically: `Ctrl+B+%`  
Split Windows Horizontally: `Ctrl+B+"`  
Navigate subwindows (panes): c  
Show pane numbers: `Ctrl+B+Q`  
Move current pane left: `Ctrl+B+{`  
Move current pane right: `Ctrl+B+}`  
Zoom in/out to make pane full screen: `Ctrl+B+Z`
Close pane: `exit` or `Ctrl+B+Z`

<br />

## Vim
There are loads of good vim cheat sheets out there and this isn't a substitution, but rather a list of common/handy ones I've found to be efficient on my workflow.  
[Ultimate Cheat Sheet](https://catswhocode.com/vim-cheat-sheet)

<br />

---  

### Buffers
`:E` - Open file nav (short for `explore`)  
`:e ~/.vimrc` - edit a file by name (short for `:edit`).  
`:ls` or `buffers`   - view buffers  
`C-^` (which is `Ctrl+Shift+6`) - swap back and forth between current (`#`) and alternate (`a%`) buffers.  
`:bn` - rotate to next buffer.  
`:bp` - rotate back to previous buffer.  
`:bf` or `:bl` - go to first/last buffer (f/l)  
`:b3`     - Select buffer #3.  
`:b file1.txt`     - Select by filename.  
`:b` then `<C-d>` - show all open buffers to cycle though.
`:badd myfile.txt` - add a new buffer by filename  
`:bd myfile.txt` - delete a buffer by buffer number or filename  
`:%bd` - Delete all open buffers  
`:wall` - Write to all open buffers  

<br />

### Moving
`m {a-z}`	Setting markers/waypoints as {a-z}  
`‘ {a-z}`	Move to marker/position {a-z}  
`''`	- Move to previous position  (thats two single quotes in succession, not a single double quote)


<br />

---  

### Editing
`xp`    - swap two adjacent letters (move letter cursor one place to the right)  
`J`     - Merge lines: Apend line below to the end of the current line.  
`cc` - change entire line.  
`~` - Change casing of selected text/character under cursor.  
`g~w` - change case of word (until whitespace)  
`g~~` - change case of entire line  
`dt/<searchterm>` - Delete text up until search term

<br />

---  

### Selecting
`o`    - Reverse order while continuing to select  
`/<term>` - While in visual mode, select lines based on RegEx  
`C-v` - enter visual block mode. Once text is selected enter insert mode (`a/A`,`i/I`,`c/C`,`p/P`,`o/O` etc) and make changes. They will appear on the first line, but once you hit Esc those changes will be made to all selected lines. 

<br />

---

### RegEx && Searching
`\r`                - This represents newline  
`%s/(foo)/\1\r`     - Replaces matches with itself followed by a newline   
`s///g` - When text is selected you can use a replace (without the %) to replace text within the selected range  

<br />

---  

### Copy/Pasting
`reg`    - View registers  
`0p`     - Paste from 0 register   
`C-r0`  - Paste from 0 register into vim command line. (Useful for pasting into a search regex)  
`C-rw`  - Copy whatever word is under cursot and paste into vim command line. (Useful for pasting into a search regex)  
`"_dd`  - Delete line and yank to black hole register (keeps registers the same).  
`ayy` - Yank line to "a" register (overwriting register a).  
`Ayy` - Yank line to "a" register (appending to register a)  
`d` or `dd` - Cuts (Deletes and yanks)

<br />

_Note: '^J' in a register will be changed to a newline when pasting._

<br />

---

### Numbers
`C-a`    - Increment Highlighted Numbers  
`gC-a`   - Increment Highlight Numbers in sequence (each matched item will increment one more than previous match).  
`C-x`    - Decrement Highlighted Numbers  
`gC-x`   - Decrement Highlight Numbers in sequence (each matched item will increment one more than previous match).

<br />

---  

### Indenting
`=` - Auto-Indenting (based on rules - works on selected text as well)  
`=ap` -  Auto-Indent Paragraph  
`<` - Indent Left  
`>` - Indent Right  

<br />

---  

### Macros
`q<letter><commands>q` - record a macro  
`@<letter>` - execute macro (once)  
`<number>@<letter>` - To execute the macro <number> times  
`:3,9 normal @b` - Run macro "b" on lines 3-9.  
`reg <macro_letter>` - View register (holds macros as well - note '[^' represents the Esc key)  

__Best Practices when recording macros__
- Once recording has started, type `0` to begin at the beginning of the line.
- Once done with commands, type 'j' before you finish recording to ensure ending on the next line (in case this macro runs multiple times).

<br />

---

### Continguous Lines of text (paragraph)
`yap` - Yank with newlines  
`yip` - Yank without newlines  
`cap` - Change with newlines  
`cip` - Change without newlines  
`dap` - Delete with newlines  
`dip` - Delete without newlines  

<br />

---  

### Brackets && Braces

##### Before brackets
`v%` - Select Content within parens/brackets (inclusively) if you're right before a bracket.  

<br />

##### Within Brackets
Finding begin/end of curly braces you're inside of...  
`vi{` - Selects everything within the block... then Esc to leave you at ending "}  
`ci{` - Change text inside brackets (exclusively)  
`ca{` - Change text inside brackets (inclusively)  
`yi{` - Yank text inside brackets (inclusively)  
`ya{` - Yank text inside brackets (exclusively)  
`di{` - Delete text inside brackets (inclusively)  
`da{` - Delete text inside brackets (exclusively)  

<br />

---  

Note: `C-` should be taken to mean `Ctrl+`. All other keys are to be entered in succession (not simultaneously).




