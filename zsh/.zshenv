pathmunge() { [[ ":$PATH:" != *":$1:"* ]] && PATH="$1:$PATH"; }

pathmunge "$HOME/.local/bin"
pathmunge "$HOME/.venv/bin"
pathmunge "/usr/local/sbin"
pathmunge "/usr/sbin"
pathmunge "$HOME/go/bin"
[[ -d $PYENV_ROOT/bin ]] && pathmunge "$PYENV_ROOT/bin"

export PATH
export LANG=${LANG:-en_AU.UTF-8}
export EDITOR=${EDITOR:-nvim}
export PYTHONWARNINGS="ignore"
export PYENV_ROOT="$HOME/.pyenv"
