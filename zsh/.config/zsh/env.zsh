export ZSH="$HOME/.oh-my-zsh"

# Tools/settings used interactively
export KUBECTL_EXTERNAL_DIFF="colordiff -N -u"
export WORDCHARS=""
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE

# fzf
export FZF_BASE=/usr/bin/fzf
export FZF_DEFAULT_OPTS="--height 100% --layout reverse --preview-window=wrap"
export FZF_CTRL_R_OPTS="--preview 'echo {}'"
export FZF_CTRL_T_COMMAND="fd --exclude .git --ignore-file $HOME/.oh-my-zsh/custom/.fd-fzf-ignore"
export FZF_CTRL_T_OPTS="--preview '[ -d {} ] && tree -C {} || batcat --color=always --style=numbers {}'"

# Cargo, zoxide, pyenv env hooks
[[ -r "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"
