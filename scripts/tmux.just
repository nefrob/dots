# Install tmux plugin manager
[group('tmux')]
tmux-install-tpm:
    git clone https://github.com/tmux-plugins/tpm "$(pwd)/home/tmux/plugins/tpm"

# Update tmux package manager
[group('tmux')]
tmux-update-tpm:
    git submodule foreach git pull origin master

# Install tmux plugins
[group('tmux')]
tmux-install-plugins:
    tmux source "$(pwd)/home/tmux/.tmux.conf"
    "$(pwd)/home/tmux/plugins/tpm/bin/install_plugins"

# Update tmux plugins
[group('tmux')]
tmux-update-plugins:
    "$(pwd)/home/tmux/plugins/tpm/bin/update_plugins" all
