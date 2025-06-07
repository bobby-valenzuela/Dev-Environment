" File: ~/.config/nvim-minimal/after/syntax/perl.vim
" Clear prior custom definition to avoid conflicts
syntax clear perlInterpolatedVar

" Define syntax for variables inside strings with higher priority
syntax match perlInterpolatedVar "\$\h\w*" contained containedin=perlString

" Directly set highlight for interpolated variables
highlight perlInterpolatedVar ctermfg=Magenta guifg=#ff00ff ctermbg=NONE guibg=NONE cterm=NONE gui=NONE

" Alternative: Link to perlVarPlain to match standalone variables
" highlight link perlInterpolatedVar perlVarPlain

" Ensure this applies to Perl files
augroup perl_syntax
  autocmd!
  autocmd FileType perl syntax clear perlInterpolatedVar
  autocmd FileType perl syntax match perlInterpolatedVar "\$\h\w*" contained containedin=perlString
  autocmd FileType perl highlight perlInterpolatedVar ctermfg=Magenta guifg=#ff00ff ctermbg=NONE guibg=NONE cterm=NONE gui=NONE
  " autocmd FileType perl highlight link perlInterpolatedVar perlVarPlain
augroup END
