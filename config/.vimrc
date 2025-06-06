set nocompatible    " Set compatibility to Vim-Only (not vi)
set number
set relativenumber  " Set relative numbering with absolute line number for cursor line
set autoindent
set shiftwidth=4    " Set shift width to 4 spaces.
set tabstop=4       " Set tab width to 4 columns.
set expandtab       " Use space characters instead of tabs.
set smarttab
set showmode        " Show the mode you are on the last line.
set showmatch       " Show matching words during a search.
set hlsearch        " Use highlighting when doing a search.
set history=1000    " Set the commands to save in history default number is 20.
set incsearch
set laststatus=2    " Status Bar
set mouse=a
set wrap            " Text-Wrap
set ignorecase
set wildignorecase  " Ignore case when search using wildcards
set encoding=utf-8  
set splitright
set splitbelow
set clipboard=unnamedplus " Yank to system clipboard
" set softtabstop
syntax on           " Turn syntax highlighting on.

" Next 3 lines set proper colors
set termguicolors
set t_Co=256
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Use ':Diff' to see a diff between your current unsaved version and what's on the hard disk.
" command Diff execute 'w !git diff --no-index % -'

" Set grep program details
set grepprg=grep\ -nH\ -r\ -i\ --include='*.pl'\ --include='*.pm'\ --include='*.py'\ --include='*.js'\ --include='*.c'\ --include='*.cpp'\ --include='*.sh'\ --include='*.ps1'\ --include='*.css'\ --include='*.lua'\ --exclude='*.min.js'






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
" You can specify a custom plugin directory by passing it as1I the argument
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

" Airline
" Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Get themes:https://github.com/vim-airline/vim-airline-themes/tree/master/autoload/airline/themesI

" Configure file exlplorer
" set netrw_browse_split=3
" let g:netrw_winsize = 20
" let g:netrw_banner = 0

" File Nav Explorer
Plug 'scrooloose/nerdtree'

" Vim-sneak (like flash in nvim)
Plug 'justinmk/vim-sneak'

" Colorschemes
" Plug 'vimcolorschemes/vimcolorschemes'
Plug 'thedenisnikulin/vim-cyberpunk'
" Plug 'artanikin/vim-synthwave84'
" Plug 'ronwoch/hotline-vim'
Plug 'metalelf0/base16-black-metal-scheme'

" Git Gutter (signs)
Plug 'airblade/vim-gitgutter'
" Enable vim-gitgutter by default
let g:gitgutter_enabled = 1
" Update signs in real-time
let g:gitgutter_realtime = 1
" Set updatetime to 100ms for faster updates
set updatetime=100
let g:gitgutter_max_signs = 500  " default value (Vim < 8.1.0614, Neovim < 0.4.0)

" Vim-fugitive
Plug 'tpope/vim-fugitive'

" indentline
Plug 'Yggdroot/indentLine'
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_char = '|'


" vim-visual-multi (equiv. to Ctrl+d in vscode)
" Allows one to use Ctrl+n to highlight next identical occurences (once text is highlighted)
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" [+] Bufferline
Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
" Plug 'ryanoasis/vim-devicons' Icons without colours
" Plug 'akinsho/bufferline.nvim', { 'tag': '*' }pEºJ
Plug 'bling/vim-bufferline'

" Vim-lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" List of servers: https://github.com/mattn/vim-lsp-settings
" :LspInstallServer server-name
" :LspUninstallServer server-name



call plug#end()
" END PLUGINS

" =================================================================================="
" =================================================================================="





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
" colorscheme catppuccin_mocha
"colorscheme synthwave84
" colorscheme ir_dark


" # Colorscheme - cyberpunk #
set cursorline
set background=dark
colorscheme cyberpunk
colorscheme gothic-cyberpunk
let g:cyberpunk_cursorline="black"
let g:airline_theme='monochrome'
let g:airline_theme='lucian'





" colorscheme desert
"let g:airline_theme='luna'
" let g:airline_theme = 'catppuccin_mocha'



" ============ Key-bindings ================
"
" Set leader key
let mapleader = " "

" Neotree
nnoremap <Leader><Space> :NERDTreeToggle<CR>

" Integrated Terminal 
noremap <silent> <C-_> :terminal <CR>

" Clear search highlights with Esc
" noremap <silent> <Esc> :nohlsearch<CR><Esc>
nnoremap <silent> <Leader>h :nohlsearch<CR>

" Enter visual-block mode with Ctrl+b
noremap <silent> <C-b> <C-v>

" Remove all markers with <Leader>rm
" noremap <silent> <Leader>rm :delm a-zA-Z0-9<CR>

" Move down/up 20 lines with <Leader>j/k
noremap <silent> <leader>j 20<C-e>
noremap <silent> <Leader>k 20<C-y>

" Quickfix navigation with F12/F11
noremap <silent> <F12> :cn<CR>
noremap <silent> <F11> :cp<CR>

" Indent/unindent in visual mode and keep selection
vnoremap <silent> > >gv
vnoremap <silent> < <gv

" Git commands (requires vim-fugitive)
noremap <silent> <Leader>gu :!git reset --hard HEAD~1<CR>
noremap <silent> <Leader>ga :!git stash save<CR>
noremap <silent> <Leader>gg :Git<CR>

" Git signs toggle (requires vim-gitgutter plugin)
noremap <silent> <Leader>gt :GitGutterToggle<CR>
" noremap <silent> <Leader>gd :GitGutterDiffOrig<CR>
noremap <silent> <Leader>gs :Git<CR>

" Git-fugitive commands (requires vim-fugitive and vim-rhubarb for GBrowse)
" "noremap <silent> <Leader>gc :Git commit<CR>
noremap <silent> <Leader>gd :Gdiffsplit<CR>
noremap <silent> <Leader>gb :Git blame<CR>
noremap <silent> <Leader>go :GBrowse<CR>
noremap <silent> <Leader>gl :Gclog<CR>


" _______________________ Indent __________________________
noremap <silent> <Leader>ie :IndentLinesEnable<CR>
noremap <silent> <Leader>id :IndentLinesDisable<CR>
noremap <silent> <Leader>ii :IndentLinesToggle<CR>
" Disable by default
let g:indentLine_enabled = 0



" vim-gitgutter icons
let g:gitgutter_sign_added = "▎"
let g:gitgutter_sign_modified = "▎"
let g:gitgutter_sign_removed = "▎"
let g:gitgutter_sign_removed_first_line = "▎"
let g:gitgutter_sign_removed_above_and_below = "▎"
let g:gitgutter_sign_modified_removed = "▎"




" Force close window
noremap <silent> <C-w>q :q!<CR>

" Call :args - but assume recusrive (rargs)
nnoremap <silent> <leader>ra :call SetArgsWithPattern()<CR>
function! SetArgsWithPattern()
  let pattern = input('File pattern: ')
  if pattern != ''
    " Prepend **/ and escape the pattern properly
    let escaped_pattern = escape(pattern, ' ')
    execute 'args **/' . escaped_pattern
  endif
endfunction

" Add :args findings to quickfix list
nnoremap <silent> <C-q> :cexpr []<CR>:argdo caddexpr expand('%:p') . ':1:1'<CR>:copen<CR>
