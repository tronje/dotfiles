# gnutils and the like
alias ls='ls --group-directories-first --color=auto'
alias cp='cp -v'
alias clip='xclip -selection clipboard'
alias sido='sudo'
alias df='sudo btrfs filesystem usage -h /'

# systemd
alias sc='sudo systemctl'
alias scu='systemctl --user'
alias wifi='sudo systemctl restart netctl-auto@wlp4s0'
alias nspawn='sudo systemd-nspawn'

# pacman
alias pac='pacman'
alias spac='sudo pacman'

# neovim
alias vi='nvim'
alias vim='nvim'

# git aliases
alias g='git'
alias gls='git status'
alias gl='git log --topo-order --stat --pretty=format:"${_git_log_medium_format}"'

# cargo
alias clippy='rustup run nightly cargo clippy'
alias c='cargo'

# misc
alias weather='curl -s wttr.in/Hamburg'
