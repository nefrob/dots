#!/bin/sh

# Set these to install conditional dependencies
IS_MAC=

setup_xcode() {
    if [ -n "$IS_MAC" ]; then
        echo "Installing xcode..."
        xcode-select --install
    fi
}

setup_homebrew() {
    echo "Installing homebrew"
    brew tap homebrew/cask-fonts
    brew bundle --file=Brewfile --no-lock --no-upgrade
}

setup_zsh() {
    # Read more on startup files here: https://zsh.sourceforge.io/Intro/intro_3.html
    echo "Setting up zsh"

    if [ "$SHELL" != "/bin/zsh" ] && [ "$SHELL" != "/usr/bin/zsh" ]; then
        echo "Switching shell to zsh"
        chsh -s "$(which zsh)"
        zsh
    fi

    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    echo "Linking zsh config"
    mkdir -p "$HOME/.config"
    ln -s "$(pwd)/zsh" "$HOME/.zsh"

    echo Setting ZDOTDIR to "$HOME/.zsh"
    echo "export ZDOTDIR=$HOME/.zsh" >> "$HOME/.zshenv"

    mkdir -p "$(pwd)/zsh/custom"
    touch "$(pwd)/zsh/custom/config.zsh"

    echo "Copying existing zshenv config"
    cat "$HOME/.zshenv" >> "$(pwd)/zsh/.zshenv"
    if [ -f "$HOME/.zprofile" ]; then cat "$HOME/.zprofile" >> "$(pwd)/zsh/.zprofile"; fi
    if [ -f "$HOME/.zlogin" ]; then cat "$HOME/.zlogin" >> "$(pwd)/zsh/.zlogin"; fi
    if [ -f "$HOME/.zlogout" ]; then cat "$HOME/.zlogout" >> "$(pwd)/zsh/.zlogout"; fi

    echo "Installinh zsh plugins"
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
    git clone https://github.com/ikhomutov/zsh-django \
        "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-django"

    source "${ZDOTDIR:-~}/.zshrc"
}

setup_git() {
    echo "Setting up git"
    ln -s "$(pwd)/git" $HOME/.config/git
}

setup_asdf() {
    echo "Setting up asdf"
    echo "See https://asdf-vm.com/guide/getting-started.html for latest instructions"
    echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
    source ${ZDOTDIR:-~}/.zshrc

    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
    just node-install
}

setup_pyenv() {
    # See https://github.com/pyenv/pyenv for latest instructions
    echo "Setting up pyenv"

    if ! type -f pyenv >/dev/null; then
        {
            echo "export PYENV_ROOT='$HOME/.pyenv'";
            echo "command -v pyenv >/dev/null || export PATH='$PYENV_ROOT/bin:$PATH'";
            echo "eval '$(pyenv init -)'";
        } >> "${ZDOTDIR:-~}/.zshrc"
        source "${ZDOTDIR:-~}/.zshrc"
    fi

    if ! type -f pyenv-virtualenv >/dev/null; then
        echo "eval '$(pyenv virtualenv-init -)'" >> "${ZDOTDIR:-~}/.zshrc"
        source "${ZDOTDIR:-~}/.zshrc"
    fi

    pyenv install 3.12:latest
    pyenv global "$(pyenv latest 3.12)"
}

setup_vim() {
    ln -s "$(pwd)/vim" "$HOME/.vim"
    ln -s "$(pwd)/vim/.vimrc" "$HOME/.vimrc"

    echo "Installing plugins"
    echo "Read more on plugin management here: https://github.com/junegunn/vim-plug/"
    vim +PlugInstall +qall
}

setup_nvim() {
    # See https://nvchad.com/docs/quickstart/install for latest instructions
    echo "Setting up nvim"

    git clone https://github.com/NvChad/NvChad "$(pwd)/nvchad" --depth 1
    ln -s "$(pwd)/nvim/custom" "$(pwd)/nvim/nvchad/lua/custom"
    ln -s "$(pwd)/nvim/nvchad" "$HOME/.config/nvim"
}

setup_tmux() {
    echo "Setting up tmux"
    echo "Install plugins via \`prefix\` + \`I\` with tmux running."
    echo "Read more here: https://github.com/tmux-plugins/tpm"

    ln -s "$(pwd)/tmux" "$HOME/.config/tmux"
    git clone https://github.com/tmux-plugins/tpm "$(pwd)/tmux/plugins/tpm"
}

setup_vscode() {
    # Read more here: https://code.visualstudio.com/docs/setup/mac
    echo "Setting up vscode cli"
    echo "export PATH='\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin'" >> "$(pwd)/zsh/.zprofile"
}

setup_starship() {
    # Read more here: https://starship.rs/guide
    echo "Setting up startship"

    if ! type -f starship >/dev/null; then
        ln -s "$(pwd)/starship.toml" "$HOME/.config/starship.toml"
        echo "eval '$(starship init zsh)'" >> "${ZDOTDIR:-~}/.zshrc"
        source "${ZDOTDIR:-~}/.zshrc"
    fi
}

setup_zellij() {
    # Read more here: https://zellij.dev/documentation/introduction.html
    echo "Setting up zellij"

    if ! type -f starship >/dev/null; then
        ln -s "$(pwd)/zellij" "$HOME/.config/zellij"
        echo "eval '$(zellij setup --generate-auto-start zsh)'" >> "${ZDOTDIR:-~}/.zshrc"
        source "${ZDOTDIR:-~}/.zshrc"
    fi
}

setup_helix() {
    # Read more here: https://docs.helix-editor.com/install.html
    echo "Setting up helix"

    if ! type -f hx >/dev/null; then
        ln -s "$(pwd)/helix" "$HOME/.config/helix"
        source "${ZDOTDIR:-~}/.zshrc"
    fi
}

setup_graphite() {
    gt completion >> "${ZDOTDIR:-~}/.zshrc"
}


echo "Running required setup..."
setup_xcode
setup_homebrew
setup_zsh

echo "Running utilities setup..."
setup_git
setup_vim
setup_tmux

if [ -n "$MINIMAL" ]; then
    echo "Running additional tools setup..."
    setup_asdf
    setup_helix
    setup_nvim
    setup_pyenv
    setup_starship
    setup_vscode
    setup_zellij
fi

# reload shell since the path was updated
exec "$SHELL"
