:set nocompatible

:set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'sainnhe/sonokai'

Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

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


let g:netrw_liststyle=3
let g:netrw_altv=1

" Vim-LSP Autocomplete
:inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
:inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
:inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
:imap <c-space> <Plug>(asyncomplete_force_refresh)

:nnoremap <buffer> gd :LspDefinition <cr>
:nnoremap <buffer> gD :LspDeclaration <cr>
:nnoremap <buffer> gi :LspImplementation <cr>
:nnoremap <buffer> gh :LspHover <cr>
:nnoremap <buffer> gf :LspDocumentFormat <cr>
:nnoremap <buffer> gr :LspRename <cr>
:nnoremap <buffer> gR :LspReferences <cr>

