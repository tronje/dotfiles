#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

source /usr/share/autojump/autojump.zsh
source /home/tronje/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/tronje/.alias.sh
# *somewhere* there;s an annoying alias on rm
unalias rm

autoload -U colors && colors

setopt HIST_IGNORE_DUPS

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
#eval $(dircolors ~/.dircolors.ansi-universal)

# handy function to display all 256 color codes
# nice for customizing one's prompt
function spectrum_ls() {
    for code in {000..255}; do
        print -P -- "$code: %F{$code}Lorem ipsum dolor sit amet%f"
    done
}
