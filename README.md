# Dot file configurations

## Setup

On linux of WSL:
 - Install `zsh` per `oh-my-zsh` [instructions](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH).
 - Install `oh-my-zsh` per [GitHub page](https://github.com/ohmyzsh/ohmyzsh).

- Clone this repository:

  ```
  git clone https://github.com/nefrob/dots.git ~/.dots
  cd dots
  git submodule update --init

  ln -s ~/.dots/.zshrc ~/.zshrc

  ln -s ~/.dots/.vim ~/.vim
  ln -s ~/.dots/.vim/.vimrc ~/.vimrc
  vi +PlugInstall +qall

  ln -s ~/.dots/.tmux ~/.tmux
  ln -s ~/.dots/.tmux/.tmux.conf ~/.tmux.conf
  ```
- Install `tpm` plugins via `<C-a>I` with `tmux` running.

- Make sure you are using a power line enabled font, ex. [Cascadia Code PL](https://github.com/microsoft/cascadia-code/releases).

-  To update `tpm` do:
    ```
    git submodule foreach git pull origin master
    ```

- Further info on [vim-plug](https://github.com/junegunn/vim-plug/).

- Further info on [tpm](https://github.com/tmux-plugins/tpm). 
