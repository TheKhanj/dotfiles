:set nocompatible

:set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'sainnhe/sonokai'
Plugin 'franbach/miramare'

Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

Plugin 'sheerun/vim-polyglot'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
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
" All of your Plugins must be added before the following line
call vundle#end()  

:command! MakeTags !ctags -R
:set path+=**
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
" set ttymouse=xterm2
:set hlsearch
:set si
:set timeoutlen=1000
:set ttimeoutlen=0
:set cursorline
:set clipboard=unnamed
:set clipboard+=unnamedplus


let g:netrw_liststyle=3
let g:netrw_altv=1


" Auto completion with omnifunc
:filetype plugin on
:set omnifunc=syntaxcomplete#Complete
" C/C++ headers
:set tags+=~/.config/nvim/tags/cpp


" Vim-LSP Autocomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" NVim LSP sertup
" :lua require("lsp_config")
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" " Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? \<C-n>" : \<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? \<C-p>" : \<S-Tab>"
" 
" " Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect
" 
" " Avoid showing message extra message when using completion
" set shortmess+=c
" 
" imap <silent> <c-p> <Plug>(completion_trigger)
" autocmd BufWritePost * lua vim.lsp.buf.formatting()

