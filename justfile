# Useful commands

import 'scripts/vim.just'
import 'scripts/tmux.just'
import 'scripts/zsh.just'

@_default:
    just --list

# Configure git defaults
[group('git')]
git-config EMAIL NAME="nefrob" EDITOR="code --wait":
    git config --global user.name {{ NAME }}
    git config --global user.email {{ EMAIL }}
    git config --global core.editor {{ EDITOR }}

[group('zsh')]
zsh-plugins:
    #!/usr/bin/env zsh
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
    git clone https://github.com/ikhomutov/zsh-django \
        "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-django"
    source "${ZDOTDIR:-$HOME}/.zshrc"

# Install formulae from Brewfile
[group('brew')]
brew-install +ARGS="--no-upgrade":
    brew tap homebrew/cask-fonts
    brew bundle --file=packages/Brewfile --no-lock {{ ARGS }}

# Upgrade brew, dependencies and rehsim
[group('brew')]
brew-upgrade:
    brew update
    brew upgrade
    mise reshim
