#!/bin/zsh

xcode-select --install
brew tap homebrew/cask-fonts
brew bundle --file=Brewfile --no-lock --no-upgrade
git submodule update --init

# Setup zsh

echo "Setting up zsh"

# Read more on startup files here: https://zsh.sourceforge.io/Intro/intro_3.html
ln -s "$(pwd)/.zsh" $HOME/.zsh
echo "export ZDOTDIR=$HOME/.zsh" >> $HOME/.zshenv

# copy any existing files
cat $HOME/.zshenv >> $(pwd)/.zsh/.zshenv
if [ -f $HOME/.zprofile ]; then cat $HOME/.zprofile >> $(pwd)/.zsh/.zprofile; fi
if [ -f $HOME/.zlogin ]; then cat $HOME/.zlogin >> $(pwd)/.zsh/.zlogin; fi
if [ -f $HOME/.zlogout ]; then cat $HOME/.zlogout >> $(pwd)/.zsh/.zlogout; fi

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

source ${ZDOTDIR:-~}/.zshrc

# Setup asdf for managing different versions of nodejs

echo "Setting up asdf, see https://asdf-vm.com/guide/getting-started.html for latest instructions"
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc 
source ${ZDOTDIR:-~}/.zshrc

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
just node-install

# Setup pyenv for managing different versions of python

echo "Setting up pyenv, see https://github.com/pyenv/pyenv for latest instructions"

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ${ZDOTDIR:-~}/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ${ZDOTDIR:-~}/.zshrc
echo 'eval "$(pyenv init -)"' >> ${ZDOTDIR:-~}/.zshrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ${ZDOTDIR:-~}/.zshrc
source ${ZDOTDIR:-~}/.zshrc

just pyenv-install

# Link vim dot files

echo "Setting up vim"

ln -s "$(pwd)/.vim" $HOME/.vim
ln -s "$(pwd)/.vim/.vimrc" $HOME/.vimrc
just vim-plugin-install
echo "Read more on plugin management here: https://github.com/junegunn/vim-plug/"

# Link nvim dotfiles

ln -s "$(pwd)/nvim" $HOME/.config/nvim
ln -s "$(pwd)/.vim/.vimrc" "$(pwd)/nvim/init.vim"
mkdir $HOME/.local/share/nvim/site/
ln -s "$(pwd)/.vim/autoload" $HOME/.local/share/nvim/site/autoload
just nvim-plugin-install

# Link tmux dot files

echo "Setting up tmux"

ln -s "$(pwd)/.tmux" $HOME/.tmux
ln -s "$(pwd)/.tmux/.tmux.conf" $HOME/.tmux.conf
echo "Install plugins via \`prefix\` + \`I\` with tmux running."
echo "Read more here: https://github.com/tmux-plugins/tpm"

# Setup vscode cli
cat << EOF >> $(pwd)/.zsh/.zprofile
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF
echo "Read more here: https://code.visualstudio.com/docs/setup/mac"

# Starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=$HOME/.dots/starship/config.toml
starship preset nerd-font-symbols >> $(pwd)/starship/config.toml

# reload shell since path was updated
exec "$SHELL"
