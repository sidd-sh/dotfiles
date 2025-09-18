pathmunge() { [[ ":$PATH:" != *":$1:"* ]] && PATH="$1:$PATH"; }

pathmunge "$HOME/.local/bin"
pathmunge "$HOME/.venv/bin"
pathmunge "/usr/local/sbin"
pathmunge "/usr/sbin"
pathmunge "$HOME/go/bin"
[[ -d $PYENV_ROOT/bin ]] && pathmunge "$PYENV_ROOT/bin"

export PATH


