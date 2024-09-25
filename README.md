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

<br />

---
### Sessions
Open tmux as a named session: `tmux new -s <name>`  
To detach a tmux session: `Ctrl+B+D`  
View tmux sessions (from cli): `tmux ls`  
Re-attach to session (from cli): `tmux attach -t 0`  
Rename tmux sessions (from cli): `tmux rename-sesssion -t 0 <name>`  
Killing tmux sessions (from cli): `tmux kill-sesssion -t 0 <name>` 
__Where ‘0’ is your session id/name__

<br />

---
### Windows
Rename Window: `Ctrl+B+,`  
Create new Window: `Ctrl+B+C`  
Show all Windows: `Ctrl+B+S`  
Show all Windows (with preview): `Ctrl+B+w` _Enter to select_  
Switch between windows: `Ctrl+B+<number>`  
Close Window: `exit`

<br />

---
### Panes
Split Windows Vertically: `Ctrl+B+%`  (with my conf I use `|` instead of `%`)  
Split Windows Horizontally: `Ctrl+B+"`  (w/66ith my conf I use `_` instead of `"`)  
Navigate subwindows (panes): c  
Show pane numbers: `Ctrl+B+Q`  
Move current pane left: `Ctrl+B+{`  
Move current pane right: `Ctrl+B+}`  
Zoom in/out to make pane full screen: `Ctrl+B+Z`
Close pane: `exit` or `Ctrl+B+Z`

<br />

<br />

## Vim
There are loads of good vim cheat sheets out there and this isn't a substitution, but rather a list of common/handy ones I've found to be efficient on my workflow.  
[Ultimate Cheat Sheet](https://catswhocode.com/vim-cheat-sheet)  
[LeanXinY](https://learnxinyminutes.com/docs/vim/)  

---
### CommonGeneral                                                                                                                                                                                                                                    
`:wa ` - ("write all") save all open buffers    
`:e!` - erase all unsaved changes  
`:bufdo e!` - erase all unsaved changes (in all open buffers)  
`:w !diff %` - view changes in vim before saving  
`:verbose map Q` - see what is mapped to the `Q` key  

<br />

---
### Lazyvim  (neovim)  
`<leader> <leader>` - file search  [🔌 fzf]  
`<leader> fF` - file search (from cwd)  [🔌fzf]  
`<leader> f t` - Open terminal (root) [🔌]   
`Ctrl  /` - Show/Hide terminal [🔌]    
`<leader>  sG` - grep (from cwd) [🔌]  
`<space> /` - grep (working dir) [🔌]    
`Crtl-q` - Save search results in a quickfix list (we can even grep the quick fix list with `/`) [🔌]   
`<leader> e` - opens working dir file treee (what buffer is open)  [🔌]  
`<leader> E` - opens Root Dir (better - grep and stuff)  [🔌]  
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
### Windows (lazy)
`<leader> w w` - switch windows [Lazyvim]  
`<leader> w q` - close window [Lazyvim]  
`<leader> w v` - verical split window [Lazyvim]  
`<leader> w o` - close all other windows [Lazyvim]  
`<space> w |` - max width of current window [Lazyvim]  
`<leader> w =` - equal width of current windows [Lazyvim]  
(in NeoTree) `s` - to open in new window in vertical split [Lazyvim]  

### Windows
`:vert sb {filename}` - Split buffer with another open buffer (you can enter file name or use tab to cycle through open buffers)  
`:e` filename	- Edit filename in current window  
`:split` filename	- Split the window and open filename  
`:vsplit file` - Split window vertically
`ctrl-w <up arrow>` - Put cursor in top window (workf for any direction)
`ctrl-w ctrl-w` - Put cursor in next window  
`ctrl-w_` - Maximize current window vertically  
`ctrl-w|` - Maximize current window horizontlly  
`ctrl-w=` - Gives the sme size to all windows  
`10 ctrl-w+` - Add 10 lines to current window  
`:hide` - Close current window  
`:o­nly` - 	Close all windows, except current 


<br />

---  
### Buffers
`:E` - Open file nav (short for `explore`)  
`:e ~/.vimrc` - edit a file by name (short for `:edit`).  
 
 <br /> 
 
_Viewing Buffers_  
`<leader> f b` - View open buffers [🔌]   
`:ls` or `buffers`   - view buffers  [🔌]   
`:b` then `<C-d>` - show all open buffers to cycle though.

 <br /> 
 
_Switching Buffers_  
`:bn` - rotate to next buffer.  
`:bp` - rotate back to previous buffer.  
`:b3`     - Select buffer #3.  
`:b file1.txt`     - Select by filename.  
`L` - Cycle through all open buffers [🔌]  
`<leader>`` ` or `C-^` (which is `Ctrl+Shift+6`) - swap back and forth between current (`#`) and alternate (`a%`) buffers. [🔌]   
`:bf` or `:bl` - go to first/last buffer (f/l)  
`:badd myfile.txt` - add a new buffer by filename  

 <br /> 
 
_Deleting Buffers_  
`:bd myfile.txt` - delete a buffer by buffer number or filename  
`:%bd` - Delete all open buffers  

 <br /> 
 
#### Harpoon
`:wall` - Write to all open buffers  
`<leader> H` - Add file to harpoon list [🔌]   
`<leader>  h` - View harpoon quick menu [🔌]   
`<leader>  {1..5}` - Harpoon to (open) specific file [🔌]  
  
#### Lazyvim
``<leader> ` `` =  switch last file (buffer)  
`<leader> f b` - view open buffers
`<leader> b e` - View buffer explorer  

<br />

---
### Moving
`: {num}` - Go to line  
`I/A` - Go to begin/end of line  
`m {a-z}`	Setting markers/waypoints as {a-z}  
`‘ {a-z}`	Move to marker/position {a-z}  
`'` - view all previous markers (and previously visited locations)
`:delm!`  - vim clear all marks (or specific ranges like `:delm a-zA-Z0-9`)  
`''`	- Move to previous marker position  (thats two single quotes in succession, not a single double quote)  
`[[` - Go to top of file (via ...) [Zazyvim]  
`]]` - Go to bottom of file (via ...) [Zazyvim]  
`s {first_char}{second_char}` - search forward to matches and show labels + enter the label of the match you want to go to [🔌leap]  
`S {first_char}{second_char}` - search backward to matches and show labels + enter the label of the match you want to go to [🔌leap]  
`gs {first_char}{second_char}` - search _forward_ to matches and show labels + enter the label of the match you want to go to [🔌leap]. _Global search (across windows splits)_  
`gS {first_char}{second_char}` - search  _backward_ to matches and show labels enter the label of the match you want to go to [🔌leap]. _Global search (across windows splits)_  


<br />

---
#### Folding
`zc` - fold a block of code (z = fold and c = close)  
`zo` - unfold a block of code (z = fold and c = open)  

<br />

#### Brackets && Braces
`%` - Select top/bottom of current block  
`[i` - Go to the top of code block (via mini-indentscope) [🔌 Identscope]  
`]i`- Go to the bottom of code block (via mini-indentscope) [🔌 Identscope]  
`v%` - Select Content within parens/brackets (inclusively) if you're right before a bracket.  
`vi{` - Selects everything within the block... then Esc to leave you at ending "}"  
`ci{` - Change text inside brackets (exclusively)  
`ca{` - Change text inside brackets (inclusively)  
`yi{` - Yank text inside brackets (inclusively)  
`ya{` - Yank text inside brackets (exclusively)  
`di{` - Delete text inside brackets (inclusively)  
`da{` - Delete text inside brackets (exclusively)  

<br />

---  
### Selecting
`/` - Search (grep): type text and enter then `n/N` to iterate through matches  
`o`    - Reverse order while continuing to select  
`/<term>` - While in visual mode, select lines based on RegEx  
`C-v` - enter visual block mode. Once text is selected enter insert mode (`a/A`,`i/I`,`c/C`,`p/P`,`o/O` etc) and make changes. They will appear on the first line, but once you hit Esc those changes will be made to all selected lines.  
`gs{char}` - Global surround. Example: Select text then `gs"`  
`viw` - selects just the word.  
`vaw` - selects the word plus any surrounding whitespace.  

<br />

__Finding Multiple Occurrences__  
1. Select text (in visual mode)
2. `*` to highlight all occurences (begins at next occurence)
3. `#` to highlight all occurences (begins at previus occurence)
4. `n/N` to select next/previous occurences
5. `v` again to select the highlighted occurence

<br />

#### Continguous Lines of text (paragraph)
`yap` - Yank with newlines  
`yip` - Yank without newlines  
`cap` - Change with newlines  
`cip` - Change without newlines  
`dap` - Delete with newlines  
`dip` - Delete without newlines  

<br />

---
### RegEx && Searching
`\r`                - This represents newline  
`%s/(foo)/\1\r`     - Replaces matches with itself followed by a newline   
`s///g` - When text is selected you can use a replace (without the %) to replace text within the selected range  
`s/\VTEXTOMATCH/REPLACEWITHTHIS/` - The `\V` (very no magic mode treats all characters literaly except the `\`  
`s/\v\w+/` - The `\v` (very magic mode treats most special cahrs as special - as in regular regex    


<br />

---  
### Copy/Pasting/Cutting/Deleting
`D/d$` - 	Cut to end of line  
`y$` -	Yank/Copy to end of line  
`:reg`/`=`    - View registers (vim/lazyvim)  
`0p`     - Paste from 0 register (in normal mode)  
`C-r0`  - Paste from 0 register (in insert mode or into vim command line). Useful for pasting into a search regex  
`C-rw`  - Copy whatever word is under cursor and paste into vim command line. (Useful for pasting into a search regex)  
`"_dd`  - Delete line and yank to black hole register (keeps registers the same).  
`ayy` - Yank line to "a" register (overwriting register a).  
`Ayy` - Yank line to "a" register (appending to register a)  
`d` or `dd` - Cuts (Deletes and yanks)  
`<leader> p` - View Yank history [🔌 Yanky]  
`:1,500y` - Copy everything from line 1 to 500 (use `d` for delete) (can start/end on any line - usefull for slicing bits)     

<br />

_Note: '^J' in a register will be changed to a newline when pasting._

<br />

---  
### Editing
`u` - undo last change (normal mode)  
`C-u` - undo last change (insert mode)  
`ciw` - Change inner word (replace)
`xp`    - swap two adjacent letters (move letter cursor one place to the right)  
`J`     - Merge lines: Apend line below to the end of the current line.  
`cc` - change entire line.  
`~` - Change casing of selected text/character under cursor.  
`g~w` - change case of word (until whitespace)  
`g~~` - change case of entire line  
`dt/<searchterm>` - Delete text up until search term  
`<<`/`>>` - Indent code left/right  
`==`/`=` - Auto indent code (`==` for one line and `=` for multiple lines)  
`:sort`/`:sort!` - When lines are selected, this will sort in ASC/DESC order respectively.  
`read !<shell_command>` - Paste shell output into buffer.  
`u` Selected text to lower case  
`U` Selected text to upper case  
`:MarkdownPreview` - View MarkdownPreview in browser [🔌 Markdown-Preview]  

_Sorting_  
`:sort`  Sort all lines  
`:sort!` Sort all lines in reverse  
`:sort u` Sort all lines and remove duplicates  

_Surrounding_  
`faiw"` - Surround inner word with " (press fa fast) [🔌 mini-surround]   
`fd"` - Remove surrounding quotes (press fd fast) [🔌 mini-surround]  
`fr"'` = replace surrounding double quotes with single-quotes (press fr fast) [🔌 mini-surround]  

<br />



---
### Numbers
`C-a`    - Increment Highlighted Numbers  
`C-x`    - Decrement Highlighted Numbers  
`gC-a`   - Increment Highlight Numbers in sequence (each matched item will increment one more than previous match).  
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
`q<letter>` - start recording a macro  
`q` - stop recording a macro  
`@<letter>` - execute macro (once)  
`<number>@<letter>` - To execute the macro <number> times  
`:3,9 normal @b` - Run macro "b" on lines 3-9.  
`reg <macro_letter>` - View register (holds macros as well - note '[^' represents the Esc key)  

__Best Practices when recording macros__
- Once recording has started, type `0` to begin at the beginning of the line.
- Once done with commands, type 'j' before you finish recording to ensure ending on the next line (in case this macro runs multiple times).

<br />

---
### Commenting/Uncommenting  
`gcc` - to comment out current line [🔌 vim-commentary]  
`gc` - to comment out multiple selected lines [🔌 vim-commentary]  

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




