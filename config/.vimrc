set nocompatible    " Set compatibility to Vim-Only (not vi)
set smarttab
set mouse=a
set number
set autoindent
set shiftwidth=4    " Set shift width to 4 spaces.
set tabstop=4       " Set tab width to 4 columns.
set relativenumber  " Set relative numbering with absolute line number for cursor line
set expandtab       " Use space characters instead of tabs.
set showmode        " Show the mode you are on the last line.
set showmatch       " Show matching words during a search.
set hlsearch        " Use highlighting when doing a search.
set history=1000    " Set the commands to save in history default number is 20.
syntax on           " Turn syntax highlighting on.
set laststatus=2    " Status Bar
set wrap            " Text-Wrap
" colorscheme desert

" encoding
set encoding=utf-8  
" set softtabstop

set splitright
set splitbelow

" Configure file exlplorer
" set netrw_browse_split=3
" let g:netrw_winsize = 20
" let g:netrw_banner = 0



"
"
"
"

" copy (write) highlighted text to .vimbuffer

" paste from buffer



" Use ':Diff' to see a diff between your current unsaved version and what's on the hard disk.
command Diff execute 'w !git diff --no-index % -'




" ============ vim-plug plugins =================

" Auto-Install Vim-Plug and run :PlugInstall (if not installed)
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"


" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.

" ============================================================================="
" ============================================================================="

" BEGIN PLUGINS
call plug#begin()


" Catppuccin syntax highlighting [https://github.com/catppuccin/vim/tree/main]
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

" Next 3 lines set proper colors
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Get themes:https://github.com/vim-airline/vim-airline-themes/tree/master/autoload/airline/themesI
" let g:airline_theme = 'catppuccin_mocha'
let g:airline_theme='luna'

Plug 'scrooloose/nerdtree'
nnoremap <C-t> :NERDTreeToggle<CR>


Plug 'vimcolorschemes/vimcolorschemes'

" vim-visual-multi (equiv. to Ctrl+d in vscode)
" Allows one to use Ctrl+n to highlight next identical occurences (once text is highlighted)
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" [+] Bufferline
Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
" Plug 'ryanoasis/vim-devicons' Icons without colours
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }



call plug#end()
" END PLUGINS

" =================================================================================="
" ============================================================================="


" copy (write) highlighted text to .vimbuffer
"
" -vmap <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \|
" clip.exe <CR><CR>
"
" paste from buffer

" =============== COLOR SCHEMES ============== "
" Defining custome color schemes needs to be here - after all plugins have loaded


" # Colorscheme - monakai # 
" [requires above: Plug 'vimcolorschemes/vimcolorschemes']
" Uncomment following 2 lines for this colorscheme
" set background=dark
" colorscheme monokai



" # Colorscheme - catppuccin #
" Uncomment following 1 line for this colorscheme
colorscheme catppuccin_mocha




