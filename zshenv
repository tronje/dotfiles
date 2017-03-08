#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

export NVIM_TUI_ENABLE_TRUE_COLOR=1
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1
export VISUAL=nvim
export EDITOR=nvim

# java bullshit
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/

# android bullshit
export ANDROID_SDK=/opt/android-sdk
export ANDROID_NDK=${HOME}/bin/android-ndk-r9c
export ANDROID_SWT=/usr/share/java
export ANDROID_HOME=${ANDROID_SDK}
export PATH=$PATH:$ANDROID_SDK/tools:$ANDROID_NDK

# cargo stuff
export PATH=$PATH:/home/tronje/.cargo/bin
export RUST_SRC_PATH=/home/tronje/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
