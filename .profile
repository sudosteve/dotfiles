# Runs on login

# .local/bin/ added to path
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Default programs:
export EDITOR="nvim"
# export TERMINAL="urxvt"
export TERMINAL="alacritty"
export BROWSER="brave"
export READER="zathura"

# ~/ Clean-up:

# Define xdg base directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# python:
export PYTHONUSERBASE="$XDG_DATA_HOME/python"
export PATH="$PATH:$PYTHONUSERBASE/bin"

# config:
# export ALSA_CONFIG_PATH="$XDG_CONFIG_HOME/alsa/asoundrc"
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"
export ELM_HOME="$XDG_CONFIG_HOME/elm"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export SQLITE_HISTORY="$XDG_STATE_HOME/sqlite_history"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# cache:
export LESSHISTFILE="-"
export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME/nv"

# data:
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"

# export PATH="$PATH:$(du "$CARGO_HOME/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
# export PATH="$(du "$CARGO_HOME/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//'):$PATH"
export PATH="$PATH:$XDG_DATA_HOME/npm/bin:$CARGO_HOME/bin"

# runtime:
# Custom XAUTHORITY breaks ssh X11 forwarding
# export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
# export TMUX_TMPDIR="$XDG_RUNTIME_DIR"

# Start graphical server on tty1
[ "$(tty)" = "/dev/tty1" ] \
    && ! ps -e | grep -qw Xorg \
    && startx "$XDG_CONFIG_HOME/X11/xinitrc" \
    && ( [ ! -f /usr/bin/prime-switch ] || sudo /usr/bin/prime-switch ) \
    && logout


