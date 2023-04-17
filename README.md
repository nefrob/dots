# Dot File Configurations

## Setup

On Mac:

- If `zsh` is not your default shell, install `zsh` per: https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH.
- Install `oh-my-zsh`: `https://github.com/ohmyzsh/ohmyzsh.
- Install `brew`: https://brew.sh/.
- Run the setup script:

    ```bash
    chmod +x setup.sh
    ./setup.sh
    ```

### Post setup notes

Tmux:

- Install `tpm` plugins via `prefix` + `I` with `tmux` running.

Starship:

- Make sure you are using a power line enabled font (preferably nerd-font patched for additional glyphs)

Additional commands:

- See [justfile](./justfile) for other useful commands.

### Additional Reading

Nvim setup

- https://nvchad.com/docs/quickstart/install

Package management

- https://github.com/junegunn/vim-plug/

- https://github.com/tmux-plugins/tpm

- https://github.com/neoclide/coc.nvim
