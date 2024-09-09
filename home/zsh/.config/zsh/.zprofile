export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:$HOME/.cargo/bin"

if -f type homebrew/bin/brew; then
    eval "$(homebrew/bin/brew shellenv)"
fi

# Auto appended values
