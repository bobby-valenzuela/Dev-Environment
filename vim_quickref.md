# Vim: Quick Reference
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


