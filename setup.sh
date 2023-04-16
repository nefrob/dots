#!/bin/bash

xcode-select --install
brew tap homebrew/cask-fonts
brew bundle --file=Brewfile --no-lock --no-upgrade

# Setup zsh

echo "Setting up zsh"

# Read more on startup files here: https://zsh.sourceforge.io/Intro/intro_3.html
mkdir -p $HOME/.config
ln -s "$(pwd)/zsh" $HOME/.zsh
echo Setting ZDOTDIR to $HOME/.zsh
echo "export ZDOTDIR=$HOME/.zsh" >> $HOME/.zshenv

mkdir -p "$(pwd)/zsh/custom"
touch "$(pwd)/zsh/custom/config.zsh"

# copy any existing files
cat $HOME/.zshenv >> $(pwd)/zsh/.zshenv
if [ -f $HOME/.zprofile ]; then cat $HOME/.zprofile >> $(pwd)/zsh/.zprofile; fi
if [ -f $HOME/.zlogin ]; then cat $HOME/.zlogin >> $(pwd)/zsh/.zlogin; fi
if [ -f $HOME/.zlogout ]; then cat $HOME/.zlogout >> $(pwd)/zsh/.zlogout; fi

git clone https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

source ${ZDOTDIR:-~}/.zshrc

# Setup asdf for managing different versions of nodejs

echo "Setting up asdf"
echo "See https://asdf-vm.com/guide/getting-started.html for latest instructions"
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
source ${ZDOTDIR:-~}/.zshrc

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
just node-install

# Setup pyenv for managing different versions of python

echo "Setting up pyenv"
echo "See https://github.com/pyenv/pyenv for latest instructions"

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ${ZDOTDIR:-~}/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ${ZDOTDIR:-~}/.zshrc
echo 'eval "$(pyenv init -)"' >> ${ZDOTDIR:-~}/.zshrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ${ZDOTDIR:-~}/.zshrc 
source ${ZDOTDIR:-~}/.zshrc

pyenv install 3.11:latest
pyenv global $(pyenv latest 3.11)

# Link vim dot files

echo "Skipping vim setup in favor of nvim"

# echo "Setting up vim"

# ln -s "$(pwd)/vim" $HOME/.vim

# echo "Installing plugins"
# echo "Read more on plugin management here: https://github.com/junegunn/vim-plug/"
# vim +PlugInstall +qall

# Link nvim dotfiles

echo "Setting up nvim"
echo "See https://nvchad.com/docs/quickstart/install for latest instructions"

git clone https://github.com/NvChad/NvChad $(pwd)/nvchad --depth 1
ln -s "$(pwd)/nvim/nvchad" $HOME/.config/nvim

# TODO custom directory and custom overrides

# Link tmux dot files

echo "Setting up tmux"
echo "Install plugins via \`prefix\` + \`I\` with tmux running."
echo "Read more here: https://github.com/tmux-plugins/tpm"

ln -s "$(pwd)/tmux" $HOME/.config/tmux
git clone https://github.com/tmux-plugins/tpm $(pwd)/tmux/plugins/tpm

# Setup vscode cli
echo "Setting up vscode cli"
echo "Read more here: https://code.visualstudio.com/docs/setup/mac"

cat << EOF >> $(pwd)/zsh/.zprofile
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF

# Starship
echo "Setting up startship"
echo "Read more here: https://starship.rs/guide"

ln -s "$(pwd)/starship.toml" $HOME/.config/starship.toml
echo 'eval "$(starship init zsh)"' >> ${ZDOTDIR:-~}/.zshrc

# reload shell since path was updated
exec "$SHELL"
