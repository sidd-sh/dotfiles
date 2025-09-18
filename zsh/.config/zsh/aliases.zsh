alias gen-payload="python3 /opt/gen-payload/main.py"
alias tunip='ip a sh dev tun0 2>/dev/null | rg -e "(10[\\.\\d]+)" -o | head -n1'
alias vim="nvim"
alias pyt="ptipython"
alias ls="exa"
alias cat="batcat --paging=never -p"
alias manspider='docker run --rm -v ./manspider:/root/.manspider blacklanternsecurity/manspider'
