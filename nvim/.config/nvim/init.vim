" {{{ Plugins

if has('nvim')
    call plug#begin('~/.local/shared/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
end

" Plugs
Plug 'Raimondi/delimitMate'
Plug 'gregsexton/gitv'
Plug 'justinmk/vim-dirvish'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/a.vim'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug 'mhinz/vim-grepper'
Plug 'roxma/nvim-completion-manager'

" Fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Themes
Plug 'sjl/badwolf'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'owickstrom/vim-colors-paramount'

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
set termguicolors

if has("gui_running")
    set background=dark
    colorscheme dracula
    let g:airline_theme='dracula'
else
    set background=light
    colorscheme PaperColor
    let g:airline_theme='light'
    " transparent background
    " hi Normal guibg=NONE ctermbg=NONE
    " hi NonText guibg=NONE ctermbg=NONE
endif

" Open quickfix window after grepping
autocmd QuickFixCmdPost *grep* cwindow

" Various
set shell=bash

set expandtab
set autoindent
set shiftwidth=2
set softtabstop=-1
set smarttab
set laststatus=2

" backspace through anything in insert mode
set backspace=indent,eol,start

" play nice with clipboard
set clipboard=unnamedplus

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
if has('nvim')
    nmap <BS> <C-W>h
endif

" remove search-hl on enter
nnoremap <CR> :let @/ = ""<CR><CR>

nnoremap <Leader>ve :vs $MYVIMRC<CR>
nnoremap <Leader>vs :source $MYVIMRC<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gb :Gblame<CR>

" Enable omni completion.
augroup fileSpecific
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType go setlocal noet sw=8
  autocmd FileType grd setlocal sw=2
augroup END

augroup fugitive
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1

let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 1

nnoremap <leader>gv :Gitv<cr>
nnoremap <leader>gV :Gitv!<cr>

let g:ale_linters = {
      \ 'java': [],
\}

" Fzf
let g:fzf_command_prefix = 'Fzf'
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" Custom normal mode mappings
nmap <leader>ff :FzfFiles<cr>
nmap <leader>fc :FzfColors<cr>
nmap <leader>fl :FzfLines<cr>
nmap <leader>b :FzfBuffers<cr>
nmap <leader>r :FzfHistory<cr>
nmap <leader>fg :FzfGFiles<cr>

" Custom command for fzf opening wiki files
nmap <leader>fw :FzfFiles ~/vimwiki/<cr>

" vim-grepper
let g:grepper = {}
let g:grepper.tools = ['rg', 'git']
let g:grepper.highlight = 1
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Tab completion nvim-completion-manager
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

augroup dirvish
    autocmd FileType dirvish call fugitive#detect(@%)
augroup END

" Command to load issues from critic to quickfix
function! Criticize()
    set makeprg=criticize
    set efm+=%f:%l-%*[0-9]:\ %m
    make
    cwindow
endfunction

command! Critic :call Criticize()

" Workaround for nvim bug
" https://github.com/neovim/neovim/issues/5999
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

source ~/.config/nvim/nvim-local.vim

" vim: sw=4 ts=4
