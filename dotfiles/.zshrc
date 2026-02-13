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

# ---- 115 KEY ----
# 从钥匙串读取: 115key
alias 115key='security find-generic-password -w -s "115_key" -a "ixu"'
export KEY_115="_qimei_uuid42=1a1100c091310033918cd830249998c732070b6789; _qimei_i_3=7ede778ac70f55dec4c1af3058d222b1febbada5440901d3b68b2f0c749b243e34313e973989e2ba80a8; USERSESSIONID=cb425b39ada345512be8dfc76c69e80199d42c660b62dce6f20e934eb66b7c86; 115_lang=zh; _qimei_fingerprint=88737f882b304cfefaa049cf6238b884; GST=9e45b25684c372ba00228e1a0defa36c; _qimei_h38=52fcfff4918cd830249998c70300000861a20d; UID=343851045_A1_1770947709; CID=0f7a74c7e2190d8c1f35b683b5b32689; SEID=b9d6aef44611f7666b0b27b79c69b1597706e6e5097e079438f6d3efdd4d3dcc405944a0063436c1db579c55d8d66f823b1ab264269460b4f1c34e87; KID=16e35e18b31a5ecc129df238322d091d; acw_tc=784e2cb417709477105652312ec9aabb53269930cbae27d18e9d856c26b85c; PHPSESSID=ij6b3ln1iusv4mlbmtl8a86v9r; _qimei_i_1=27c26487970c038d97c1fa395a8c20b4ffeda4f316520a8bbcdc2f582593206c61633f9339d8e0dc8293f8d5"
alias claw="node ~/.local/share/fnm/node-versions/v24.13.0/installation/lib/node_modules/openclaw/openclaw.mjs"
