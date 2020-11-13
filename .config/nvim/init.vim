:set nocompatible

:set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'sainnhe/sonokai'
Plugin 'franbach/miramare'

" Plugin 'prabirshrestha/vim-lsp'
" Plugin 'mattn/vim-lsp-settings'
" Plugin 'prabirshrestha/asyncomplete.vim'
" Plugin 'prabirshrestha/asyncomplete-lsp.vim'

Plugin 'neovim/nvim-lspconfig'

Plugin 'sheerun/vim-polyglot'
call vundle#end()  

:set termguicolors
:let g:miramare_enable_italic = 1
:let g:miramare_disable_italic_comment = 1
:colorscheme sonokai
:set nocp " This changes the values of a LOT of options, enabling features which are not Vi compatible but really really nice
:set autoindent " Automatic indentation
:set cindent " This turns on C style indentation
:syntax enable " syntax highlighting
:set mouse=a " Mouse Integration
:set noswapfile
:set number
:set tabstop=2
:set shiftwidth=2
:set softtabstop=2
:set expandtab
:set hlsearch
:set si
:set timeoutlen=1000
:set ttimeoutlen=0
:set cursorline
:set clipboard=unnamed
:set clipboard+=unnamedplus
:set signcolumn=yes
:set relativenumber
:set hidden
:set switchbuf=useopen,usetab
:set ve=block


let g:netrw_liststyle=3
let g:netrw_altv=1

" Vim-LSP Autocomplete
:inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
:inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" :inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
:imap <c-space> <cmd>call feedkeys("\<C-x>\<C-o>", "n")<CR>
" 
" :nnoremap <buffer> gd :LspDefinition <cr>
" :nnoremap <buffer> gD :LspDeclaration <cr>
" :nnoremap <buffer> gi :LspImplementation <cr>
" :nnoremap <buffer> gh :LspHover <cr>
" :nnoremap <buffer> gf :LspDocumentFormat <cr>
" :nnoremap <buffer> gr :LspRename <cr>
" :nnoremap <buffer> gR :LspReferences <cr>


" NVim built-in lsp support
luafile ~/.config/nvim/lua/lsp_config.lua
setlocal omnifunc=v:lua.vim.lsp.omnifunc
set completeopt=menuone,noinsert,noselect

nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gc    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> gf    <cmd>lua vim.lsp.buf.formatting()<CR>
