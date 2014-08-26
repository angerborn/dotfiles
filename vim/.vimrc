filetype off

set rtp+=~/.vim/bundle/Vundle.vim/

" {{{ Plugins

call vundle#rc()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/neocomplcache'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'davidhalter/jedi-vim'
Plugin 'fatih/vim-go'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

" Themes
Plugin 'morhetz/gruvbox'
Plugin 'sjl/badwolf'
Plugin 'chriskempson/vim-tomorrow-theme'

filetype plugin indent on

" }}}

" {{{ Gui/term specific settings

if has("gui_running")
    set guioptions-=m
    set guioptions-=r
    set guioptions-=L
    set guioptions-=T
    set lines=999
    set columns=600
endif


" }}}

" {{{ Colors

syntax on
set t_Co=256

if has("gui_running")
    set background=dark
    colorscheme badwolf
else
    colorscheme badwolf
endif

" }}}

" {{{ Autocommands

autocmd FileType go setlocal noet, sw=8

" }}}

" {{{ Various
set shell=bash

set expandtab
set autoindent
set shiftwidth=4
set softtabstop=-1
set smarttab
set laststatus=2

" backspace through anything in insert mode
set backspace=indent,eol,start

" play nice with clipboard
set clipboard=unnamed

" lines
set number
set relativenumber
set cursorline
set nowrap

" dont show -- insert -- etc
set noshowmode

" search
set hlsearch
set incsearch
set ignorecase smartcase
set mousemodel=extend

" dont make backups and swaps
set nobackup
set noswapfile
set nowritebackup

" always show a few extra lines
set scrolloff=10

" briefly show matching bracket when new is inserted
set showmatch

" dont close buffers when in background
set hidden

" auto update file on change
set autoread

" show trailing whitespaces
set list
set listchars=tab:\ \             " a tab should display as ' '
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " show > instead of linewrap

" show wildmenu
set wildmenu
set wildmode=longest:full,full
set wildignore+=*.pyc,*.out,*.o

" show incomplete commands
set showcmd

" }}}

" {{{ Keymaps

map , <leader>
imap jj <esc>
imap jk <esc>
imap kj <esc>

" move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" remove search-hl on enter
" nnoremap <CR> :nohlsearch<CR>:<BS>

" expand %% to current file path in command mode
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>

nnoremap <Leader>vs :vsplit 
nnoremap <Leader>hs :split 
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>ez :vsplit ~/.zshrc<CR>

" }}}

" {{{ NerdTree

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeHijackNetrw = 0

" }}}

" {{{ Neocomplcache

" Deactivate autocomplpop
let g:acp_enableAtStartUp = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_auto_select = 0

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" Use jedi for python files
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

"<TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" }}}

" {{{ Neosnippet

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" }}}

" {{{ Unite

call unite#filters#matcher_default#use(['matcher_fuzzy'])
"nnoremap <C-p> :Unite -start-insert file_rec/async<CR>

" }}}

" {{{ CtrlP
let g:ctrlp_working_path_mode='ra'
nnoremap <C-b> :CtrlPBuffer <CR>
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$'
	\ }

" }}}

" {{{ Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
" }}}

" {{{ Ag
let g:agprg="ag --column --smart-case"
" }}}

" {{{ Golang
let g:go_fmt_autosave = 0
" }}}

" {{{ delimitmate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
" }}}

" vim: sw=4 ts=4
