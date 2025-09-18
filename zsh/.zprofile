# PATH / tools available to login shells (Terminal, TTY, etc.)
# Put heavyweight PATH logic here, not in .zshenv.
# Keep ordering deterministic; avoid duplicate $PATH edits later.
pathmunge() { [[ ":$PATH:" != *":$1:"* ]] && PATH="$1:$PATH"; }

pathmunge "$HOME/.local/bin"
pathmunge "$HOME/.venv/bin"
pathmunge "/usr/local/sbin"
pathmunge "/usr/sbin"
pathmunge "$HOME/go/bin"
[[ -d $PYENV_ROOT/bin ]] && pathmunge "$PYENV_ROOT/bin"

export PATH

# Agents or one-shot login init could live here (ssh-agent, gpg-agent, etc.)
