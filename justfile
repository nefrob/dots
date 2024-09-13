# Useful commands

import 'scripts/brew.just'
import 'scripts/env.just'
import 'scripts/vim.just'
import 'scripts/tmux.just'
import 'scripts/zsh.just'

@_default:
    just --list
