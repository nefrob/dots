# VIM settings

### Setup

- Environment:

  ```
  cd ~
  git clone https://github.com/nefrob/vim.git ~/.vim
  ln -s ~/.vim/.vimrc ~/.vimrc
  cd ~/.vim
  git submodule update --init
  ```

- Adding new submodules:

  ```
  cd bundle
  git submodule add http://github.com/username/repo.git
  ```

- Updating submodules:

  ```
  git submodule foreach git pull origin master
  ```

For further info see [git submodules and pathogen](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/).