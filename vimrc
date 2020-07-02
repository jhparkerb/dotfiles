filetype off
filetype plugin indent off
set rtp+=~/.vim/bundle/vim-go
filetype plugin indent on
syntax on

set ts=2
set sw=2

colorscheme delek
set background=dark

set hlsearch

" set bash-like completion for filenames
" https://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names#526940
set wildmode=longest,list
