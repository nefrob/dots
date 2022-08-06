# Useful commands

@_default:
    just --list

# Format this justfile
@fmt:
    just --fmt --unstable

# Gloabl setup using all setup functions
@setup-all:
    git submodule update --init
    just zsh-setup
    just node-setup
    just node-install
    just pyenv-setup
    just pyenv-install
    just vim-setup
    just tmux-setup

# Configure git
@git-config NAME="nefrob", EMAIL, EDITOR="nvim":
    git config --local user.name {{ NAME }}
    git config --local user.email {{ EMAIL }}
    git config --local core.editor {{ EDITOR }}

# zsh

# Link zsh dot directory
@zsh-setup:
    # Read more on startup files here: https://zsh.sourceforge.io/Intro/intro_3.html
    export ZDOTDIR=$HOME/.zsh
    ln -s .zsh $HOME/.zsh
    echo "Copying any existing zsh config from $HOME to $ZDOTDIR"
    cat $HOME/.zshenv >> .zsh/.zshenv
    cat $HOME/.zprofile >> .zsh/.zprofile
    cat $HOME/.zlogin >> .zsh/.zlogin
    cat $HOME/.zlogout >> .zsh/.zlogout

    git clone https://github.com/zsh-users/zsh-autosuggestions \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    source ${ZDOTDIR:-~}/.zshrc

# node

# Setup asdf for managing different versions of nodejs
@node-setup:
    echo "See https://asdf-vm.com/guide/getting-started.html for up to date instructions"
    echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc 
    source ${ZDOTDIR:-~}/.zshrc

# Install a node version
@node-install VERSION="lts", SCOPE="global":
    asdf install nodejs {{ VERSION }}
    asdf {{ SCOPE }} nodejs {{ VERSION}}

# python

# Setup pyenv for managing different versions of python
@pyenv-setup:
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ${ZDOTDIR:-~}/.zshrc
    echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ${ZDOTDIR:-~}/.zshrc
    echo 'eval "$(pyenv init -)"' >> ${ZDOTDIR:-~}/.zshrc
    eval "$(pyenv virtualenv-init -)" >> ${ZDOTDIR:-~}/.zshrc
    source ${ZDOTDIR:-~}/.zshrc
    exec "$SHELL"

# Install a python version
@pyenv-install VERSION="3.10.6", SCOPE="global":
    pyenv install {{ VERSION }}
    pyenv {{ SCOPE }} {{ VERSION }}

# List available python versions
@pyenv-list:
    pyenv install -l

# Create a python virtual environment
@python-venv PYTHON_VERSION, VENV_NAME:
    pyenv virtualenv {{ PYTHON_VERSION }} {{ VENV_NAME }}
    pyenv local {{ VENV_NAME}}

# vim

# Link vim dot files
@vim-setup:
    ln -s .vim ~/.vim
    ln -s .vim/.vimrc ~/.vimrc
    vi +PlugInstall +qall
    echo "Read more on plugin management here: https://github.com/junegunn/vim-plug/"

# neovim

# TODO add neovim setup

# tmux

# Link tmux dot files
@tmux-setup:
    ln -s .tmux ~/.tmux
    ln -s .tmux/.tmux.conf ~/.tmux.conf
    echo "Install plugins via \`prefix\` + \`I\` with tmux running."
    echo "Read more here: https://github.com/tmux-plugins/tpm"

# Update tmux package manager
@tmux-update-tpm:
    git submodule foreach git pull origin master

# brew

# Install formulae from Brewfile
@brew-install +ARGS="--no-upgrade":
    brew bundle --file=developer/Brewfile --no-lock {{ ARGS }}
