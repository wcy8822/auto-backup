export PATH="/usr/local/bin:$PATH"

# ---- pyenv ----
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Created by `pipx` on 2026-01-16 08:41:53
export PATH="$PATH:/Users/ixu/.local/bin"
export PIPX_DEFAULT_PYTHON="/Users/ixu/.pyenv/versions/3.12.8/bin/python"

# ---- fnm (Node.js version manager) ----
eval "$(fnm env --use-on-cd --shell zsh)"
alias obsidian-backup="/Users/ixu/Documents/obsidian/backup.sh"

# ---- NAS 同步快捷命令 ----
alias nas-sync='~/.config/nas-sync/nas-sync.sh'
alias nas-preview='~/.config/nas-sync/sync.sh preview'
alias nas-execute='~/.config/nas-sync/sync.sh execute'
alias nas-clean='~/.config/nas-sync/sync.sh clean'
alias nas-status='~/.config/nas-sync/sync.sh status'

# ---- DeepSeek API ----
export DEEPSEEK_API_KEY="sk-e6acfbd7a7c049569f7316d06f7f1c58"

