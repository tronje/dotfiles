export NVIM_TUI_ENABLE_TRUE_COLOR=1
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Customize to your needs...

# enables Vi mode when hitting ESC
bindkey -v

# zoxide allows jumping to directories with 'z'
eval "$(zoxide init zsh)"

# this enables syntax highlighting, as the name suggests
source /home/tronje/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# enable fzf keybindings
# ^T is quite useful, in particular
source /usr/share/fzf/key-bindings.zsh
export FZF_CTRL_T_COMMAND="fd -H" # use fd with hidden files for this command

# .alias.sh just contains some aliases, nothing fancy
source /home/tronje/.alias.sh

# enable friendly newdir script
source /home/tronje/prj/newdir/newdir.sh


export MAKEFLAGS="-j16"
export LESS="-RI"

# history settings
export HISTFILE=/home/tronje/.zsh_history
export HISTSIZE=25000
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST


autoload -U colors && colors

eval $(dircolors ~/.dircolors)

function spectrum_ls () {
    for code in {000..255}; do
        print -P -- "$code: %F{$code}Lorem ipsum dolor sit amet%f"
    done
}

function glv () {
    git log $@ | nvim -R -
}

function reboot () {
    read "rebootanswer?Are you sure? (y/n) "
    if [[ $rebootanswer == 'y' ]]; then
        echo "Rebooting..."
        /bin/reboot
    else
        echo "Not rebooting."
    fi
}


function kapa () {
    if [ ! -d /nas/projects/9000-jusst-internal/02-project-management/resource-planning/`date +%Y` ]; then
        sudo mount -a
    fi

    if [ -z $1 ]; then
        evince /nas/projects/9000-jusst-internal/02-project-management/resource-planning/`date +%Y`/`date +%yW%V`-resource-planning.pdf
    else
        evince /nas/projects/9000-jusst-internal/02-project-management/resource-planning/`date +%Y`/`date +%yW$1`-resource-planning.pdf
    fi
}

## Prompt customization ##

# virtualenv info
function virtual_env_prompt () {
    REPLY=${VIRTUAL_ENV+${VIRTUAL_ENV:t} }
}

# disables prompt mangling in virtual_env/bin/activate
export VIRTUAL_ENV_DISABLE_PROMPT=1

# abbreviated path in prompt
# if $PWD is longer than 15 symbols, it's abbreviated with '...'
function abbr_path_prompt () {
  # REPLY='%15<...<%~%<<%  '
  REPLY="`dir-prompt-helper` "
}

# git status indicator
function git_info () {
    REPLY=`git-prompt-helper`
}

# number of suspended jobs
function delimiter_jobs () {
    if [[ -n $(jobs) ]]; then
        REPLY='%B%F{red}*%f%b'
    else
        REPLY=''
    fi
}

# add the custom tokens to the theme
grml_theme_add_token virtual_env -f virtual_env_prompt '' ''
grml_theme_add_token abbreviated-path -f abbr_path_prompt '%B' '%b'
grml_theme_add_token gitinfo -f git_info '%B' '%b'
grml_theme_add_token delimiter -f delimiter_jobs '' ''
grml_theme_add_token arrow '-> '

# and update the left-hand side of the prompt
zstyle ':prompt:grml:left:setup' items rc user at host virtual_env abbreviated-path gitinfo delimiter newline arrow


#
# Completion stuff, mostly stolen from
# https://github.com/sorin-ionescu/prezto/blob/master/modules/completion/init.zsh
#

setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END
setopt PATH_DIRS
setopt AUTO_MENU
setopt AUTO_LIST
setopt AUTO_PARAM_SLASH
setopt EXTENDED_GLOB
unsetopt MENU_COMPLETE
unsetopt FLOW_CONTROL

# Use caching to make completion for commands such as dpkg and apt usable.
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${ZDOTDIR:-$HOME}/.zcompcache"

# Case-insensitive (all), partial-word, and then substring completion.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
unsetopt CASE_GLOB

## changed completer settings
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' expand prefix suffix

# Group matches and describe
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Fuzzy match mistyped completions.
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Increase the number of errors based on the length of the typed word. But make
# sure to cap (at 7) the max-errors to avoid hanging.
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'
