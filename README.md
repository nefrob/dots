# Dot File Configurations

## Setup

On Mac:

- If `zsh` is not your default shell, install `zsh` per `oh-my-zsh` [instructions](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH).
- Install `oh-my-zsh` per [instructions](https://github.com/ohmyzsh/ohmyzsh).
- Install `git` and `tmux` if not already.
- Install `brew` per  [instructions](https://brew.sh/).
- Run the setup script:

    ```bash
    chmod +x setup.sh
    ./setup.sh
    ```

Post setup notes:

- Install `tpm` plugins via `prefix` + `I` with `tmux` running.
- Make sure you are using a power line enabled font (preferably nerd-font patched for additional glyphs) ex. [CaskaydiaCode](https://github.com/ryanoasis/nerd-fonts/releases/).
- See [justfile](./justfile) for other useful commands.
- Install `coc` extensions via `:CocInstall coc-extension-name` in `vim`.

### Additional Reading

- Further info on [vim-plug](https://github.com/junegunn/vim-plug/).

- Further info on [tpm](https://github.com/tmux-plugins/tpm).
