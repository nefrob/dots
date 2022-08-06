# Useful commands

@_default:
    just --list

# Format this justfile
@fmt:
    just --fmt --unstable

# Configure git
@git-config EMAIL NAME="nefrob" EDITOR="nvim":
    git config --local user.name {{ NAME }}
    git config --local user.email {{ EMAIL }}
    git config --local core.editor {{ EDITOR }}

# node

# Install a node version
@node-install VERSION="lts" SCOPE="global":
    asdf install nodejs {{ VERSION }}
    asdf {{ SCOPE }} nodejs {{ VERSION}}

# python

# Install a python version
@pyenv-install VERSION="3.10.6" SCOPE="global":
    pyenv install {{ VERSION }}
    pyenv {{ SCOPE }} {{ VERSION }}

# List available python versions
@pyenv-list:
    pyenv install -l

# Create a python virtual environment
@python-venv PYTHON_VERSION VENV_NAME:
    pyenv virtualenv {{ PYTHON_VERSION }} {{ VENV_NAME }}
    pyenv local {{ VENV_NAME}}

# vim

# Install vim plugins
@vim-plugin-install:
    vi +PlugInstall +qall

# neovim

# TODO add neovim setup

# tmux

# Update tmux package manager
@tmux-update-tpm:
    git submodule foreach git pull origin master

# brew

# Install formulae from Brewfile
@brew-install +ARGS="--no-upgrade":
    brew bundle --file=developer/Brewfile --no-lock {{ ARGS }}
