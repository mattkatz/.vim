"ln -s ~/.vim/.vimrc ~/.vimrc
set nocompatible               " be iMproved
"filetype off                   " required!

" Install vim-plug if we don't arlready have it
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')

" My Plugs here:
"
" original repos on github
Plug 'tpope/vim-fugitive'
"<leader><leader>e or w or b etc.
Plug 'Lokaltog/vim-easymotion'
" Plug 'kien/ctrlp.vim'
" Replacing ctrlp with fzf
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install
" script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"   " Both options are optional. You don't have to install fzf in ~/.fzf
"     " and you don't have to run the install script if you use fzf only in
"     Vim.
Plug 'tpope/vim-surround'
"<leader>u
Plug 'sjl/gundo.vim'
"UI

"Amazing colorpicker
"<leader>ce on a color to edit that color
"<leader>cii to insert a color
Plug 'Rykka/colorv.vim'
Plug 'nanotech/jellybeans.vim'
"<leader> ig to turn indent guides on and off
Plug 'nathanaelkane/vim-indent-guides'
"better start screen - manage sessions
":Startify to trigger
Plug 'mhinz/vim-startify'
"Golden ratio resizes splits so your focused window gets the most screen
Plug 'roman/golden-ratio'
"autohelpers
" Plug 'scrooloose/syntastic'
"Plug 'ervandew/supertab'
"Plug 'Shougo/neocomplcache'
"snippets
"Both these are out of fashion and I don't have time to figure it out
"Plug 'garbas/vim-snipmate'
"Plug 'honza/snipmate-snippets'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
"languages
" Python
Plug 'heavenshell/vim-pydocstring'
" MANY MANY good defaults
Plug 'sheerun/vim-polyglot'
" css
Plug 'ChrisYip/Better-CSS-Syntax-for-Vim'
" Better satusline
Plug 'bling/vim-airline'
"colorize my parens so that I can tell what's in what
Plug 'kien/rainbow_parentheses.vim'
" add cmdline, yankring and menu extensions to ctrlp
" Plug 'sgur/ctrlp-extensions.vim'
"Yankring
"Plug 'vim-scripts/YankRing.vim'
"Zen Coding AKA Emmet
Plug 'mattn/emmet-vim'

"ColorSchemes
"Base-16
Plug 'chriskempson/base16-vim'
"Tomorrow
Plug 'Slava/vim-colors-tomorrow'


"Dash is the best way to look up docs on osx
" use :Dash <searchterm> to search in this filetype or :Dash inject underscore
" or :Dash! <searchterm> to search all docs
Plug 'rizzatti/funcoo.vim'
Plug 'rizzatti/dash.vim'

call plug#end()


"colors!
set background=dark
colorscheme zenburn
" ---------------
" UI
" ---------------
set ruler " Ruler on
set nu " Line numbers on
set wrap " Line wrapping off
set laststatus=2 " Always show the statusline

" ---------------
" Text Format
" ---------------
set tabstop=2
set backspace=2 " Delete everything with backspace
set shiftwidth=2 " Tabs under smart indent
set cindent
set autoindent
set smarttab
set expandtab
  


" ---------------
" Behaviors
" ---------------
syntax enable
set autoread " Automatically reload changes if detected

" ---------------
" Searching
" ---------------
set ignorecase " Case insensitive search
set smartcase " Non-case sensitive search
set incsearch
set hlsearch
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,
  \.sass-cache,*.class,*.scssc,*.cssc,sprockets%*,*.lessc

" ---------------
" Visual
" ---------------
set showmatch " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink
" Show invisible characters
set list

" ---------------
" Mouse
" ---------------
set mousehide " Hide mouse after chars typed
set mouse=a " Mouse in all modes

" Better complete options to speed it up
set complete=.,w,b,u,U

" ---------------
"  GUNDO
" ---------------
nnoremap <F5> :GundoToggle<CR>


"if has('gui_running')
  "Display Hidden Characters
  "http://en.wikipedia.org/wiki/Unicode_Geometric_Shapes
  "http://www.joelonsoftware.com/articles/Unicode.html
  set list
  set listchars=tab:▶\ ,eol:★
  set listchars+=trail:◥
  set listchars+=extends:❯
  set listchars+=precedes:❮
  "vertical splits less gap between bars
  set fillchars+=vert:│
"endif

let mapleader=","
" ------------------
" Numbering
" ------------------
function ChangeNumbering()
  if &relativenumber
    set norelativenumber
    set number
  else
    if &number
      set nonumber
    else
      set relativenumber
    endif
  endif
endfunction
"numbering
nnoremap <leader>n :call ChangeNumbering()<CR>


"I like help to open in a vertical split rather than a horizontal one
command -nargs=* -complete=help Help vertical belowright help <args>

"window management
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Rainbow parentheses toggle
nnoremap <leader>r :call RainbowParenthesesToggle 

nnoremap <leader>u :GundoToggle<CR>

"ctrlp for fzf
nnoremap <C-p> :FZF<CR>

"heavenshell/vim-pydocstring
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
nmap <silent> <C-_> <Plug>(pydocstring)
