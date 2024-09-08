# Useful commands

@_default:
    just --list

# Format this justfile
@fmt:
    just --fmt --unstable

# git

# Configure git defaults
@git-config EMAIL NAME="nefrob" EDITOR="code --wait":
    git config --global user.name {{ NAME }}
    git config --global user.email {{ EMAIL }}
    git config --global core.editor {{ EDITOR }}

# node

# Install a node version
@node-install VERSION="lts" SCOPE="global":
    asdf install nodejs {{ VERSION }}
    asdf {{ SCOPE }} nodejs {{ VERSION }}

# python

# Install a python version
@pyenv-install VERSION="3.11:latest" SCOPE="global":
    pyenv install {{ VERSION }}
    pyenv {{ SCOPE }} {{ VERSION }}

# List available python versions
@pyenv-list:
    pyenv install -l

# Create a python virtual environment
@python-venv PYTHON_VERSION VENV_NAME:
    pyenv virtualenv {{ PYTHON_VERSION }} {{ VENV_NAME }}
    pyenv local {{ VENV_NAME }}

# vim

# Install coc extension
@vim-coc-install EXTENSION_NAME:
    vim +CocInstall {{ EXTENSION_NAME }}

# nvim

@nvchad-update:
    nvim +NvChadUpdate

# tmux
# TODO: also have plugins auto install

# Update tmux package manager
@tmux-update-tpm:
    git submodule foreach git pull origin master

# brew

# Install formulae from Brewfile
@brew-install +ARGS="--no-upgrade":
    brew bundle --file=Brewfile --no-lock {{ ARGS }}

# Upgrade brew, dependencies and rehsim
@brew-upgrade:
    brew update
    brew upgrade
    pyenv rehash
    asdf reshim
