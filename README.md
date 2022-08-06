# Dot file configurations

https://brew.sh/
xcode-select --install
brew bundle --file=Brewfile --no-lock --no-upgrade


## Setup

On WSL (similar for linux):
 - Install `zsh` per `oh-my-zsh` [instructions](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH).
 - Install `oh-my-zsh` per [GitHub page](https://github.com/ohmyzsh/ohmyzsh).
 - Install `git`: `sudo apt install git`.
 - Install `vim`: `sudo apt install vim`.
 - Install `tmux`: `sudo apt install tmux`.
  

- Clone repo and link files:

  ```
  # Clone repos
  git clone https://github.com/nefrob/dots.git ~/.dots
  cd .dots
  git submodule update --init

  # Needed for Coc
  sudo apt update
  sudo apt install nodejs
  sudo apt install npm

  # Link config files to home directory
  ln -s ~/.dots/.zshrc ~/.zshrc

  ln -s ~/.dots/.vim ~/.vim
  ln -s ~/.dots/.vim/.vimrc ~/.vimrc
  vi +PlugInstall +qall

  ln -s ~/.dots/.tmux ~/.tmux
  ln -s ~/.dots/.tmux/.tmux.conf ~/.tmux.conf
  ```
- Install `tpm` plugins via `<C-a>I` with `tmux` running.

- Make sure you are using a power line enabled font (preferably nerd-font patched for additional glyphs) ex. [CaskaydiaCode](https://github.com/ryanoasis/nerd-fonts/releases/).

-  To update `tpm` do:
    ```
    git submodule foreach git pull origin master
    ```

- Install `coc` extensions via `:CocInstall coc-extension-name` in `vim`. 

  To use `coc-clangd` you need `clangd` in your path. If not present get via either:

  ```
  :CocCommand clangd.install
  ```

  or

  ```
  sudo apt-get install clangd
  ```

  To get `clangd` completion for project files do:

  ```
  cd build
  cmake .. -DCMAKE_EXPORT_COMPILE_COMMANDS=1
  ln -s project_path/build/compile_commands.json project_path/compile_commands.json
  ```

  See [here](https://clangd.llvm.org/installation.html#project-setup) for more info.

- Further info on [vim-plug](https://github.com/junegunn/vim-plug/).

- Further info on [tpm](https://github.com/tmux-plugins/tpm). 
