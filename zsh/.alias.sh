# misc
alias ls='ls --group-directories-first --color=auto'
alias cp='cp -v'
alias sc='sudo systemctl'
alias scu='systemctl --user'
alias pac='pacman'
alias spac='sudo pacman'
alias clip='xclip -selection clipboard'
alias wifi='sudo systemctl restart netctl-auto@wlp4s0'
alias vi='nvim'
alias vim='nvim'
alias sido='sudo'
alias df='sudo btrfs filesystem usage -h /'
alias weather='curl -s wttr.in/Hamburg'

# git aliases
alias g='git'
alias gls='git status'
alias gl='git log --topo-order --stat --pretty=format:"${_git_log_medium_format}"'

# cargo
alias clippy='rustup run nightly cargo clippy'
