let mapleader = " "

set scrolloff=8
set statusline=%t\ %{FugitiveHead()}%=line\ %l\ out\ of\ %L,\ column\ %c
set fillchars=eob:\  
set nowrap
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set ignorecase
set smartcase
set noswapfile
set nobackup

highlight StatusLine cterm=bold ctermbg=NONE ctermfg=16
highlight StatusLineNC cterm=NONE ctermbg=NONE ctermfg=16
highlight CursorLine cterm=bold

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
nmap s <Plug>(easymotion-w)
nmap s <Plug>(easymotion-W)

nnoremap <leader>f :Files<CR>
nnoremap <leader>g :RG<CR>
