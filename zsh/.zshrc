# Fast path: bail if non-interactive
[[ -o interactive ]] || return
# Load modular pieces in a clear order
for f in "$HOME/.config/zsh/"{env.zsh,path.zsh,options.zsh,plugins.zsh,aliases.zsh,keybinds.zsh} ; do
  [[ -r "$f" ]] && source "$f"
done

# Functions directory (autoload pattern)
fpath=("$HOME/.config/zsh/functions" $fpath)
autoload -Uz prev 2>/dev/null

# Post-initialisation (things that must run last)
[[ -r "$HOME/.config/zsh/post.zsh" ]] && source "$HOME/.config/zsh/post.zsh"

DISABLE_AUTO_TITLE="true"
