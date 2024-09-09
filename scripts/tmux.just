# Install tmux plugin manager
[group('tmux')]
tmux-install-tpm:
    git clone https://github.com/tmux-plugins/tpm "$(pwd)/home/tmux/plugins/tpm"

# Update tmux package manager
[group('tmux')]
tmux-update-tpm:
    git submodule foreach git pull origin master
