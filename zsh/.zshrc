# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Fast path: bail if non-interactive
# Use cursor if not
[[ -o interactive ]] && printf '\e[6 q'
# Load modular pieces in a clear order
[[ -o interactive ]] || return
for f in "$HOME/.config/zsh/"{env.zsh,path.zsh,options.zsh,plugins.zsh,aliases.zsh,keybinds.zsh} ; do
  [[ -r "$f" ]] && source "$f"
done

# Functions directory (autoload pattern)
fpath=("$HOME/.config/zsh/functions" $fpath)
autoload -Uz prev 2>/dev/null

# Post-initialisation (things that must run last)
[[ -r "$HOME/.config/zsh/post.zsh" ]] && source "$HOME/.config/zsh/post.zsh"

DISABLE_AUTO_TITLE="true"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
