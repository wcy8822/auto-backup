#!/bin/bash
# 配置文件备份脚本

BACKUP_DIR="$HOME/auto-backup"
DOTFILES_DIR="$BACKUP_DIR/dotfiles"

# 创建目录
mkdir -p "$DOTFILES_DIR"

# 备份配置文件
echo "📦 备份配置文件..."

# Shell 配置
[ -f ~/.zshrc ] && cp ~/.zshrc "$DOTFILES_DIR/"
[ -f ~/.bashrc ] && cp ~/.bashrc "$DOTFILES_DIR/"
[ -f ~/.bash_profile ] && cp ~/.bash_profile "$DOTFILES_DIR/"

# Git 配置
[ -f ~/.gitconfig ] && cp ~/.gitconfig "$DOTFILES_DIR/"

# VSCode 配置
[ -f ~/Library/Application\ Support/Code/User/settings.json ] && cp ~/Library/Application\ Support/Code/User/settings.json "$DOTFILES_DIR/vscode-settings.json"

# SSH 配置（不包含私钥）
[ -d ~/.ssh ] && ls -la ~/.ssh/ > "$DOTFILES_DIR/ssh-config-list.txt"

echo "✅ 配置文件备份完成"
