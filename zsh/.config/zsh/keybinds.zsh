# Arrow-up/down search
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Home/End + Ctrl-A/E
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# Ctrl + arrows (word jumps)
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Reverse menu complete + delete
zstyle ':completion:*:*:*:*:*' menu select
bindkey "^[[Z" reverse-menu-complete
bindkey "^[[3~" delete-char

# fzf widget (Ctrl-Space)
bindkey "^@" fzf-file-widget
