# vim

# Install vim plugins
[group('vim')]
vim-plug-install:
    vim +PlugInstall +qall

# Install coc extension
[group('vim')]
vim-coc-install EXTENSION_NAME:
    vim +CocInstall {{ EXTENSION_NAME }}

# nvim
[group('nvim')]
nvchad-install:
    git clone https://github.com/NvChad/NvChad "$(pwd)/nvim/.config/nvim" --depth 1

[group('nvim')]
nvchad-update:
    nvim +NvChadUpdate
