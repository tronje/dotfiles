# dotfiles

My various config files.

## Installation

* Install GNU stow
* Install the configuration for any of the programs the directories are named after.

```bash
$ stow zsh
$ stow nvim
# ...
```

## Dependencies

A rough list of dependencies. These are hard to keep track of.

### sway
* sway
* swaybg
* swayidle
* swaylock
* waybar
* alacritty

### nvim
* neovim, not vim
* python-neovim
* [vim-plug](https://github.com/junegunn/vim-plug)

### alacritty
* (the corresponding terminal of course)
* Fira Mono Nerd font

### zsh
* grml-zsh-config
* starship

### starship
* [dir-prompt-helper](https://github.com/tronje/dir-prompt-helper)

### cargo
* the `mold` linker

### tmux
* Clone [tpm](https://github.com/tmux-plugins/tpm) to `.config/tmux/plugins/tpm`
