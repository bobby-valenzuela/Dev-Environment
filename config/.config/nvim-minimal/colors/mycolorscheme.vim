" File: ~/.config/nvim-minimal/colors/mycolorscheme.vim
" Clear existing highlights
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "mycolorscheme"

" Define color variables
let s:neon_magenta = "Magenta"      " Terminal color (or use 201 for 256-color terminals)
let s:neon_magenta_gui = "#ff00ff"  " Neon magenta for GUI

" Function to apply highlights
function! HighlightFor(group, fg, bg, style)
  execute 'highlight ' . a:group . ' ctermfg=' . a:fg . ' guifg=' . s:neon_magenta_gui . ' ctermbg=' . a:bg . ' guibg=' . a:bg . ' cterm=' . a:style . ' gui=' . a:style
endfunction

" Apply highlights for standalone Perl variables
call HighlightFor("perlVarPlain", s:neon_magenta, "NONE", "NONE")
call HighlightFor("perlVarSimpleMember", s:neon_magenta, "NONE", "NONE")
call HighlightFor("perlVarPlain2", s:neon_magenta, "NONE", "NONE")

" Ensure highlights apply to Perl files
augroup perl_colors
  autocmd!
  autocmd FileType perl call HighlightFor("perlVarPlain", s:neon_magenta, "NONE", "NONE")
  autocmd FileType perl call HighlightFor("perlVarSimpleMember", s:neon_magenta, "NONE", "NONE")
  autocmd FileType perl call HighlightFor("perlVarPlain2", s:neon_magenta, "NONE", "NONE")
augroup END`:w
