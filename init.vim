syntax on
filetype plugin indent on

set laststatus=2
set t_Co=256
set noswapfile
set nowrap
set backupcopy=yes
set timeoutlen=1000 ttimeoutlen=0
set number
set relativenumber
set shiftwidth=2
set expandtab
set splitbelow
set splitright
set incsearch
set hlsearch

set cul
autocmd InsertEnter,InsertLeave * set cul!
set list
set listchars=tab:‣\ ,trail:·,precedes:«,extends:»,eol:¬

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


call plug#begin('~/.config/nvim/plugged')

  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'joshdick/onedark.vim'
  Plug 'tpope/vim-surround'
  Plug 'airblade/vim-gitgutter'
  Plug 'easymotion/vim-easymotion'
  Plug 'maxboisvert/vim-simple-complete'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|git'
map <C-b> :NERDTreeToggle<CR>
silent! color onedark
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'
