set nocompatible

let mapleader = ' '

filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
"Plugin 'racer-rust/vim-racer'
Plugin 'joshdick/onedark.vim'
Plugin 'vim-airline/vim-airline'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
"Plugin 'autoclose'
Plugin 'Raimondi/delimitMate'
Plugin 'surround.vim'
Plugin 'EasyMotion'
"Plugin 'Syntastic'

Plugin 'elixir-editors/vim-elixir'

Plugin 'hylang/vim-hy'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

"Plugin 'rust-lang/rust.vim'
"Plugin 'vim-syntastic/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" set rtp+=~/.vim/bundle/autoclose.vim

set hidden
let g:racer_cmd = "/home/ben/.cargo/bin/racer"
let g:racer_experimental_completer = 1

let g:EasyMotion_leader_key = '<Leader>'

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

syntax on

set background=dark
set termguicolors
colorscheme onedark
highlight LineNr ctermfg=grey guifg=#969896

set cc=80

let g:onedark_terminal_italics=1

set ruler
set autoread
set number
set nowrap

let g:delimitMate_expand_cr = 2
set autoindent smartindent
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

set shell=/bin/bash

set incsearch
set ignorecase
set smartcase

set scrolloff=3
set sidescrolloff=5

set backup
set backupdir=~/.cache/nvim/backup
set directory=~/.cache/nvim/tmp
