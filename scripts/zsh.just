[group('zsh')]
zsh-setup:
    #!/usr/bin/env zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    mkdir -p "$(pwd)/zsh/custom"
    touch "$(pwd)/zsh/custom/config.zsh"
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
    git clone https://github.com/ikhomutov/zsh-django \
        "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-django"
    source "${ZDOTDIR:-~}/.zshrc"
