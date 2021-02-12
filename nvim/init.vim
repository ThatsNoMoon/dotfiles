set nocompatible

let mapleader = ' '

nnoremap ; :
vnoremap ; :

tnoremap <Esc> <C-\><C-n>

augroup term
	autocmd!
	autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

command Fish edit term://fish
command Config edit ~/.config/nvim/init.vim

set clipboard+=unnamedplus
let g:clipboard = {
			\   'name': 'win32yank-wsl',
			\   'copy': {
			\      '+': 'win32yank.exe -i --crlf',
			\      '*': 'win32yank.exe -i --crlf',
			\    },
			\   'paste': {
			\      '+': 'win32yank.exe -o --lf',
			\      '*': 'win32yank.exe -o --lf',
			\   },
			\   'cache_enabled': 0,
			\ }

filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
Plugin 'VundleVim/Vundle.vim'

Plugin 'joshdick/onedark.vim'
Plugin 'vim-airline/vim-airline'

Plugin 'Raimondi/delimitMate'
Plugin 'surround.vim'
Plugin 'EasyMotion'

Plugin 'moll/vim-bbye'
Plugin 'L9'
Plugin 'FuzzyFinder'

Plugin 'neovim/nvim-lspconfig'

Plugin 'dag/vim-fish'

call vundle#end()
filetype plugin on

lua << EOF

local lsp = require 'lspconfig'

lsp.rust_analyzer.setup {}

lsp.clangd.setup {}

EOF

nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> :lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD :lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr :lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0 :lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW :lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <Leader>ca :lua vim.lsp.buf.code_action()<CR>

augroup lsp
	autocmd!
	autocmd Filetype rust,cpp setlocal omnifunc=v:lua.vim.lsp.omnifunc

	autocmd Filetype rust,cpp nnoremap <silent> <buffer> <c-]> :lua vim.lsp.buf.definition()<CR>

	autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
	autocmd BufWritePre *.cpp lua vim.lsp.buf.formatting_sync(nil, 1000)
	autocmd BufWritePre *.h lua vim.lsp.buf.formatting_sync(nil, 1000)
augroup END

command LspRestart execute 'lua vim.lsp.stop_client(vim.lsp.get_active_clients())' | edit

nnoremap <Leader>ff :FufFile<CR>
nnoremap <Leader>fq :FufQuickfix<CR>
nnoremap <Leader>fb :FufBuffer<CR>
nnoremap <Leader>fl :FufLine<CR>

let g:EasyMotion_leader_key = '<Leader>'

let g:airline_section_y = 'W %{winnr()}'

set hidden

syntax on

set background=dark
set termguicolors
colorscheme onedark
let g:onedark_terminal_italics=1
highlight LineNr ctermfg=grey guifg=#969896

set cc=80

set ruler
set autoread
set number
set nowrap

let g:delimitMate_expand_cr = 2
set autoindent smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set smarttab

augroup fmt
	autocmd!
	autocmd FileType rs setlocal noexpandtab
	autocmd FileType cpp setlocal expandtab
augroup END

set shell=/bin/bash

set incsearch
set ignorecase
set smartcase

set scrolloff=3
set sidescrolloff=5

set backup
set backupdir=~/.cache/nvim/backup
set directory=~/.cache/nvim/tmp
