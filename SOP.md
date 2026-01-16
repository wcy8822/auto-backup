# 自动备份系统 SOP

> 标准操作流程 - 添加文件到自动备份

## 📍 备份系统路径

**完整路径（无简写）：**
```
/Users/ixu/auto-backup
```

---

## 🎯 SOP 1: 添加文件到自动备份

### 步骤：

**1. 打开终端（Terminal）**

**2. 执行添加命令：**

```bash
/Users/ixu/auto-backup/add-link.sh /Users/ixu/你的文件路径 tool
```

**3. 完整示例：**

```bash
# 假设你要备份这个文件：
# /Users/ixu/Documents/my-script.sh

# 执行：
/Users/ixu/auto-backup/add-link.sh /Users/ixu/Documents/my-script.sh tool

# 或者备份学习项目：
/Users/ixu/auto-backup/add-link.sh /Users/ixu/learning/python learning
```

**4. 确认已添加：**

```bash
/Users/ixu/auto-backup/list-links.sh
```

---

## 🎯 SOP 2: 查看已备份的文件

### 命令：

```bash
/Users/ixu/auto-backup/list-links.sh
```

### 输出示例：

```
📋 自动备份系统中的所有链接
================================

🔧 个人工具：
  → my-script.sh -> /Users/ixu/Documents/my-script.sh

📚 学习项目：
  → python -> /Users/ixu/learning/python
```

---

## 🎯 SOP 3: 手动触发备份（非必须）

### 如果你想立即备份，不用等到凌晨2点：

```bash
/Users/ixu/auto-backup/auto-backup.sh
```

---

## 🎯 SOP 4: 删除备份链接

### 如果不想再备份某个文件：

```bash
# 删除个人工具链接
rm /Users/ixu/auto-backup/personal-tools/文件名

# 删除学习项目链接
rm /Users/ixu/auto-backup/learning-projects/项目名
```

**注意：** 这只删除链接，不会删除原文件！

---

## 🎯 SOP 5: 查看备份历史

### 查看最近10次备份：

```bash
cd /Users/ixu/auto-backup
git log --oneline -10
```

---

## 📝 快速参考卡

### 备份系统完整路径：
```
/Users/ixu/auto-backup
```

### 常用命令（复制粘贴）：

```bash
# 1. 添加个人工具
/Users/ixu/auto-backup/add-link.sh /完整路径 tool

# 2. 添加学习项目
/Users/ixu/auto-backup/add-link.sh /完整路径 learning

# 3. 查看所有备份
/Users/ixu/auto-backup/list-links.sh

# 4. 立即手动备份
/Users/ixu/auto-backup/auto-backup.sh

# 5. 查看备份历史
cd /Users/ixu/auto-backup && git log --oneline -10
```

---

## ✅ 实际操作示例

### 示例 1: 备份 Shell 脚本

```bash
# 你的脚本在这里：/Users/ixu/scripts/backup.sh

# 执行：
/Users/ixu/auto-backup/add-link.sh /Users/ixu/scripts/backup.sh tool

# 确认：
/Users/ixu/auto-backup/list-links.sh
```

### 示例 2: 备份学习项目

```bash
# 你的项目在这里：/Users/ixu/learning/javascript

# 执行：
/Users/ixu/auto-backup/add-link.sh /Users/ixu/learning/javascript learning

# 确认：
/Users/ixu/auto-backup/list-links.sh
```

### 示例 3: 备份整个文件夹

```bash
# 你的工具在这里：/Users/ixu/Documents/my-tools

# 执行：
/Users/ixu/auto-backup/add-link.sh /Users/ixu/Documents/my-tools tool

# 确认：
/Users/ixu/auto-backup/list-links.sh
```

---

## 🔍 如何找到文件的完整路径

### 方法 1: 在 Finder 中

1. 找到文件
2. 右键点击文件
3. 按住 `Option` 键
4. 菜单会显示 "将 xxx 复制为路径名称"
5. 点击复制

### 方法 2: 在终端中

```bash
# 拖拽文件到终端窗口，自动显示完整路径
```

### 方法 3: 使用 pwd

```bash
# 进入文件所在目录
cd /Users/ixu/你的目录

# 查看完整路径
pwd
```

---

## 📊 备份系统结构

```
/Users/ixu/auto-backup/
├── dotfiles/              # 配置文件（自动备份）
├── personal-tools/        # 你的工具链接
├── learning-projects/     # 你的学习项目链接
├── add-link.sh           # 添加链接命令
├── list-links.sh         # 查看链接命令
└── auto-backup.sh        # 自动备份脚本
```

---

## ✅ 总结

**记住两个命令就够了：**

```bash
# 1. 添加文件到备份（替换成你的完整路径）
/Users/ixu/auto-backup/add-link.sh /Users/ixu/你的文件路径 tool

# 2. 查看已备份的文件
/Users/ixu/auto-backup/list-links.sh
```

---

## 📚 其他文档

- **版本回滚指南**: [ROLLBACK.md](ROLLBACK.md)
- **完整使用说明**: [README.md](README.md)

---

**GitHub 仓库**: https://github.com/wcy8822/auto-backup

**自动备份**: 每天凌晨 2:00

---

*最后更新: 2026-01-16*
