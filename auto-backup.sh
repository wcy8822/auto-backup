#!/bin/bash
# 自动备份脚本 - 每天 GitHub 备份

BACKUP_DIR="$HOME/auto-backup"
LOG_FILE="$BACKUP_DIR/backup.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# 创建日志
echo "=== 开始备份: $DATE ===" >> "$LOG_FILE"

# 进入备份目录
cd "$BACKUP_DIR" || exit 1

# 1. 备份配置文件
echo "📦 备份配置文件..." >> "$LOG_FILE"
if [ -f "$BACKUP_DIR/backup-config.sh" ]; then
    bash "$BACKUP_DIR/backup-config.sh" >> "$LOG_FILE" 2>&1
fi

# 2. 检查是否有变化
if git diff --quiet && git diff --cached --quiet; then
    echo "✅ 没有变化，跳过提交" >> "$LOG_FILE"
    exit 0
fi

# 3. 添加所有更改
git add -A >> "$LOG_FILE" 2>&1

# 4. 提交更改
git commit -m "auto-backup: $DATE" >> "$LOG_FILE" 2>&1

# 5. 推送到 GitHub
git push >> "$LOG_FILE" 2>&1

echo "✅ 备份完成: $DATE" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

# 显示最后 5 行日志
tail -5 "$LOG_FILE"
