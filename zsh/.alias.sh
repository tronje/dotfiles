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

# helix
alias hx='helix'
alias vi='helix'
alias shx='sudo -E helix'
alias svi='sudo -E helix'

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
alias diff='diff --color'
alias o='xdg-open'
alias now='date +"%Y-%m-%d-%H%M%S"'
alias today='date +"%Y-%m-%d"'
alias scrot='grim -g "$(slurp)"'
alias jl='julia'
alias restart-waybar='killall -SIGUSR2 waybar'
