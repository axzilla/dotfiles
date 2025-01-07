# Paths
export PATH="/opt/homebrew/bin:$PATH"
export PATH=$PATH:~/go/bin
export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

# Prompt - <PROMPT_SUBST> allowa commands in prompt
setopt PROMPT_SUBST 
PROMPT=$'\n%~ %F{yellow}$(git branch 2>/dev/null | grep "*" | cut -d " " -f2)%f %F{red}❯%f '

# Plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
