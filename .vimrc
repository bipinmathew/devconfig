set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
"" set rtp+=~/.vim/bundle/Vundle.vim
"" call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" " Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" " Plugin 'ascenator/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
"" Plugin 'Valloric/YouCompleteMe'
"" call vundle#end()            " required

filetype plugin indent on
syntax on

"" let g:rustfmt_autosave = 1

" set background=dark
" colorscheme hybrid
set number
set hidden


""" automatically reload content if on disk changes
set autoread
au CursorHold * checktime

set tabstop=2
set shiftwidth=2
set expandtab
set guifont=Hack\ 10

filetype plugin on
set clipboard=unnamedplus

set paste!
if executable('ag')
	" Note we extract the column as well as the file and line number
 set grepprg=ag\ --nogroup\ --nocolor\ --column
 set grepformat=%f:%l:%c%m
endif


" Configure directory browser
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
" Hide swap and other vim generated files.
let g:netrw_list_hide= '.*\.swp$,\~$,\.orig$'

" Delete should delete the entire directory no questions asked.
let g:netrw_localrmdir='rm -r'

" Start remapping create file shortcut '%' to just create the file and not
" open it
function! CreateInPreview()
  let l:filename = input("please enter filename: ")
  execute 'silent !touch ' . b:netrw_curdir.'/'.l:filename
  redraw!
endf

autocmd filetype netrw call Netrw_mappings()
function! Netrw_mappings()
  noremap <buffer>% :call CreateInPreview()<cr>
endfunction

" End remap
