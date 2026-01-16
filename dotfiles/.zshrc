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
