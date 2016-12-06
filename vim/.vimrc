filetype off

set rtp+=~/.vim/bundle/Vundle.vim/

" {{{ Plugins

call vundle#rc()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ZoomWin'
Plugin 'bling/vim-airline'
Plugin 'davidhalter/jedi-vim'
Plugin 'gregsexton/gitv'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'fatih/vim-go'

" Themes
Plugin 'sjl/badwolf'
Plugin 'angerborn/base16-vim'

filetype plugin indent on

" Gui (mvim/gvim) specific settings

if has("gui_running")
    set guioptions-=m
    set guioptions-=r
    set guioptions-=L
    set guioptions-=T
    set lines=999
    set columns=600
    set guifont=Menlo:h11
endif

" Colors

syntax on
set t_Co=256

if has("gui_running")
    set background=dark
    colorscheme base16-darktooth
else
    set background=dark
    colorscheme badwolf
endif

" Autocommands

autocmd FileType go setlocal noet sw=8
autocmd FileType coffee setlocal sw=2
autocmd FileType grd setlocal sw=2

" Various
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
set nowrap
set cursorline

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

" Keymaps

map , <leader>
imap jj <esc>
nnoremap <Leader>, :b #<CR>

" move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" remove search-hl on enter
nnoremap <CR> :let @/ = ""<CR><CR>

" expand %% to current file path in command mode
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>

" some leader mappings
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>ez :vsplit ~/.zshrc<CR>
nnoremap <Leader>gs :Gstatus<CR>


" NerdTree

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeHijackNetrw = 0

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" CtrlP
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 0
nnoremap <Leader>b :CtrlPBuffer <CR>
nnoremap <Leader>r :CtrlPMRUFiles <CR>
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$'
	\ }

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

" Ag
let g:ag_prg="ag --column --smart-case"

" delimitmate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 1

" Tagbar
nnoremap <Leader>t :TagbarToggle<CR>
let g:tagbar_left = 1

"Gitv stuff
nnoremap <leader>gv :Gitv<cr>
nnoremap <leader>gV :Gitv!<cr>

" Please don't overwrite my bindings gitv
let g:Gitv_DoNotMapCtrlKey = 1

" vim-go stuff
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

" Close YouCompleteMe preview window after insertion
let g:ycm_autoclose_preview_window_after_insertion = 1

" vim: sw=4 ts=4
