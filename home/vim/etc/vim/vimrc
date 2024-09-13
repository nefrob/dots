" nefrob's vim/neovim config

set nocompatible

let mapleader = " "
let maplocalleader = "\\"
inoremap jj <esc>

if exists('g:vscode')
    " vscode nvim extension
elseif has('nvim')
    " See nvim defaults here:
    " https://neovim.io/doc/user/vim_diff.html
    
    "  configured elsewehere for now
else
    " base vim
    source ~/.vim/keybinds.vim
    source ~/.vim/options.vim
    source ~/.vim/plugins.vim
    source ~/.vim/plugins-config.vim
endif
