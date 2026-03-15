#!/usr/bin/env bash
set -euo pipefail

DOTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# macOS bootstrap
if [[ "$(uname -s)" == 'Darwin' ]]; then
    echo "Installing Xcode command line tools..."
    xcode-select --install 2>/dev/null || true

    echo "Running macOS setup script..."
    chmod +x os/.macos
    ./os/macos

    # Install Homebrew
    echo "Installing Homebrew..."
    if ! hash brew 2>/dev/null; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    # Install packages (includes stow, mise, git, zsh, just)
    echo "Installing brew packages..."
    brew tap homebrew/cask-fonts
    brew bundle --file="$DOTS_DIR/packages/Brewfile" --no-lock
fi

# Setup zsh
echo "Setting up zsh..."
if [ "$SHELL" != "/bin/zsh" ] && [ "$SHELL" != "/opt/homebrew/bin/zsh" ]; then
    chsh -s "$(which zsh)"
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh my zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    mkdir -p "$DOTS_DIR/zsh/custom"
    touch "$DOTS_DIR/zsh/custom/config.zsh"
fi

# Back up any existing zsh files before stow overwrites them
for f in .zshenv .zlogin .zlogout; do
    [ -f "$HOME/$f" ] && cp "$HOME/$f" "$DOTS_DIR/home/zsh/.config/zsh/${f}.bak" || true
done

# Stow dotfiles
echo "Stowing dotfiles..."
( cd "$DOTS_DIR/home" && stow -t "$HOME" \
    zsh \
    nvim \
    vim \
    tmux \
    mise \
    git \
    starship \
    ghostty \
    helix \
    zellij
)

echo "Done. Reload your shell: exec zsh"
