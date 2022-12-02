#
# Defines environment variables.
#

export NVIM_TUI_ENABLE_TRUE_COLOR=1
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1
export VISUAL=nvim
export EDITOR=nvim
export PAGER=less
export BROWSER=firefox
export LESS='-i -M -R'
export BAT_THEME=gruvbox

# rust stuff
export RUST_SRC_PATH=/home/tronje/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

# go
export GOPATH=/home/tronje/misc/go

# node
export npm_config_prefix=/home/tronje/.node_modules

# android
export ANDROID_HOME=/home/tronje/misc/android-home

# make xz use all available cores for parallelization
export XZ_DEFAULTS=-T0

# SSH agent socket location
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
