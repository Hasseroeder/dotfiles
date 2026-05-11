alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias back='cd -'

if command -v eza >/dev/null 2>&1; then
  alias ls="eza -a --icons always --git"
  alias ll="eza -lah --icons always --git"
else
  alias ls="command ls -a"
  alias ll="command ls -lah"
fi

if command -v fastfetch >/dev/null 2>&1; then alias fetch='fastfetch'; fi

if command -v nvim >/dev/null 2>&1; then
  alias neovim="nvim"
  alias vim="nvim"
else 
  alias vim="vi"
fi

if command -v tree >/dev/null 2>&1; then alias tree='command tree -a'; fi
if command -v nudoku >/dev/null 2>&1; then alias sudoku='nudoku'; fi
if command -v batcat >/dev/null 2>&1; then alias bat='batcat'; fi
if command -v nethack-console >/dev/null 2>&1; then alias nethack='nethack-console'; fi

if [[ -f ~/Documents/cmdList.txt ]]; then
  alias cmdlist='nano ~/Documents/cmdList.txt'
fi
