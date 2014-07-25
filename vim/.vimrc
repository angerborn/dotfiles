set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" ========================================
" BUNDLES

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Other plugins
Plugin 'Shougo/neocomplcache'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

" Themes
Plugin 'flazz/vim-colorschemes'

filetype plugin indent on

" ========================================
" SYNTAX HIGHLIGHTING
syntax on
set t_Co=256

" ========================================
" GUI/TERM SPECIFIC SETTINGS
if has("gui_running")
    set background=dark
    set guioptions-=m
    set guioptions-=T
    set lines=999
    set columns=600
endif

colorscheme molokai

" ========================================
" VARIOUS
set expandtab
set autoindent
set shiftwidth=2
set softtabstop=-1
set smarttab
set laststatus=2

" backspace through anything in insert mode
set backspace=indent,eol,start

" lines
set number
set relativenumber
set cursorline
set nowrap

" dont show -- INSERT -- etc
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

" play nice with system clipboard
set clipboard=unnamed

" show trailing whitespaces
set list
set listchars=tab:\ \             " a tab should display as ' '
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " Show > instead of linewrap

" show wildmenu
set wildmenu
set wildmode=longest:full,full

" show incomplete commands
set showcmd

" ========================================
" KEY MAPPINGS
map <space> <leader>
imap jj <esc>

" move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" ========================================
" NerdTree SETTINGS
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeHijackNetrw = 0

" ========================================
" NEOCOMPLCACHE SETTINGS
" Deactivate autocomplpop
let g:acp_enableAtStartUp = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_enable_fuzzy_completion = 1
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
"<TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" ========================================
" NEOSNIPPET
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" ========================================
" UNITE BINDINGS
call unite#filters#matcher_default#use(['matcher_fuzzy'])
"nnoremap <C-p> :Unite -start-insert file_rec/async<cr>

" ========================================
" CTRLP
let g:ctrlp_working_path_mode='ra'
nnoremap <C-b> :CtrlPBuffer <cr>

" ========================================
" Airline
let g:airline#extensions#tabline#enabled = 1

" ========================================
" Ag
let g:agprg="ag --column --smart-case"

" ========================================
" clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

" ========================================
" expand %% to current file path in command mode
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
