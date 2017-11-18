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


## Prompt customization ##

# git status indicator
function git_info () {
	local inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
	if [ "$inside_git_repo" ]; then
        local branch="$(git rev-parse --abbrev-ref HEAD)"
		if [[ -n $(git status --short) ]]; then
			REPLY="[%F{yellow}${branch#\* }%f %F{red}!%f] "
		else
			REPLY="[%F{yellow}${branch#\* }%f] "
		fi
	else
		REPLY=''
	fi
}

# abbreviated path in prompt
# if $PWD is longer than 15 symbols, it's abbreviated with '...'
function abbr_path_prompt () {
  REPLY='%15<...<%~%<<%  '
}

function percent_char () {
	REPLY='% '
}

# add the git status and the abbreviated path funtions to grml_theme
grml_theme_add_token gitinfo -f git_info '%B' '%b'
grml_theme_add_token abbreviated-path -f abbr_path_prompt '%B' '%b'
# grml_theme_add_token percent -f percent_char

# and update the left-hand side of the prompt
zstyle ':prompt:grml:left:setup' items rc user at host abbreviated-path gitinfo percent


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
