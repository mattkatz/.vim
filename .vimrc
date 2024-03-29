"ln -s ~/.vim/.vimrc ~/.vimrc
set nocompatible               " be iMproved
"filetype off                   " required!
let mapleader=","

" Install vim-plug if we don't arlready have it
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')

" My Plugs here:
"
" awesome git integration
" :G brings up git status window
" - stage or unstage file or hunk
" = toggle an inline diff of the file under the cursor
" cc create a commit
Plug 'tpope/vim-fugitive'

" Dasht is an offline docs viewer similar to dash and zeal
Plug 'sunaku/vim-dasht'

" press gcc to comment a line or gc to comment the highlighted text
Plug 'tpope/vim-commentary'
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
"vim-signature puts marks in the gutter and adds easy ways to move among them.
"  mx           Toggle mark 'x' and display it in the leftmost column
"  dmx          Remove mark 'x' where x is a-zA-Z
"
"  m,           Place the next available mark
"  m.           If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
"  m-           Delete all marks from the current line
"  m<Space>     Delete all marks from the current buffer
"  ]`           Jump to next mark
"  [`           Jump to prev mark
"  ]'           Jump to start of next line containing a mark
"  ['           Jump to start of prev line containing a mark
"  `]           Jump by alphabetical order to next mark
"  `[           Jump by alphabetical order to prev mark
"  ']           Jump by alphabetical order to start of next line having a mark
"  '[           Jump by alphabetical order to start of prev line having a mark
"  m/           Open location list and display marks from current buffer
"
"  m[0-9]       Toggle the corresponding marker !@#$%^&*()
"  m<S-[0-9]>   Remove all markers of the same type
"  ]-           Jump to next line having a marker of the same type
"  [-           Jump to prev line having a marker of the same type
"  ]=           Jump to next line having a marker of any type
"  [=           Jump to prev line having a marker of any type
"  m?           Open location list and display markers from current buffer
"  m<BS>        Remove all markers
"
Plug 'kshenoy/vim-signature'
"autohelpers
"Plug 'ervandew/supertab'
"Plug 'Shougo/neocomplcache'
"snippets
"Both these are out of fashion and I don't have time to figure it out
"Plug 'garbas/vim-snipmate'
"Plug 'honza/snipmate-snippets'

" interpret a file by function and cache file automatically
Plug 'MarcWeber/vim-addon-mw-utils'
" utility functions - supports other plugins
Plug 'tomtom/tlib_vim'


" languages
" Python
" ,d to create a docstring
Plug 'heavenshell/vim-pydocstring'
nmap <silent> <leader>d <Plug>(pydocstring)
" MANY MANY good defaults
Plug 'sheerun/vim-polyglot'
" css
Plug 'ChrisYip/Better-CSS-Syntax-for-Vim'
" Better satusline
Plug 'bling/vim-airline'
"colorize my parens so that I can tell what's in what
" kien's plugin isn't working...
" Plug 'kien/rainbow_parentheses.vim'
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
"Yankring
"Plug 'vim-scripts/YankRing.vim'
"Zen Coding AKA Emmet
Plug 'mattn/emmet-vim'

" ALE is an async lint engine. 
Plug 'dense-analysis/ale'

" COC (conquer of completion) is an LSP aware completion engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

" NVIM stuff!
if has('nvim')
  Plug 'https://github.com/heittpr/p5.vim'
endif

call plug#end()


"colors!
set background=dark
" Use themer if installed
try 
  colorschem ThemerVim
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme zenburn
endtry

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
let g:gundo_prefer_python3=1


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

nnoremap <leader>u :GundoToggle<CR>

"ctrlp for fzf
nnoremap <C-p> :FZF<CR>

"heavenshell/vim-pydocstring
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
" nmap <silent> <C-_> <Plug>(pydocstring)

" ---------------
"  ALE 
" ---------------
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \}
let g:ale_fixers = {
      \    'python': ['black'],
      \}
nmap <F10> :ALEFix<CR>
nmap <silent> <C-e> <Plug>(ale_next_wrap)
let g:ale_fix_on_save = 1


" -----------------
"  COC
" -----------------
" if hidden is not set, TextEdit might fail.
set hidden
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


"-----------------------
"|  Dasht              |
"-----------------------
" Search docsets for something you type:
" search related docsets
nnoremap <Leader>k :Dasht<Space>
" search ALL the docsets
nnoremap <Leader><Leader>k :Dasht!<Space>

" Search docsets for words under cursor:
" search related docsets
nnoremap <silent> <Leader>K :call Dasht(dasht#cursor_search_terms())<Return>
" search ALL the docsets
nnoremap <silent> <Leader><Leader>K :call Dasht(dasht#cursor_search_terms(), '!')<Return>
" Specify related docsets for searching
let g:dasht_filetype_docsets = {} " filetype => list of docset name regexp
" when in python, also search pytest
let g:dasht_filetype_docsets['python'] = [ 'pytest']
" When in HTML, also search CSS, JavaScript 
let g:dasht_filetype_docsets['html'] = ['css', 'js']

