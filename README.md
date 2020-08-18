# Dot file configurations

## Setup

On linux of WSL:
 - Install `zsh` per `oh-my-zsh` [instructions](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH).
 - Install `oh-my-zsh` per [GitHub page](https://github.com/ohmyzsh/ohmyzsh).

- Clone this repository:

  ```
  git clone https://github.com/nefrob/dots.git
  cd dots
  git submodule update --init

  ln -s .vim/.vimrc ~/.vimrc
  ln -s .vim ~/.vim
  vi +PlugInstall +qall

  ln -s .tmux/.tmux.conf ~/.tmux.conf
  ln -s .tmux ~/.tmux
  ```
- Install `tpm` plugins via `<C-a>I` with `tmux` running.

- Make sure you are using a power line enabled font, ex [Cascadia Code PL](https://github.com/microsoft/cascadia-code/releases).

- For further info on [vim-plug](https://github.com/junegunn/vim-plug/).

- For further info on [tpm](https://github.com/tmux-plugins/tpm). To update `tpm` do:
  ```
  git submodule foreach git pull origin master
  ```
