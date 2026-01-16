# 自动备份仓库

> 每天自动备份配置文件、个人工具和学习项目

## 📦 备份内容

### 1. dotfiles/ - 配置文件
- Shell 配置（.zshrc, .bashrc 等）
- Git 配置（.gitconfig）
- VSCode 设置
- 其他系统配置

### 2. personal-tools/ - 个人工具
- 自己开发的脚本和工具
- 实用程序
- 自动化脚本

### 3. learning-projects/ - 学习项目
- 学习过程中的代码
- 练习项目
- 实验性代码

## 🔄 自动备份

- **频率**: 每天凌晨 2 点
- **方式**: 自动提交并推送到 GitHub
- **历史**: 保留所有历史版本

## 🔙 版本回滚

### 查看历史
```bash
cd ~/auto-backup
git log --oneline --all
```

### 回滚到指定日期
```bash
# 查看指定日期的版本
git log --oneline --since="2026-01-15" --until="2026-01-16"

# 回滚到某个版本
git reset --hard <commit-hash>

# 推送回滚（强制推送）
git push --force
```

### 恢复单个文件
```bash
# 查看文件历史
git log --oneline -- dotfiles/.zshrc

# 恢复文件到指定版本
git checkout <commit-hash> -- dotfiles/.zshrc
cp dotfiles/.zshrc ~/.zshrc
```

## 📅 备份日志

查看最近备份：
```bash
cd ~/auto-backup
git log --oneline -10
```

---

*此仓库由自动备份系统维护*
