# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# Disabled in favor of starship
# ZSH_THEME="kolo" 

# Other themes to consider
#jnrowe, kolo,  bira, agnoster, arrow

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=${ZDOTDIR:-~}/custom

# Plugins

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.

plugins=(
  asdf
  brew
  direnv
  docker
  git 
  # kubectl
  # macos
  pip
  # sudo
  # tmux
  yarn
  zsh-autosuggestions
  zsh-syntax-highlighting
  # zsh-django
)

# Have oh my zsh load brew auto completions
# It will auto run `compinit` in the source below
eval "$(brew shellenv)"
fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $fpath)

source $ZSH/oh-my-zsh.sh

# Configuration

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# export MYVIMRC=$HOME/.vim/.vimrc
# export VIMINIT='source $MYVIMRC'

# export TERM=screen-256color
# export TERM=tmux-256color

# Aliases

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias sz="source ${ZDOTDIR:-~}/.zshrc"
alias rm=trash
alias v=nvim
alias j=just
alias activate="source venv/bin/activate"
alias personal="session personal"

function session {
  if [[ $ZELLIJ_SESSION_NAME != $1 ]]; then
    zellij a $1
  fi
}

# Custom gitignored aliases go in ./custom/config.zsh

if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
  # > What you want to disable here <
fi

source $ZSH/oh-my-zsh.sh

# Auto appended values

# export VIRTUAL_ENV_DISABLE_PROMPT=1

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# kubernetes
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

# rust
export PATH="$PATH:$HOME/.cargo/bin"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

export PYENV_VIRTUALENV_DISABLE_PROMPT=1

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# starship
eval "$(starship init zsh)"

# direnv
eval "$(direnv hook zsh)"

# xhost 
alias xhost="/usr/X11/bin/xhost"

# zellij
# eval "$(zellij setup --generate-auto-start zsh)"

# eval $(thefuck --alias fx)
