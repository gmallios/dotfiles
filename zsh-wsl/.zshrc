# Neovim
export PATH="$PATH:/opt/nvim-linux64/bin"

# Stip Windows PATH which causes issues with corepack
export PATH=$(echo "$PATH" | sed -e 's/:\/mnt[^:]*//g')

# Rust
. "$HOME/.cargo/env"

# ls colour
alias ls="ls --color=auto"

# Configuration
alias edit-starship="nano ~/.config/starship.toml"
alias edit-zsh="nano ~/.zshrc"
alias reload-zsh="source ~/.zshrc"

# Starship
eval "$(starship init zsh)"

# Fnm
FNM_PATH="/home/gmallios/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/gmallios/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
