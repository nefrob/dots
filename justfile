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
    git config --global alias.pushfwl "push --force-with-lease"

# Interactive rebase to make a release branch
@make-release:
    echo "Stashing local changes"
    git stash
    echo "Creating release branch"
    git fetch origin
    git checkout -b $(git config user.name)/release/$(date +%F) --track origin/main
    git rebase origin/prod -i

# Make a hotfix (cherry-pick branch)
@make-hotfix cherry_hash hotfix_name="$(date +%F)":
    echo "Stashing local changes"
    git stash
    echo "Cherry picking" {{ cherry_hash }}
    git fetch origin
    git checkout -b $(git config user.name)/hotfix/{{ hotfix_name }} --track origin/prod
    git cherry-pick {{ cherry_hash }}

# Deletes all local branches except the currently checked out one
@branch-delete-nuclear:
    git branch -D $(git branch)

# node

# Install a node version
@node-install VERSION="lts" SCOPE="global":
    asdf install nodejs {{ VERSION }}
    asdf {{ SCOPE }} nodejs {{ VERSION}}

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
    pyenv local {{ VENV_NAME}}

# vim

# Install coc extension
@vim-coc-install EXTENSION_NAME:
    vim +CocInstall {{ EXTENSION_NAME }}

# nvim

@nvchad-update:
    nvim +NvChadUpdate

# tmux

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

# chrome

# Open Chrome with auto-open-devtools flag
@chrome-dev:
    echo "You need to quit out of chrome before running this for it to work"
    open -a "Google Chrome" --args --auto-open-devtools-for-tab
