if has('vim_starting')
  set rtp+=C:\Users\Takumi\.vim\plugged\vim-plug
  if !isdirectory(expand('C:\Users\Takumi\.vim\plugged\vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p C:\Users\Takumi\.vim\plugged\vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git C:\Users\Takumi\.vim\plugged\vim-plug\autoload')
  end
endif

" install plug-ins
call plug#begin('C:\Users\Takumi\.vim\plugged')
  Plug 'junegunn/vim-plug', {'dir': 'C:\Users\Takumi\.vim\plugged\vim-plug\autoload'}
  Plug 'Shougo/unite.vim'
  Plug 'Shougo/neomru.vim'
  Plug 'scrooloose/nerdtree'
call plug#end()

"" Setting for Unite.vim
" start input mode
let g:unite_enable_start_insert=1
" buffer list
noremap <C-P> :Unite buffer<CR>
" file list
noremap <C-N> :Unite -buffer-name=file file<CR>
" recently file list
noremap <C-Z> :Unite file_mru<CR>
" make 'sources' current file directory
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" split window and open
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')

" split window vertically and open
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('vsplit')

" finish when pushed ESC key 2 times
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" init all settings
set all&
" init autocmd
autocmd!
" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" syntax hilight
syntax enable
filetype plugin indent on

set nobackup
set noswapfile
set autoread

set number
set ruler
set cursorline
set smartindent
set showmatch

set expandtab
set tabstop=4
set shiftwidth=4

set incsearch
set clipboard=unnamed,autoselect

nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

" call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
" call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
" call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
" call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
" call submode#map('bufmove', 'n', '', '>', '<C-w>>')
" call submode#map('bufmove', 'n', '', '<', '<C-w><')
" call submode#map('bufmove', 'n', '', '+', '<C-w>+')
" call submode#map('bufmove', 'n', '', '-', '<C-w>-')

" Edit Binary Mode (xxd) (start by vim -b, or open *.bin)
augroup BinaryXXD
    autocmd!
    autocmd BufReadPre   *.bin let &binary = 1
    autocmd BufReadPost  * if &binary | silent %!xxd -g 1
    autocmd BufReadPost  * set ft=xxd | endif
    autocmd BufWritePre  * if &binary | !%xxd -r | endif
    autocmd BufWritePost * if &binary | silent %!xxd -g 1
    autocmd BufWritePost * set nomod  | endif
augroup END

