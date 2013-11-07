"ln -s ~/.vim/.vimrc ~/.vimrc
set nocompatible               " be iMproved
filetype off                   " required!
" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-surround'
"<leader>u
Bundle 'sjl/gundo.vim'
"UI

"Amazing colorpicker
"<leader>ce on a color to edit that color
"<leader>cii to insert a color
Bundle 'Rykka/colorv.vim'
Bundle 'nanotech/jellybeans.vim'
"<leader> ig to turn indent guides on and off
Bundle 'nathanaelkane/vim-indent-guides'
"better start screen - manage sessions
":Startify to trigger
Bundle 'mhinz/vim-startify'
"Golden ratio resizes splits so your focused window gets the most screen
Bundle 'roman/golden-ratio'
"autohelpers
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'Shougo/neocomplcache'
"snippets
"Both these are out of fashion and I don't have time to figure it out
"Bundle 'garbas/vim-snipmate'
"Bundle 'honza/snipmate-snippets'

Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
"languages
"javascript
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'leshill/vim-json'
Bundle 'itspriddle/vim-jquery'
Bundle 'nono/vim-handlebars'
" css
Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
" working with CSV files - brilliant
Bundle 'chrisbra/csv.vim'
" Better satusline
Bundle 'bling/vim-airline'
"colorize my parens so that I can tell what's in what
Bundle 'kien/rainbow_parentheses.vim'
" add cmdline, yankring and menu extensions to ctrlp
Bundle 'sgur/ctrlp-extensions.vim'
"Yankring
Bundle 'vim-scripts/YankRing.vim'
"Zen Coding AKA Emmet
Bundle "mattn/emmet-vim"

"...All your other bundles...
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif


" Automatically detect file types. (must turn on after Vundle)
filetype plugin indent on

"colors!
set background=dark
colorscheme solarized
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
