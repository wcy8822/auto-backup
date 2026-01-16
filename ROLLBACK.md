# 版本回滚指南

> 自动备份系统保留所有历史版本，随时可以回滚

## 📅 查看备份历史

### 查看所有备份记录
```bash
cd ~/auto-backup
git log --oneline --all
```

### 查看最近 10 次备份
```bash
cd ~/auto-backup
git log --oneline -10
```

### 查看指定日期的备份
```bash
# 查看某一天的备份
git log --oneline --since="2026-01-15" --until="2026-01-16"

# 查看最近 7 天的备份
git log --oneline --since="7 days ago"
```

### 查看某个文件的修改历史
```bash
# 查看 .zshrc 的修改历史
git log --oneline -- dotfiles/.zshrc

# 查看具体修改内容
git log -p -- dotfiles/.zshrc
```

---

## 🔙 回滚方式

### 方式 1: 回滚整个仓库到某个版本

```bash
cd ~/auto-backup

# 1. 查看历史，找到要回滚的 commit hash
git log --oneline -20

# 2. 回滚到指定版本
git reset --hard <commit-hash>

# 3. 强制推送到 GitHub（会覆盖远程历史）
git push --force

# 示例：回滚到 3 天前的版本
# git reset --hard abc1234
# git push --force
```

### 方式 2: 恢复单个文件

```bash
cd ~/auto-backup

# 1. 查看某个文件的历史
git log --oneline -- dotfiles/.zshrc

# 2. 恢复文件到指定版本
git checkout <commit-hash> -- dotfiles/.zshrc

# 3. 复制回使用位置
cp dotfiles/.zshrc ~/

# 4. 提交恢复
git add dotfiles/.zshrc
git commit -m "restore: 恢复 .zshrc 到某版本"
git push
```

### 方式 3: 查看并复制旧版本（不破坏当前）

```bash
cd ~/auto-backup

# 1. 查看某个版本的文件内容
git show <commit-hash>:dotfiles/.zshrc

# 2. 导出到临时文件
git show <commit-hash>:dotfiles/.zshrc > /tmp/zshrc-old.bak

# 3. 手动复制需要的内容
cp /tmp/zshrc-old.bak ~/
```

---

## 📋 常见回滚场景

### 场景 1: 配置文件改坏了，想恢复昨天的

```bash
cd ~/auto-backup

# 查看昨天的备份
git log --oneline --since="yesterday" --until="today"

# 恢复 .zshrc
git checkout <commit-hash> -- dotfiles/.zshrc
cp dotfiles/.zshrc ~/
```

### 场景 2: 想查看 3 天前的某个配置

```bash
cd ~/auto-backup

# 查看 3 天前的版本
git log --oneline --since="3 days ago" --until="2 days ago"

# 查看内容
git show <commit-hash>:dotfiles/.zshrc

# 或者直接恢复
git checkout <commit-hash> -- dotfiles/.zshrc
```

### 场景 3: 整个仓库回滚到一周前

```bash
cd ~/auto-backup

# 找到一周前的 commit
git log --oneline --since="7 days ago"

# 回滚
git reset --hard <commit-hash>

# 强制推送（会删除之后的提交）
git push --force
```

---

## ⚠️ 注意事项

### 强制推送的风险
```bash
git push --force
```
- 会删除 push 之后的提交
- 如果其他人协作，会影响他们
- 建议先备份当前版本

### 安全回滚（推荐）
```bash
# 1. 创建备份分支
git branch backup-$(date +%Y%m%d)

# 2. 回滚到旧版本
git checkout <commit-hash>

# 3. 创建新分支测试
git checkout -b restore-test

# 4. 确认无误后再合并回 main
```

---

## 🔧 高级用法

### 对比两个版本的差异
```bash
# 对比当前版本和某个旧版本
git diff <commit-hash> -- dotfiles/.zshrc

# 对比两个指定版本
git diff <commit-1> <commit-2> -- dotfiles/.zshrc
```

### 查找删除的文件
```bash
# 查找某个被删除的文件
git log --all --full-history -- "**/filename.txt"

# 恢复被删除的文件
git checkout <commit-hash> -- path/to/file
```

### 暂存当前修改
```bash
# 保存当前修改
git stash save "临时保存"

# 回滚查看旧版本
git checkout <commit-hash>

# 恢复当前修改
git stash pop
```

---

## 💡 快速参考

```bash
# 查看历史
git log --oneline -20

# 回滚整个仓库
git reset --hard <hash>
git push --force

# 恢复单个文件
git checkout <hash> -- file.txt

# 查看旧版本内容
git show <hash>:file.txt

# 对比版本差异
git diff <hash-1> <hash-2>
```

---

**记住**: Git 永远保留所有历史，除非你强制删除。大胆尝试，随时可以回滚！
