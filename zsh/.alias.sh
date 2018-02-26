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
_git_log_medium_format='%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'
_git_log_oneline_format='%C(green)%h%C(reset) %s%C(red)%d%C(reset)%n'
alias g='git'
alias gco='git checkout'
alias gls='git status'
alias gl='git log --topo-order --stat --pretty=format:"${_git_log_medium_format}"'
alias glg='git log --topo-order --all --graph --pretty=format:"${_git_log_oneline_format}"'
alias glv='git log | nvim -R -'

# cargo
alias clippy='rustup run nightly cargo clippy'
alias c='cargo'

# misc
alias py='python'
alias weather='curl -s wttr.in/Hamburg'
