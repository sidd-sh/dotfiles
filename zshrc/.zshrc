# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(zsh-autosuggestions fzf)
export FZF_BASE=/usr/bin/fzf

source $ZSH/oh-my-zsh.sh

# python cli
export PATH="$PATH:/usr/sbin:/usr/local/sbin:$HOME/.venv/bin:$HOME/.local/bin"

# colorize "kubectl diff" command outputs
export KUBECTL_EXTERNAL_DIFF="colordiff -N -u"

# specify characters considered as word boundaries for command line navigation
export WORDCHARS=""

# set the location and filename of the history file
export HISTFILE="$HOME/.zsh_history"

# set the maximum number of lines to be saved in the history file
export HISTSIZE="100000"
export SAVEHIST="$HISTSIZE"

# fzf parameters used in all widgets - configure layout and wrapped the preview results (useful in large command rendering)
export FZF_DEFAULT_OPTS="--height 100% --layout reverse --preview-window=wrap"

# CTRL + R: put the selected history command in the preview window - "{}" will be replaced by item selected in fzf execution runtime
export FZF_CTRL_R_OPTS="--preview 'echo {}'"

# CTRL + T: set "fd-find" as search engine instead of "find" and exclude .git for the results
export FZF_CTRL_T_COMMAND="fd --exclude .git --ignore-file $HOME/.oh-my-zsh/custom/.fd-fzf-ignore"

# CTRL + T: put the file content if item select is a file, or put tree command output if item selected is directory
export FZF_CTRL_T_OPTS="--preview '[ -d {} ] && tree -C {} || bat --color=always --style=numbers {}'"

# add Go binaries to the PATH
export PATH="$PATH:$HOME/go/bin"

# User configuration
alias gen-payload="python3 /opt/gen-payload/main.py"
alias tunip="echo $(ip a sh dev tun0 2>/dev/null| rg -e "(10[\.\d]+)" -o | head -n1)"
alias vim="nvim"
alias pyt="ptipython"
alias ls="exa"
alias cat="batcat --paging=never -p"
alias manspider="docker run --rm -v ./manspider:/root/.manspider blacklanternsecurity/manspider"
#eval `ssh-agent -s` > /dev/null
# search history using Up and Down keys
# >>> up arrow | down arrow
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# jump to the start and end of the command line
# >>> CTRL + A | CTRL + E
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
# >>> Home | End
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
# navigate words using Ctrl + arrow keys
# >>> CRTL + right arrow | CRTL + left arrow
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# navigate menu for command output
zstyle ':completion:*:*:*:*:*' menu select
bindkey '^[[Z' reverse-menu-complete
# delete characters using the "delete" key
bindkey "^[[3~" delete-char

# fzf alias: CTRL + SPACE (gadget parameters configured in the FZF_CTRL_T_COMMAND environment variable)
bindkey "^@" fzf-file-widget

# load zsh-autosuggestions
source "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# load zsh-syntax-highlighting
source "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# load fzf keybindings and completions
eval "$(fzf --zsh)"
# use the ZLE (zsh line editor) in emacs mode. Useful to move the cursor in large commands
bindkey -e 

# enable comments "#" expressions in the prompt shell
setopt INTERACTIVE_COMMENTS

# append new history entries to the history file
setopt APPEND_HISTORY

# save each command to the history file as soon as it is executed
setopt INC_APPEND_HISTORY

# ignore recording duplicate consecutive commands in the history
setopt HIST_IGNORE_DUPS

# ignore commands that start with a space in the history
setopt HIST_IGNORE_SPACE

# ignore recording duplicate consecutive commands in the history
setopt HIST_IGNORE_DUPS

# Add prev function for pet
function prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}

eval "$(zoxide init zsh)"
. "$HOME/.cargo/env"
export PYTHONWARNINGS="ignore"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
