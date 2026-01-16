# 自动备份系统

> 每天自动备份你的配置文件、个人工具和学习项目

## 🎯 工作原理

### 符号链接模式

你可以在**任何位置**工作和保存文件，通过创建**符号链接**到备份目录，自动备份系统会备份这些文件。

```
你的文件在任意位置 → 符号链接 → ~/auto-backup/ → 自动备份到 GitHub
```

## 🚀 快速开始

### 1. 添加要备份的文件/目录

```bash
# 添加个人工具（脚本、程序等）
~/auto-backup/add-link.sh ~/path/to/your-script.sh tool

# 添加学习项目
~/auto-backup/add-link.sh ~/path/to/learning-project learning

# 交互式添加（会提示你输入路径）
~/auto-backup/add-link.sh
```

### 2. 查看已添加的链接

```bash
~/auto-backup/list-links.sh
```

### 3. 自动备份

- **频率**: 每天凌晨 2 点自动备份
- **范围**: 所有通过链接添加的文件
- **历史**: 保留所有历史版本

## 📁 目录结构

```
~/auto-backup/
├── dotfiles/              # 配置文件（自动收集）
│   ├── .zshrc
│   ├── .gitconfig
│   └── vscode-settings.json
├── personal-tools/        # 个人工具（通过链接添加）
│   ├── my-script.sh → ~/scripts/my-script.sh
│   └── cool-tool.py → ~/dev/tools/cool-tool.py
├── learning-projects/      # 学习项目（通过链接添加）
│   ├── python-learning → ~/learning/python/
│   └── algo-practice → ~/Documents/algorithms/
├── add-link.sh            # 添加链接脚本
├── list-links.sh          # 查看链接脚本
└── auto-backup.sh         # 自动备份脚本
```

## 🔧 使用示例

### 示例 1: 备份你的 Shell 脚本

```bash
# 假设你的脚本在 ~/scripts/
ls ~/scripts/
# my-script.sh
# backup.sh

# 添加到备份系统
~/auto-backup/add-link.sh ~/scripts/my-script.sh tool
~/auto-backup/add-link.sh ~/scripts/backup.sh tool

# 查看
~/auto-backup/list-links.sh
```

### 示例 2: 备份学习项目

```bash
# 假设学习项目在 ~/learning/
ls ~/learning/
# python-basics/
# javascript-advanced/

# 添加到备份系统
~/auto-backup/add-link.sh ~/learning/python-basics learning
~/auto-backup/add-link.sh ~/learning/javascript-advanced learning

# 查看
~/auto-backup/list-links.sh
```

### 示例 3: 备份单个配置文件

```bash
# 备份特定的配置文件
~/auto-backup/add-link.sh ~/.vimrc tool
~/auto-backup/add-link.sh ~/.tmux.conf tool
```

## 📋 管理命令

### 添加文件
```bash
~/auto-backup/add-link.sh <路径> [tool|learning]
```

### 查看所有链接
```bash
~/auto-backup/list-links.sh
```

### 删除链接
```bash
# 删除个人工具链接
rm ~/auto-backup/personal-tools/my-script.sh

# 删除学习项目链接
rm ~/auto-backup/learning-projects/python-learning
```

### 手动触发备份
```bash
~/auto-backup/auto-backup.sh
```

### 查看备份历史
```bash
cd ~/auto-backup
git log --oneline -10
```

### 查看备份日志
```bash
cat ~/auto-backup/backup.log
```

## 🔙 版本回滚

详细的回滚说明请查看：
```bash
cat ~/auto-backup/ROLLBACK.md
```

或访问：https://github.com/wcy8822/auto-backup/blob/main/ROLLBACK.md

### 快速回滚命令

```bash
cd ~/auto-backup

# 查看历史
git log --oneline -10

# 恢复单个文件
git checkout <commit-hash> -- personal-tools/my-script.sh

# 回滚整个仓库
git reset --hard <commit-hash>
git push --force
```

## ⚙️ 定时任务

### 查看定时任务
```bash
crontab -l
```

### 停止自动备份
```bash
cd ~/auto-backup
./uninstall-crontab.sh
```

### 重新启用
```bash
cd ~/auto-backup
./install-crontab.sh
```

## 💡 常见问题

### Q: 我的原始文件会被修改吗？
A: 不会。符号链接只是指向原文件，原文件完全不受影响。

### Q: 删除链接会删除原文件吗？
A: 不会。删除链接只会删除链接本身，原文件安全。

### Q: 我可以在多个地方添加同一个文件吗？
A: 可以。一个文件可以有多个符号链接指向它。

### Q: 链接和复制有什么区别？
A: 
- **复制**: 文件有两份，修改后需要重新复制
- **链接**: 只有一份文件，修改后自动同步备份

### Q: 如何确认链接是否有效？
A: 运行 `~/auto-backup/list-links.sh` 查看所有链接状态。

## 📊 备份状态检查

```bash
# 查看仓库状态
cd ~/auto-backup
git status

# 查看最近备份
git log --oneline -5

# 查看待推送的更改
git diff HEAD
```

---

**GitHub 仓库**: https://github.com/wcy8822/auto-backup

**本地路径**: `~/auto-backup`

**自动备份**: 每天凌晨 2:00

---

*此备份系统使用符号链接，你可以在任何位置工作，文件会自动备份*
