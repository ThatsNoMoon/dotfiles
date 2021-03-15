set nocompatible

let mapleader = ' '

nnoremap ; :
vnoremap ; :

tnoremap <Esc> <C-\><C-n>

nnoremap <Leader>tn :tabn<CR>
nnoremap <Leader>tp :tabp<CR>

augroup term
	autocmd!
	autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

packadd termdebug

command Fish edit term://fish
command Config edit ~/.config/nvim/init.vim

set clipboard+=unnamedplus
let g:clipboard = {
			\	'name': 'win32yank-wsl',
			\	'copy': {
			\		'+': 'win32yank.exe -i --crlf',
			\		'*': 'win32yank.exe -i --crlf',
			\	 },
			\	'paste': {
			\		'+': 'win32yank.exe -o --lf',
			\		'*': 'win32yank.exe -o --lf',
			\	},
			\	'cache_enabled': 0,
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
Plugin 'nvim-lua/popup.nvim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim'
Plugin 'nvim-telescope/telescope-fzy-native.nvim'

Plugin 'neovim/nvim-lspconfig'
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plugin 'dag/vim-fish'

Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'

call vundle#end()
filetype plugin on

lua << EOF

local lsp = require 'lspconfig'

lsp.rust_analyzer.setup {}
lsp.clangd.setup {}

require('nvim-treesitter.configs').setup {
	ensure_installed = "maintained",
	highlight = {
		enable = true,
	},
}

require('telescope').setup {
	defaults = {
		results_height = 10,
		file_ignore_patterns = { "*.o" },
	}
}

require('telescope').load_extension('fzy_native')
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
nnoremap <silent> <Leader>cf :lua vim.lsp.buf.formatting_sync(nil, 1000)<CR>
nnoremap <silent> <Leader>cr :lua vim.lsp.buf.rename()<CR>

augroup lsp
	autocmd!
	autocmd Filetype rust,cpp setlocal omnifunc=v:lua.vim.lsp.omnifunc

	autocmd Filetype rust,cpp nnoremap <silent> <buffer> <c-]> :lua vim.lsp.buf.definition()<CR>

	autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
	autocmd BufWritePre *.cpp lua vim.lsp.buf.formatting_sync(nil, 1000)
	autocmd BufWritePre *.h lua vim.lsp.buf.formatting_sync(nil, 1000)
augroup END

command LspRestart execute 'lua vim.lsp.stop_client(vim.lsp.get_active_clients())' | edit

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"

nnoremap <silent> <Leader>ff :Telescope find_files<CR>
nnoremap <silent> <Leader>fq :Telescope quickfix<CR>
nnoremap <silent> <Leader>fl :Telescope loclist<CR>
nnoremap <silent> <Leader>fb :Telescope buffers sort_lastused=true default_selection_index=1<CR>
nnoremap <silent> <Leader>fh :Telescope help_tags<CR>

nnoremap <silent> <Leader>fe :lua require('modules/telescope').show_diagnostics { layout_strategy = "center" }<CR>

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
set smarttab
set noexpandtab

set cinoptions+=L0
set cinoptions+=g0

augroup fmt
	autocmd!
	autocmd FileType rust setlocal noexpandtab
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
