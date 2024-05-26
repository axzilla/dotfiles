export PATH="/opt/homebrew/bin:$PATH"

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin

export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# Neovim Switcher
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"
function nvims() {
  items=("default" "AstroNvim" "LazyVim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
