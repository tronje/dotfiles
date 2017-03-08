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
source /home/tronje/.alias.sh

fpath+=/home/tronje/.zfunc

# somewhere there's an annoying alias on rm
unalias rm

export MAKEFLAGS="-j4"
export LESS="-RI"

autoload -U colors && colors

setopt HIST_IGNORE_DUPS

eval $(dircolors ~/.dircolors)

function spectrum_ls() {
    for code in {000..255}; do
        print -P -- "$code: %F{$code}Lorem ipsum dolor sit amet%f"
    done
}

autoload -Uz promptinit
promptinit
prompt skwp
