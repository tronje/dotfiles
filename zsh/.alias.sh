# gnutils and the like
alias ls='ls --group-directories-first --color=auto'
alias cp='cp -v'
alias clip='xclip -selection clipboard'
alias sido='sudo'
alias df='btrfs filesystem usage -h /'
alias o='xdg-open'

# systemd
alias sc='sudo systemctl'
alias scu='systemctl --user'
alias wifi='sudo systemctl restart netctl-auto@wlp4s0'
alias nspawn='sudo systemd-nspawn'
alias mctl='machinectl'
alias smctl='sudo machinectl'

# pacman
alias pac='pacman'
alias spac='sudo pacman'

# neovim
alias vi='nvim'
alias vim='nvim'
alias gvi='nvim $(git status --porcelain | cut -s -f 2 -d M)'
alias svi='sudo -E nvim'
alias svim='sudo -E nvim'

# git aliases
alias g='git'
alias gls='git status'
alias groot='cd `git root`'

# cargo
alias clippy='rustup run nightly cargo clippy'

# misc
alias py='python'
alias weather='curl -s wttr.in/Hamburg'
alias icat='kitty icat --align=left'
alias ipython='ipython --no-confirm-exit'
alias ipy='ipython --no-confirm-exit'
alias cg='cargo'
