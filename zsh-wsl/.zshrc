OS="$(uname -s)"

# Amazon Q pre block on macOS
if [[ "$OS" == "Darwin" ]]; then
  [[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
fi

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
# macOS setup
if [ "$OS" = "Darwin" ]; then
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

# Linux setup
if [ "$OS" = "Linux" ]; then
  FNM_PATH="$HOME/.local/share/fnm"
  if [ -d "$FNM_PATH" ]; then
    export PATH="$FNM_PATH:$PATH"
    eval "`fnm env`"
  fi
fi

# Fix CTRL+Arrow on WSL
### ctrl+arrows
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
# urxvt
bindkey "\eOc" forward-word
bindkey "\eOd" backward-word

### ctrl+delete
bindkey "\e[3;5~" kill-word
# urxvt
bindkey "\e[3^" kill-word

### ctrl+backspace
bindkey '^H' backward-kill-word

### ctrl+shift+delete
bindkey "\e[3;6~" kill-line
# urxvt
bindkey "\e[3@" kill-line

# Amazon Q post 
if [[ "$OS" == "Darwin" ]]; then
  [[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
fi

# fnm
FNM_PATH="/Users/gmallios/Library/Application Support/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/Users/gmallios/Library/Application Support/fnm:$PATH"
  eval "`fnm env`"
fi
