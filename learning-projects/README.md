# 学习项目

这里存放学习过程中的代码和练习项目。

## 添加学习项目

### 方式 1: 直接复制
```bash
cp -r ~/path/to/learning-project ~/auto-backup/learning-projects/
```

### 方式 2: 符号链接（推荐）
```bash
# 在学习项目目录创建软链接到备份目录
cd ~/auto-backup/learning-projects
ln -s ~/path/to/learning-project ./learning-project
```

## 自动备份

学习项目会每天自动备份，保留所有历史版本。
