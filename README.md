# dots

<!-- See also: https://towardsdatascience.com/the-ultimate-guide-to-your-terminal-makeover-e11f9b87ac99 -->

Personal dotfiles managed with [stow](https://www.gnu.org/software/stow/), [mise](https://mise.jdx.dev/), and [Homebrew](https://brew.sh/).

## Fresh install

**Step 1** — clone and run setup:

```zsh
git clone https://github.com/nefrob/dots ~/dots
cd ~/dots
./setup.sh
```

See also the example [tests](tests) for simple setup options.

**Step 2** — open a new terminal, then install language runtimes and tools:

```zsh
mise install
```

## What's managed where

| Tool | Manages |
|------|---------|
| Homebrew (`packages/Brewfile`) | System tools, GUI apps, fonts |
| mise (`home/mise/.config/mise/config.toml`) | Language runtimes, versioned CLI tools |
| stow (`home/`) | Dotfile symlinks |

## Notes

Starship:

- Make sure you are using a power line enabled font in your terminal (preferably nerd-font patched for additional glyphs)

Additional commands:

- See [justfile](./justfile) for other useful commands.
