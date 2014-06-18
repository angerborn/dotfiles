set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()


" ========================================
" BUNDLES

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'ddollar/nerdcommenter'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'vim-scripts/ZoomWin'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/syntastic'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-rails'
Plugin 'mattn/emmet-vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'dag/vim2hs'
Plugin 'airblade/vim-gitgutter'
" Note! YouCompleteMe requires newer version of vim
" Easiest way is to just install 7.4 from source..
" instructions: http://michaelheap.com/installing-vim-7-4-on-ubuntu/
" Plugin 'Valloric/YouCompleteMe'

" ========================================
" SYNTAX HIGHLIGHTING
syntax on

" ========================================
" GUI/TERM SPECIFIC SETTINGS
if has("gui_running")
    colors solarized
    set background=light
    set guifont=Ubuntu\ mono\ 11

    set guioptions-=m
    set guioptions-=T

    set lines=999
    set columns=160
else
    color Tomorrow-Night
endif

" ========================================
" TABS AND WHITESPACES
filetype plugin indent on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set laststatus=4

" ========================================
" LINE NUMBERING AND HIGHLIGHTING
set cursorline
set number          " show numbers
set relativenumber  " relative line numbering

" ========================================
" DO NOT WRAP LINES
set nowrap

" ========================================
" SEARCH SETTINGS
set hlsearch
set incsearch
set ignorecase smartcase


" ========================================
" KEY MAPPINGS
let mapleader=","
map <leader>b :CtrlPBuffer<cr>
map <C-b> :CtrlPBuffer<cr>
imap jj <esc>
imap <c-c> <esc>

" move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" ========================================
" MISC SETTINGS

" show more context when scrolling
set scrolloff=8

" briefly show matching bracket when new is inserted
set showmatch

" handle buffers better
set hidden

" show trailing whitespaces
set list
set listchars=tab:\ \             " a tab should display as ' '
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " Show > instead of linewrap


" ==========BELOW=========================
" shamelessly 'stolen' from garybernhardt
" https://github.com/garybernhardt/dotfiles/
" ========================================

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et

  autocmd! BufRead,BufNewFile *.sass setfiletype sass 

  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR()
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set statusline=%<%f\ (%{&ft})\ %{fugitive#statusline()}\ %-4(%m%)%=%-19(%3l,%02c%03V%)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>
" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()
nnoremap <leader><leader> <c-^>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>
