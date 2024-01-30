" general Settings
set nocompatible              " Turn off compatibility with Vi
syntax on                     " Enable syntax highlighting
filetype plugin indent on     " Enable filetype detection and plugin-based indenting
set autoindent                " Automatically indent new lines
set smartindent               " Make indenting smart
set tabstop=4                 " Number of spaces tabs count for
set shiftwidth=4              " Number of spaces for each indentation
set expandtab                 " Convert tabs to spaces
set softtabstop=4             " Soft tab stops
set backspace=indent,eol,start

" User Interface
set number                    " Show line numbers
set relativenumber            " Show relative line numbers
set showcmd                   " Show incomplete commands
set wrap                      " Enable line wrapping
set scrolloff=10              " Keep 10 lines above/below the cursor
set sidescrolloff=10          " Keep 10 columns to the left/right of the cursor
set wildmenu                  " Enhance command line completion
set ignorecase                " Case insensitive searching
set smartcase                 " Case sensitive if uppercase present
set incsearch                 " Incremental search
set hlsearch                  " Highlight search matches

" System Clipboard
set clipboard=unnamedplus     " Use the system clipboard

" Encoding
set encoding=utf-8            " Set default encoding to UTF-8

" Color Scheme
colorscheme desert

" Mouse
set mouse=a                   " Enable mouse support

"Plug-in start and end
call plug#begin('~/.vim/plugged')

"Plugin List
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
call plug#end()"Plugins


" Custom Key Bindings
let mapleader = " "           " Set space as the leader key
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>

" coc.nvim global extensions
let g:coc_global_extensions = ['coc-json', 'coc-snippets', 'coc-pyright', 'coc-java', 'coc-clangd']

" Coc.nvim configurations
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use `gd` to go to definition
nmap <silent> gd <Plug>(coc-definition)

" Use `gy` to go to type definition
nmap <silent> gy <Plug>(coc-type-definition)

" Use `gi` to go to implementation
nmap <silent> gi <Plug>(coc-implementation)

" Use `gr` to go to references
nmap <silent> gr <Plug>(coc-references)

" Use `:CocCommand` for running commands
" Use `<leader>ac` for code actions
nmap <leader>ac <Plug>(coc-codeaction)

" Use `<leader>s` for searching and applying code snippets
xmap <leader>s  <Plug>(coc-snippets-select)
nmap <leader>s  <Plug>(coc-snippets-select)

" Autocompletion customization
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
