 ### Table of Contents

- [Quick Reference](#quick-reference)
  - [TMUX](#tmux)
  - [Vim](#vim)

---


# Quick Reference

Quick references for key-bindings I commonly use.

<br />

## General copy/paste/searching within this setup
---
<br />

__Tmux search__
- `<bind-key> + [` - Enter copy mode 
  - `/` - Start search
  - Enter search term and then `<Enter>` (then use `n/N` to search throughout matches - search starts at top of page, use `N` to search backwards)
  - End search: `q`

<br />

__tmux copy/paste [MAIN]__  _(copy to tmux buffer and clipboard)_
- Enter copy mode: `<bind-key>  [`
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

<br />

## TMUX

- Enable TMUX plugins by install TPM: `https://github.com/tmux-plugins/tpm`
- Reload config file: `tmux source ~/.tmux.conf`
- Reload TMUX environment: `Ctrl+I`  _For re-loading Theme for example_
- Custom Bind key I've set: `Ctrl+t`
<br />

---
### Sessions
Open tmux as a named session: `tmux new -s <name>`  
To detach a tmux session: `<bind_key> D`  
View tmux sessions (from cli): `tmux ls`  
Re-attach to session (from cli): `tmux attach -t 0`  
Rename tmux sessions (from cli): `tmux rename-sesssion -t 0 <name>`  
Killing tmux sessions (from cli): `tmux kill-sesssion -t 0 <name>` 
__Where ‘0’ is your session id/name__

<br />

---
### Windows  
Rename Window: `<bind_key> ,`  
Create new Window: `<bind_key> c`  
Show all Windows: `<bind_key> S`  
Show all Windows (with preview): `<bind_key> w` _Enter to select_  
Switch between windows: `<bind_key> <number>`  
Close Window: `<bind_key> &` (or `exit` if all panes are closed)  

<br />

---
### Panes
Split Windows Vertically: `<bind_key> %`  (with my conf I use `|` instead of `%`)  
Split Windows Horizontally: `<bind_key> "`  (with my conf I use `_` instead of `"`)  
Navigate subwindows (panes): c  
Show pane numbers: `<bind_key> Q`  
Move current pane left: `<bind_key> {`  
Move current pane right: `<bind_key> }`  
Zoom in/out to make pane full screen: `<bind_key> z`
Close pane: `exit` or `Ctrl+B+Z`

<br />

<br />

## Vim
There are loads of good vim cheat sheets out there and this isn't a substitution, but rather a list of common/handy ones I've found to be efficient on my workflow.  
[Ultimate Cheat Sheet](https://catswhocode.com/vim-cheat-sheet)  
[LeanXinY](https://learnxinyminutes.com/docs/vim/)  
[vim.rtott](https://vim.rtorr.com/)  

---
### CommonGeneral                                                                                                                                                                                                                     
`ter[minal]` - Open terminal  
`exit` then `Ctrl-w + q` - to close terminal window  
`:verbose map Q` - see what is mapped to the `Q` key  

<br />

_File Explorer (netrw)_  
`:Explore` - Explorer (opens file tree)  
`:Vex` - Vertical Explorer (opens file tree)  
`i` - Rotate betweeb views (3rd is tree mode)  
`v` - Open file in vertical split (opens to left by default unless `set splitright` is set  
`u` - Go up one level  
`C-L` -  Move window to far left  


<br />

_Managing Changes_  
`:wa ` - ("write all") save all open buffers    
`:e!` - erase all unsaved changes  
`:bufdo e!` - erase all unsaved changes (in all open buffers)  
`u` - undo last change (normal mode)  
`C-u` - undo last change (insert mode)  
`C-r` - Redo  
`:w !diff %` or `:w !git diff --no-index % -` - view changes in vim before saving (or add this in .vimrc `command Diff execute 'w !git diff --no-index % -'`)  
 

<br />

_Bare Vim (common settings to apply on a ad-hoc plain vim editor)_
```vim
colo slate  
set number/relativenumber  
set mouse=a  
set ignorecase  
set hlsearch  
set incsearch  
set cursorline  

# Additional
syntax on
filetype on
set wrap! (toggle on of off)
```

---
### Lazyvim  (neovim)  
`<leader>/` - grep (from cwd) [🔌]  
`<leader> <space>` - file search (from cwd)  [🔌telescope]  

`<leader> f t` - Open terminal (root) [🔌]   
`Ctrl  /` - Show/Hide terminal [🔌]    


`Crtl-q` - Save search results in a quickfix list (we can even grep the quick fix list with `/`) [🔌]   
`<leader> e` - opens explorer in PWD  [🔌]  
`:Masoninstall <lanuage_server>` - Use mason to install a language server [🔌 Mason]   
`:LazyExtras` - Manage LazyExtra plugins  [🔌]  
`:LspInfo` - Get info on current LSP  [🔌]  
`:source $MYVIMRC` - Reload config (and plugins) without restarting nvim  

<br />  

### Custom  
`C-t` - Tmux bind key (Ctrl+t)   
`C-b` - Visual-Block mode (Ctrl+B)  
`<leader> gu` - Git undo last commit  
`<leader> gS` - Git stash unsaved changes  
`<leader> rm` - Remove markers  
`<leader> tt` - Toggle Twlight  

### LSP-related stuff  
`K` - get pop-up with code info [🔌]   
`gd` - 'Go to Definition' -> Find where a function/sub is defined when highlighting one [🔌]   
`gr` - 'Go to References' -> Find where a functions/sub is referenced when highlighting one [🔌]   


<br />

---
### Modes

`SHIFT v` - Visual Line Mode  
`SHIFT B` - Visual Block Mode  


<br />

---
### Tabs
`:tabnew` or `:tabnew {file}` - open a file in a new tab  
`Ctrl+w T` - move the current split window into its own tab  
`gt` - move to the next tab  
`2gt` - switch to tab #2  
`:tabc` - close the current tab and all its windows  
`:tabo` - Tabonly - close all tabs except for the current one  
`:tabdo {cmd}` - run the command on all tabs (e.g. :tabdo q - closes all opened tabs)  


<br />

---
### Windows
`Ctrl+w s` - Split open buffer horizontally  
`Ctrl+w v` - Split open buffer vertically    
`:vert sb {filename}` - Split buffer with another open buffer (you can enter file name or use tab to cycle through open buffers)  
`:e` filename	- Edit filename in current window  
`:sp {filename}`	- Split the window and open filename (if empty just splits the same buffer)    
`:vs file` - Vertically split window  (enter open/unopened file)  

_Managing Windows_  
`:Ctrl+w q` or `:clo` - Close current window  
`Ctrl+w <up arrow>` - Put cursor in top window (works for any direction)  
`Ctrl+w w` - Switch to next window    
`Ctrl+w H` - Make Leftmost full  vertical window  
`Ctrl+w L` - Make Rightmost full  vertical window  
`Ctrl+w=` - Gives the same size to all windows  
`Ctrl_w|` - Current window width = 100%  
`50Ctrl_w|` - Current window width = 50% of initial window width    
`Ctrl+w_` - Maximize current window vertically  
`:o­nly` - 	Close all windows, except current  
`hide`/`unhide` - Hide/Unhide a window (only 1)  
`:qa` - Quit All open windows (exits vim if on last tab)  


### Windows (lazy)
`<leader> w w` - switch windows [Lazyvim]  
`<leader> w q` - close window [Lazyvim]  
`<leader> w v` - verical split window [Lazyvim]  
`<leader> w o` - close all other windows [Lazyvim]  
`<space> w |` - max width of current window [Lazyvim]  
`<leader> w =` - equal width of current windows [Lazyvim]  
(in NeoTree) `s` - to open in new window in vertical split [Lazyvim]  

<br />

---  
### Buffers  
`:E` - Open file nav (short for `explore`)  
`:e ~/.vimrc` - edit a file by name (short for `:edit`).  
`:e` - reload current buffer from disk  
`:e!` - Remove all unsaved changes  
`:vert ba` - edit all buffers as vertical windows  
`:tab ba` - edit all buffers as tabs  
 
 <br /> 
 
_Viewing Buffers_  
`:b` then `<C-d>` - show all open buffers to cycle though.  
`<leader> f b` - View open buffers [🔌]   
`:ls`  - view buffers or (`buffers` with plugin)   

 <br /> 
 
_Switching Buffers_  
`:b file1.txt`     - Select by filename (tab shows open buffers, but can open new files as well)
`:bn` - rotate to next buffer.  
`:bp` - rotate back to previous buffer.  
`:b3`     - Select buffer #3 (may need to force with `b!3`).  
`L` - Cycle through all open buffers [🔌]  
`<leader>`` ` or `C-^` (which is `Ctrl+Shift+6`) - swap back and forth between current (`#`) and alternate (`a%`) buffers. [🔌]   
`:bf` or `:bl` - go to first/last buffer (f/l)  
`:badd myfile.txt` - add a new buffer by filename  

 <br /> 
 
_Deleting Buffers_  
`:bd myfile.txt` - delete a buffer by buffer number or filename  
`:%bd` - Delete all open buffers  

 <br /> 
 
_Harpoon_  
`:wall` - Write to all open buffers  
`<leader> H` - Add file to harpoon list [🔌]   
`<leader>  h` - View harpoon quick menu [🔌]   
`<leader>  {1..5}` - Harpoon to (open) specific file [🔌]  

<br />

_Lazyvim buffer controls_  
``<leader> ` `` =  switch last file (buffer)  
`<leader> f b` - view open buffers
`<leader> b e` - View buffer explorer  

<br />

---
### Moving  

<br />

_Moving along file_  
`gg` - Go to top of file  
`G` - go to bottom of file  
`: {num}` - Go to line  
`zz` - Center screen with cursor position (don't confuse with ZZ - save)  
`I/A` - Go to begin/end of line  
`[[` - Go to top of file [🔌]  
`]]` - Go to bottom of file  [🔌]  
`[i` - Go to the top of code block (via mini-indentscope) [🔌 Identscope]  
`]i`- Go to the bottom of code block (via mini-indentscope) [🔌 Identscope]  

_Markers_  
`:marks` - View all markers  
`:cc 22` - View the 22nd quickfix item    
`'` - View all markers w/explanations [🔌]    
`m {a-z}`	Setting markers/waypoints as {a-z}  
`‘ {a-z}`	Move to marker/position {a-z}  
`:delm!`  - vim clear all marks (or specific ranges like `:delm a-zA-Z0-9`)  
`''`	- Move to previous marker position  (thats two single quotes in succession, not a single double quote)  

<br />


---
### Searching  
`/` - Search (grep): type text and enter then `n/N` to iterate through matches  
`s {first_char}{second_char}` - search forward to matches and show labels + enter the label of the match you want to go to [🔌leap]  
`S {first_char}{second_char}` - search backward to matches and show labels + enter the label of the match you want to go to [🔌leap]  
`gs {first_char}{second_char}` - search _forward_ to matches and show labels + enter the label of the match you want to go to [🔌leap]. _Global search (across windows splits)_  
`gS {first_char}{second_char}` - search  _backward_ to matches and show labels enter the label of the match you want to go to [🔌leap]. _Global search (across windows splits)_  

<br />

_RegEx_  
`\r`                - This represents newline  
`%s/(foo)/\1\r`     - Replaces matches with itself followed by a newline   
`s/old/new/g` - When text is selected you can use a replace (without the %) to replace text within the selected range (use `gc` to replace with confirmation first)    
`s/\VTEXTOMATCH/REPLACEWITHTHIS/` - The `\V` (very no magic mode treats all characters literaly except the `\`  
`s/\v\w+/` - The `\v` (very magic mode treats most special cahrs as special - as in regular regex    
`noh` - "No Highlighting" - remove highlited matches  
`vim /function/ **/*.pl` - Grep all matches of `function` in every '.pl. file in current dir (recursively). Then `:cope` to create a QuickFix list  
`vim /\Vfunction/ /home/ubuntu/**/*.pl` - Grep all matches of `function` in every '.pl. file in current dir (recursively). Then `:cope` to create a QuickFix list  

<br />

__Finding Multiple Occurrences__  
1. Select text (in visual mode)
2. `#` to highlight all occurences (can use `*` but that begins at next occurence)
3. `n/N` to select next/previous occurences
4. `v` again to select the highlighted occurence

<br />


__Change multiple instances without multi-cursor__  
1. Select text to change  
2. `#` to highlight all matches (selects next match)
3. Make sure you're in normal mode    
4. `cgn` - change globally (when done changing, press `Esc` to exit insert mode)  
5.  `.` to change every subsequent match.  

_(Can also use dgn to delete multiple references)_

<br />

---
### SYDC (Selecting/Yanking/Deleting/Changing)  

`viw` - selects just the word.  
`vaw` - selects the word plus any surrounding whitespace.  
`C-rw`  - Copy whatever word is under cursor and paste into vim command line. (Useful for pasting into a search regex)  
`o`    - Reverse order while continuing to select  
`/<term>` - While in visual mode, select lines based on RegEx  
`C-v` - enter visual block mode. Once text is selected enter insert mode (`a/A`,`i/I`,`c/C`,`p/P`,`o/O` etc) and make changes. They will appear on the first line, but once you hit Esc those changes will be made to all selected lines.  
`gs{char}` - Global surround. Example: Select text then `gs"`  
`d` or `dd` - Cuts (Deletes and yanks)  
`D/d$` - 	Cut to end of line  
`y$` -	Yank/Copy to end of line  
`<leader> p` - View Yank history [🔌 Yanky]  

<br />

_Multi-Line_
`10y` -  Yank 10 lines  
`10d` -  Delete 10 lines  
`10V` -  Select 10 lines  


<br />

_Mass Select_  
`ggVG` - Select entire file  
`:1,500y` - Copy everything from line 1 to 500 (use `d` for delete) (can start/end on any line - usefull for slicing bits)  

<br />

<br />

_Continguous Lines of text (paragraph)_  
`yap` - Yank with newlines  
`yip` - Yank without newlines  
`cap` - Change with newlines  
`cip` - Change without newlines  
`dap` - Delete with newlines  
`dip` - Delete without newlines  

<br />

_Registers: Viewing/Yanking/Pasting_  
`:reg`    - View registers (vim)  
`"0p`     - Paste from 0 register (in normal mode)  
`"2p`     - Paste 2nd to last thing yanked (grabs from 2 register in normal mode)  
`C-r0`  - Paste from 0 register (in insert mode or into vim command line). Useful for pasting into a search regex  
`"_dd`  - Delete line and yank to black hole register (keeps registers the same).  
`ayy` - Yank line to "a" register (overwriting register a).  
`Ayy` - Yank line to "a" register (appending to register a)  
_Note: '^J' in a register will be changed to a newline when pasting._

<br />

_Brackets && Braces_  
`%` - Select top/bottom of current block  
`v%` - Select Content within parens/brackets (inclusively) if you're right before a bracket.  
`vi{` - Selects everything within the block... then Esc to leave you at ending "}"  
`ci{` - Change text inside brackets (exclusively)  
`ca{` - Change text inside brackets (inclusively)  
`yi{` - Yank text inside brackets (inclusively)  
`ya{` - Yank text inside brackets (exclusively)  
`di{` - Delete text inside brackets (inclusively)  
`da{` - Delete text inside brackets (exclusively)  
`{action}ab` - (y)ank/ (d)elete, (v)isual select entire block of code including lines where curly braces are on. Or, `zcdd` (zc to fold the block and dd to cut).

<br />

_Folding_  
`zc` - fold a block of code (z = fold and c = close)  
`zo` - unfold a block of code (z = fold and c = open)  
`zM` - fold all blocks in buffer  
`zR` - unfolds all in buffer  

<br />

---  
### Editing  
`ciw` - Change inner word (replace)
`xp`    - swap two adjacent letters (move letter cursor one place to the right)  
`J`     - Merge lines: Apend line below to the end of the current line.  
`cc` - change entire line.  
`dt/<searchterm>` - Delete text up until search term  

<br />

_Casing_  
`u` Selected text to lower case  
`U` Selected text to upper case  
`~` - Change casing of selected text/character under cursor.  
`g~w` - change case of word (until whitespace)  
`g~~` - change case of entire line  
`read !<shell_command>` - Paste shell output into buffer.  
`:MarkdownPreview` - View MarkdownPreview in browser [🔌 Markdown-Preview]  

<br />

_Identing_  
`<<`/`>>` - Indent code left/right  
`==`/`=` - Auto indent code (`==` for one line and `=` for multiple lines)  

<br />

_Sorting_  
`:sort`  Sort all lines  
`:sort!` Sort all lines in reverse  
`:sort u` Sort all lines and remove duplicates  
`:sort`/`:sort!` - When lines are selected, this will sort in ASC/DESC order respectively.  

<br />

_Surrounding_  
`faiw"` - Surround inner word with " (press fa fast) [🔌 mini-surround]   
`fd"` - Remove surrounding quotes (press fd fast) [🔌 mini-surround]  
`fr"'` = replace surrounding double quotes with single-quotes (press fr fast) [🔌 mini-surround]  

<br />

_Indenting_  
`=` - Auto-Indenting (based on rules - works on selected text as well)  
`=ap` -  Auto-Indent Paragraph  
`<` - Indent Left  
`>` - Indent Right  

<br />

_Numbers_ 
`C-a`    - Increment Highlighted Numbers  
`C-x`    - Decrement Highlighted Numbers  
`gC-a`   - Increment Highlight Numbers in sequence (each matched item will increment one more than previous match).  
`gC-x`   - Decrement Highlight Numbers in sequence (each matched item will increment one more than previous match).

<br />


---  
### Macros
`q<letter>` - start recording a macro  
`q` - stop recording a macro  
`@<letter>` - execute macro (once)  
`@@` - Rerun the last ran macro  
`<number>@<letter>` - To execute the macro <number> times  
`:3,9 normal @b` - Run macro "b" on lines 3-9.  
`reg <macro_letter>` - View register (holds macros as well - note '[^' represents the Esc key)  

<br /> 

__Best Practices when recording macros__
- Once recording has started, type `0` to begin at the beginning of the line.
- Once done with commands, type 'j' before you finish recording to ensure ending on the next line (in case this macro runs multiple times).

<br />

---
### Commenting/Uncommenting  
`gcc` - comment out current line [🔌 vim-commentary]  
`gc` - comment out a select range of lines [🔌 vim-commentary]  
`gcgc` - uncomment adjacent lines [🔌 vim-commentary]  

<br />

__Uncommenting__
- Put your cursor on the first comment character (like #), and enter Visual-Block mode (Ctrl+b for me)
- Go down until the last commented line and press `x`  

<br />

__Commenting__

_Option 1_
- Enter Visual-Block mode (Ctrl+b for me) then enter `:s/^/#/`  

_Option 2_
- Enter Visual-Block mode (Ctrl+b for me)
- Go down until last line and press `I`, then press `#` (or other comment character), then `Esc`.

<br />

Note: `C-` should be taken to mean `Ctrl+`. All other keys are to be entered in succession (not simultaneously).



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
