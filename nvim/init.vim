source $HOME/.config/nvim/plug-conf/coc.nvim

set nowrap                                      " Disable text wrapping
set undofile                                    " Enable undo file"
set undodir=~/.vim/undo/                        " Set Undo directory 
set timeoutlen=250                              " Set timeout length to 300ms (for exiting insert with jk)
set nocompatible                                " disable compatibility to old-time vi
set showmatch                                   " show matching 
set incsearch                                   " incremental search
set ignorecase                                  " case insensitive 
set mouse=v                                     " middle-click paste with 
set hlsearch                                    " highlight search 
set tabstop=4                                   " number of columns occupied by a tab 
set softtabstop=4                               " see multiple spaces as tabstops so <BS> does the right thing
set expandtab                                   " converts tabs to white space
set shiftwidth=4                                " width for autoindents
set autoindent                                  " indent a new line the same amount as the line just typed
set number                                      " add line numbers
set wildmode=longest,list                       " get bash-like tab completions
" set cc=80                                      " set an 80 column border for good coding style
filetype plugin indent on                       "allow auto-indenting depending on file type
syntax on                                       " syntax highlighting
set mouse=a                                     " enable mouse click
set clipboard=unnamedplus                       " using system clipboard
filetype plugin on
set cursorline                                  " highlight current cursorline
set ttyfast                                     " Speed up scrolling in Vim
" set spell                                     " enable spell check (may need to download language package)
" set noswapfile                                " disable creating swap file
" set backupdir=~/.cache/vim                     " Directory to store backup files
set splitright                                  " open new split panes to right and below
set splitbelow
set statusline=%F%m%r%h%w%=\ [%Y]\ [%{&ff}]\ [%l,%v]\ [%p%%]\ [%L]

""" Plugins (vim-plug)
call plug#begin('~/.vim/plugged')
    Plug 'dracula/vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'honza/vim-snippets'
    Plug 'SirVer/ultisnips'
    Plug 'scrooloose/nerdtree'
    Plug 'preservim/nerdcommenter'
    Plug 'mhinz/vim-startify'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
    Plug 'Raimondi/delimitMate'
    Plug 'shaunsingh/nord.nvim'
    Plug 'vim-airline/vim-airline'
    "Plug lightline
    Plug 'tpope/vim-surround'
call plug#end()


""" Color schemes
if (has('termguicolors'))
 set termguicolors
 endif
 syntax enable
 
" colorscheme
 let g:dracula_colorterm = 0
 colorscheme dracula

" Air-line coc integration
 let g:airline#extensions#coc#enabled = 1


""" KeyBindings

" Set leader key
let mapleader=" "

" Change working directory to current init.vim
nnoremap <leader>cd :cd %:p:h<CR>

" move line or visually selected block - alt+j/k
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"Toggle search highlighting
 nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"
" move split panes to left/bottom/top/right
 nnoremap <A-S-h> <C-W>H
 nnoremap <A-S-j> <C-W>J
 nnoremap <A-S-k> <C-W>K
 nnoremap <A-S-l> <C-W>L
 
" Press i to enter insert mode, and jk to exit insert mode.
:inoremap jk <Esc>
" <esc> to quit terminal mode
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
" Toggle NERDTree
noremap <C-e> :NERDTreeToggle<CR>
" Open file under cursor in vertical split
nnoremap gf :vert winc f<cr>
" Move line down
nnoremap <A-y><A-y> "zyy"zp
vnoremap <A-y><A-y> "zy<Esc>'>"zp
nnoremap <A-S-y><A-S-y> "zyy"zP
vnoremap <A-S-y><A-S-y> "zy<Esc>'<"zP

" Debugging (C++)
packadd termdebug
nnoremap <F3> :Termdebug %<CR>
nnoremap <F5> :Run<CR> 
nnoremap <F10> :Over
nnoremap <F11> :Step
nnoremap <A-b><A-b> :Break<CR>

" NERD COMMENT
noremap <C-_> <plug>NERDCommenterToggle
noremap! <C-h> <C-w>
noremap! <C-BS> <C-w>
inoremap <C-w> <C-\><C-o>dB
inoremap <C-BS> <C-\><C-o>db
