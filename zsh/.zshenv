#
# Defines environment variables.
#

export NVIM_TUI_ENABLE_TRUE_COLOR=1
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1
export VISUAL=nvim
export EDITOR=nvim

# rust stuff
export RUST_SRC_PATH=/home/tronje/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

# go
export GOPATH=/home/tronje/misc/go

# node
export npm_config_prefix=/home/tronje/.node_modules

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
