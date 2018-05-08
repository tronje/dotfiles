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
I most likely forgot a whole bunch of stuff here. You will notice if something is needed but hasn't been installed...

### i3
* [i3blocks](https://github.com/vivien/i3blocks)
* [kitty](https://github.com/kovidgoyal/kitty)
* [rofi](https://github.com/DaveDavenport/rofi)
* ponymix
* compton

### nvim
* neovim, not vim
* python-neovim
* python2-neovim
* [vim-plug](https://github.com/junegunn/vim-plug)
* [ripgrep](https://github.com/BurntSushi/ripgrep)
* a [NERDFont](https://github.com/ryanoasis/nerd-fonts), I have ttf-nerd-fonts-symbols from the AUR
* rust-src (`rustup component add rust-src`)
* racer (`cargo install racer`)
* flake8

### systemd
* redshift-gtk
* [wallpaper-switcher](https://github.com/tronje/wallpaper-switcher)

### termite & kitty
* (the corresponding terminal of course)
* Fira Mono font

### zsh
* grml-zsh-config

### conky
* [this script](https://gist.github.com/tronje/21c4c1ecf7a9afb133f1814336ac3d48)
