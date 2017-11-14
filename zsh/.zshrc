export NVIM_TUI_ENABLE_TRUE_COLOR=1
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Customize to your needs...

# enables Vi mode when hitting ESC
bindkey -v

# autojump allows jumping to directories with 'j'
source /usr/share/autojump/autojump.zsh

# this enables syntax highlighting, as the name suggests
source .zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# .alias.sh just contains some aliases, nothing fancy
source /home/tronje/.alias.sh

# add dir with some completions to fpath
fpath+=/home/tronje/.zfunc


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



