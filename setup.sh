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
        mkdir -p "$(pwd)/zsh/custom"
        touch "$(pwd)/zsh/custom/config.zsh"
    fi

    echo "Copying existing zshenv config"
    if [ -f "$HOME/.zshenv" ]; then cp "$HOME/.zshenv" "$(pwd)/zsh/.config/zsh/.zshenv.bak"; fi
    if [ -f "$HOME/.zlogin" ]; then cp "$HOME/.zlogin" "$(pwd)/zsh/.config/zsh/.zlogin.bak"; fi
    if [ -f "$HOME/.zlogout" ]; then cp "$HOME/.zlogout" "$(pwd)/zsh/.config/zsh/.zlogout.bak"; fi
}

if [[ "$(uname -s)" == 'Darwin' ]]; then
    echo "Setting up macOS"
    xcode-select --install
    chmox +x os/.macos
    ./os/macos
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

setup_zsh

# echo "Setting up stow config symlinks"
( cd home && stow \
    -t "$HOME" \
    zsh \
    vim \
    tmux
)

# reload shell since the path was updated
exec "$SHELL"
