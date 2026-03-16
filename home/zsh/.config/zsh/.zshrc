# Read more on startup files here: https://zsh.sourceforge.io/Intro/intro_3.html

source "$ZDOTDIR/oh-my-zsh.zsh"

if hash code 2>/dev/null; then
  export EDITOR="code --wait"
elif hash nvim 2>/dev/null; then
  export EDITOR=nvim
elif hash vim 2>/dev/null; then
  export EDITOR=vim
else
  export EDITOR=vi
fi

export USE_EDITOR="$EDITOR"
export VISUAL="$EDITOR"

alias sz="source ${ZDOTDIR:-$HOME}/.zshrc"
alias rm=trash
alias v=nvim
alias j=just
alias k=kubectl
alias activate="source venv/bin/activate"
alias personal="session personal"
alias xhost="/usr/X11/bin/xhost"
alias dots="cd ~/dots"

function session {
  if [[ $ZELLIJ_SESSION_NAME != $1 ]]; then
    zellij a $1
  fi
}

if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
  # > What you want to disable here <
fi

if hash starship 2>/dev/null; then
    eval "$(starship init zsh)"
fi

if hash direnv 2>/dev/null; then
    eval "$(direnv hook zsh)"
fi

if hash zellij 2>/dev/null; then
    # eval "$(zellij setup --generate-auto-start zsh)"
fi

if hash thefuck 2>/dev/null; then
    # eval $(thefuck --alias fx)
fi

if hash gt 2>/dev/null; then
    #compdef gt
    ###-begin-gt-completions-###
    #
    # yargs command completion script
    #
    # Installation: gt completion >> ~/.zshrc
    #    or gt completion >> ~/.zprofile on OSX.
    #
    _gt_yargs_completions()
    {
      local reply
      local si=$IFS
      IFS=$'
    ' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" gt --get-yargs-completions "${words[@]}"))
      IFS=$si
      _describe 'values' reply
    }
    compdef _gt_yargs_completions gt
    ###-end-gt-completions-###
fi

if hash mise 2>/dev/null; then
    eval "$(mise activate zsh)"
fi

if [[ -n $GHOSTTY_RESOURCES_DIR ]]; then
  source "$GHOSTTY_RESOURCES_DIR"/shell-integration/zsh/ghostty-integration
fi

[ -f ${ZDOTDIR:-~}/.fzf.zsh ] && source ${ZDOTDIR:-~}/.fzf.zsh
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

# Auto appended values

export PATH="$PATH:/Users/robertneff/.local/bin"
