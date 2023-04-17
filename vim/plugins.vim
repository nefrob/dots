" Vimplug plugins

call plug#begin('~/.vim/plugged')

" Themes
Plug 'joshdick/onedark.vim'
Plug 'ueaner/molokai'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim'
" Enhanced status bar
Plug 'itchyny/lightline.vim'
"  Get git branch
Plug 'itchyny/vim-gitbranch'
" File browser
Plug 'preservim/nerdtree'
" Git diff side column
Plug 'airblade/vim-gitgutter'
" Comment lines
Plug 'tpope/vim-commentary'
" Easily modify surrounding pairs
Plug 'tpope/vim-surround'
" Repeat plugins with .
Plug 'tpope/vim-repeat'
" Search / replace word variants
Plug 'tpope/vim-abolish'
" Detect indent style (tabs vs. spaces)
Plug 'tpope/vim-sleuth'
" Special comment coloring
Plug 'jbgutierrez/vim-better-comments'
" Better startup screen
Plug 'mhinz/vim-startify'
" Buffer delete doesn't close window
Plug 'moll/vim-bbye'
" Faster jumping around 
Plug 'justinmk/vim-sneak'
" Tmux same key navigation
Plug 'christoomey/vim-tmux-navigator'
" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()