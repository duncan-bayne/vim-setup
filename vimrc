set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-ruby/vim-ruby'

" start NERDTree automagically
autocmd vimenter * NERDTree

" recommended settings for Vim Ruby
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" automagically encrypt & decrypt ccrypt files
" courtesy http://vim.wikia.com/wiki/Encryption
augroup CPT
  au!
  au BufReadPre *.cpt set bin
  au BufReadPre *.cpt set viminfo=
  au BufReadPre *.cpt set noswapfile
  au BufReadPost *.cpt let $vimpass = inputsecret("Password: ")
  au BufReadPost *.cpt silent '[,']!ccrypt -cb -E vimpass
  au BufReadPost *.cpt set nobin
  au BufWritePre *.cpt set bin
  au BufWritePre *.cpt '[,']!ccrypt -e -E vimpass
  au BufWritePost *.cpt u
  au BufWritePost *.cpt set nobin
augroup END
