#!/usr/bin/env bash
set -euo pipefail

setup_zsh() {
    if [ "$SHELL" != "/bin/zsh" ] && [ "$SHELL" != "/usr/bin/zsh" ]; then
        echo "Switching shell to zsh"
        chsh -s "$(which zsh)"
        zsh
    fi

    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Installing oh my zsh"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi

    echo "Copying existing zshenv config"
    if [ -f "$HOME/.zshenv" ]; then cat "$HOME/.zshenv" >> "$(pwd)/zsh/.config/zsh/.zshenv"; fi
    if [ -f "$HOME/.zlogin" ]; then cat "$HOME/.zlogin" >> "$(pwd)/zsh/.config/zsh/.zlogin"; fi
    if [ -f "$HOME/.zlogout" ]; then cat "$HOME/.zlogout" >> "$(pwd)/zsh/.config/zsh/zlogout"; fi

    zsh
    just zsh-setup
}

if [[ "$(uname -s)" == 'Darwin' ]]; then
    echo "Setting up macOS"
    xcode-select --install
    chmox +x os/.macos
    ./os/macos
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

setup_zsh

echo "Setting up stow config symlinks"
stow \
    -t "$HOME" \
    zsh \
    vim \
    tmux

# reload shell since the path was updated
exec "$SHELL"
