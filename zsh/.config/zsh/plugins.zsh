# Oh My Zsh (let OMZ run compinit; don’t double-run it)
ZSH_THEME="robbyrussell"

# Let OMZ manage these plugins where possible; keep syntax-highlighting LAST.
plugins=(
  git
  fzf
  zsh-autosuggestions
  # zsh-syntax-highlighting    # we'll source manually at the very end in post.zsh
)

source "$ZSH/oh-my-zsh.sh"

# fzf keybindings/completions after OMZ so they overlay properly
eval "$(fzf --zsh)"

# zoxide & pyenv init after OMZ so keybinds are set
eval "$(zoxide init zsh)"
eval "$(pyenv init - zsh)"
