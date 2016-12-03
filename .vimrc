"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/Takumi/.cache/dein/.//repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/Takumi/.cache/dein/./')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

" You can specify revision/branch/tag
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

set nobackup
set noswapfile
set autoread

set number
set cursorline
set smartindent
set showmatch

set expandtab
set tabstop=4
set shiftwidth=4

set incsearch

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

