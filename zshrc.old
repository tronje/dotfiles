#
# ~/.zshrc
#

## In order to use this properly, you will need to install oh-my-zsh,
## which can be found here: https://github.com/robbyrussell/oh-my-zsh
## It is also available in the Arch User Repository as oh-my-zsh-git

# Path to your oh-my-zsh installation.
ZSH=/home/tronje/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# default was "robbyrussell"
ZSH_THEME="tronje"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git sudo zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source /usr/share/autojump/autojump.zsh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

## My changes
#autoload -U promptinit
#promptinit

# ignore duplicates in history
setopt HIST_IGNORE_DUPS

## Generated stuff with zsh-newuser-install

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tronje/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U zmv

## ALIASES
# global aliases:
## global aliases are weird, I don't use 'em

# non-global aliases:
alias ls='ls --group-directories-first --color=auto'
alias cp='cp -v'
alias sc='sudo systemctl'
alias pac='pacman'
alias spac='sudo pacman'
alias svim='sudo vim'
alias clip='xclip -selection clipboard'
alias gls='git status'
alias wifi='sudo systemctl restart netctl-auto@wlp3s0'
alias graka='PRIMUS_UPLOAD=0 vblank_mode=0 primusrun'
alias valmem='valgrind --tool=memcheck'
alias valcache='valgrind --tool=cachegrind'
alias gpic='gpicview'
alias clippy='cowsay -f clippy'

alias mybar='bar -p -B "#E62A2A2A" -f "-xos4-terminus-medium-r-normal--12-120-72-72-c-60-iso10646-1,-misc-stlarch-medium-r-normal--10-100-75-75-c-80-iso10646-1"'

alias piratevpn='sudo openvpn /etc/openvpn/Privacy-Netherlands.ovpn'

# I don't have wine anymore...
#alias battlenet='PRIMUS_UPLOAD=0 vblank_mode=1 primusrun setarch i386 -3 -L -B -R wine $HOME/.wine/drive_c/Program\ Files\ \(x86\)/Battle.net/Battle.net\ Launcher.exe'

#alias battlenet='setarch i386 -3 -L -B -R optirun -b primus wine .wine/drive_c/Program\ Files/Battle.net/Battle.net\ Launcher.exe'

#alias winesteam='PRIMUS_UPLOAD=0 vblank_mode=0 primusrun wine $HOME/.wine/drive_c/Program\ Files/Steam/Steam.exe'

#alias winesteam='optirun -b primus wine .wine/drive_c/Program\ Files/Steam/Steam.exe'

function cpdf {pdflatex "$1".tex; evince "$1".pdf;}

function cs {cd "$1"; ls;}

#export -f cpdf

export BROWSER=chromium

# making man pages colorful
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
        LESS_TERMCAP_md=$'\E[01;38;5;74m' \
        LESS_TERMCAP_me=$'\E[0m' \
        LESS_TERMCAP_se=$'\E[0m' \
        LESS_TERMCAP_so=$'\E[38;5;246m' \
        LESS_TERMCAP_ue=$'\E[0m' \
        LESS_TERMCAP_us=$'\E[04;38;5;146m' \
        man "$@"
}

# need this for termite to have colored ls
eval $(dircolors ~/.dircolors)
