filetype off                   " required! for vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'ddollar/nerdcommenter'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle 'vim-scripts/ZoomWin'
Bundle 'flazz/vim-colorschemes'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-rails'
Bundle 'mattn/emmet-vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'dag/vim2hs'
Bundle 'airblade/vim-gitgutter'
" Note! YouCompleteMe requires newer version of vim
" Easiest way is to just install 7.4 from source..
" instructions: http://michaelheap.com/installing-vim-7-4-on-ubuntu/
Bundle 'Valloric/YouCompleteMe' 
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" ...

filetype plugin indent on     " required! for vundle

" Things that differs between gui/terminal
if has("gui_running")
    colors solarized
    set background=light
    set guifont=Ubuntu\ mono\ 11
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    " Maximize size of window
    set lines=999
    set columns=999
else
    color Tomorrow-Night
endif

" make copy-paste work better
if has ('x') && has ('gui') " On Linux use + register for copy-paste
    set clipboard=unnamedplus
elseif has ('gui')          " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
endif

" Copy - Pasteing
vnoremap <C-c> "*y
" Tab (whitespace) stuff
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set laststatus=2
" Always show tabs
"set showtabline=2
" Highlight the current line
set cursorline
set nu  " show numbers
set rnu " relative line numbering
set nowrap
" Briefly show matching bracket when new is inserted
set showmatch
" Search settings
set hlsearch
set incsearch
" Search ignores case unless it contains uppercase characters
set ignorecase smartcase
" Show more context when scrolling
set scrolloff=5
" Enable syntax highlighting
syntax on
" And load indent files to automatically do language-dependent indenting
filetype plugin indent on
" Handle buffers better
set hidden
" Show trailing whitespaces
set list
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen
" Keys
let mapleader=","
let g:user_emmet_expandabbr_key='<c-j>'
map <leader>b :CtrlPBuffer<cr>
map <C-b> :CtrlPBuffer<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
" Stolen from garybernhardt, might have minor modifications for my pleasure.
" https://github.com/garybernhardt/dotfiles/
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
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>
" Can't be bothered to understand ESC vs <c-c> in insert mode
imap jj <esc>
imap <c-c> <esc>
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
