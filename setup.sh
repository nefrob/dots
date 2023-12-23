#!/bin/zsh

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
git clone https://github.com/ikhomutov/zsh-django \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-django

source ${ZDOTDIR:-~}/.zshrc

# Git
# Helix
echo "Setting up git"
ln -s "$(pwd)/git" $HOME/.config/git


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

if ! type -f pyenv >/dev/null; then
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ${ZDOTDIR:-~}/.zshrc
    echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ${ZDOTDIR:-~}/.zshrc
    echo 'eval "$(pyenv init -)"' >> ${ZDOTDIR:-~}/.zshrc
    source ${ZDOTDIR:-~}/.zshrc
fi

if ! type -f pyenv-virtualenv >/dev/null; then
    echo 'eval "$(pyenv virtualenv-init -)"' >> ${ZDOTDIR:-~}/.zshrc 
    source ${ZDOTDIR:-~}/.zshrc
fi

pyenv install 3.12:latest
pyenv global $(pyenv latest 3.12)

# Link vim dot files

echo "Skipping vim setup in favor of nvim"

# echo "Setting up vim"

# ln -s "$(pwd)/vim" $HOME/.vim
# ln -s "$(pwd)/vim/.vimrc" $HOME/.vimrc

# echo "Installing plugins"
# echo "Read more on plugin management here: https://github.com/junegunn/vim-plug/"
# vim +PlugInstall +qall

# Link nvim dotfiles

echo "Setting up nvim"
echo "See https://www.lazyvim.org/ for latest instructions"
ln -s "$(pwd)/nvim" $HOME/.config/nvim

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

if ! type -f starship >/dev/null; then
    ln -s "$(pwd)/starship.toml" $HOME/.config/starship.toml
    echo 'eval "$(starship init zsh)"' >> ${ZDOTDIR:-~}/.zshrc
    source ${ZDOTDIR:-~}/.zshrc
fi

# Zellij
echo "Setting up zellij"
echo "Read more here: https://zellij.dev/documentation/introduction.html"

if ! type -f starship >/dev/null; then
    ln -s "$(pwd)/zellij" $HOME/.config/zellij
    echo 'eval "$(zellij setup --generate-auto-start zsh)"' >> ${ZDOTDIR:-~}/.zshrc
    source ${ZDOTDIR:-~}/.zshrc
fi

# Helix
# echo "Setting up helix"
# echo "Read more here: https://docs.helix-editor.com/install.html"

# if ! type -f hx >/dev/null; then
#     ln -s "$(pwd)/helix" $HOME/.config/helix
#     source ${ZDOTDIR:-~}/.zshrc
# fi

# reload shell since path was updated
exec "$SHELL"
