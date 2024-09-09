# Install formulae from Brewfile
[group('brew')]
brew-install +ARGS="--no-upgrade":
    brew tap homebrew/cask-fonts
    brew bundle --file=packages/Brewfile --no-lock {{ ARGS }}

# Upgrade brew, dependencies and rehsim
[group('brew')]
brew-upgrade:
    brew update
    brew upgrade
    pyenv rehash
    asdf reshim
