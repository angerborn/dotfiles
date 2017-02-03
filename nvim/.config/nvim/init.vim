filetype off

" {{{ Plugins

if has('nvim')
    call plug#begin('~/.local/shared/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
end

" Plugs
Plug 'Raimondi/delimitMate'
Plug 'ZoomWin'
Plug 'bling/vim-airline'
Plug 'gregsexton/gitv'
Plug 'majutsushi/tagbar'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'christoomey/vim-tmux-navigator'

Plug 'Neomake/Neomake'

Plug 'sheerun/vim-polyglot'

" Fzf fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Deoplete autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi' " Python completion for deoplete

" Themes
Plug 'sjl/badwolf'
Plug 'angerborn/vim-colorschemes'

call plug#end()

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
    colorscheme gruvbox
else
    set background=dark
    colorscheme gruvbox
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

map <Space> <leader>
imap jj <esc>

" move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" remove search-hl on enter
nnoremap <CR> :let @/ = ""<CR><CR>

" expand %% to current file path in command mode
cnoremap %% <C-R>=fnameescape(expand('%:p')).'/'<CR>

" some leader mappings
nnoremap <Leader>ve :vsplit $MYVIMRC<CR>
nnoremap <Leader>vs :source $MYVIMRC<CR>
nnoremap <Leader>ze :vsplit ~/.zshrc<CR>
nnoremap <Leader>gs :Gstatus<CR>


" NerdTree

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeHijackNetrw = 0

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

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

" Deoplete
let g:deoplete#enable_at_startup = 1 " Enable at startup
let g:deoplete#enable_smart_case = 1 " Use smart case

" Fzf
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" Custom normal mode mappings
nmap <leader>ff :Files<cr>
nmap <leader>fc :Colors<cr>
nmap <leader>fb :Buffers<cr>
nmap <leader>fh :History<cr>


" Deoplete tab completion
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" Please don't overwrite my bindings gitv
let g:Gitv_DoNotMapCtrlKey = 1

" Workaround for nvim bug
" https://github.com/neovim/neovim/issues/5999
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0

" vim: sw=4 ts=4
