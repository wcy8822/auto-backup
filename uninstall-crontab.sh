#!/bin/bash
# 卸载定时任务

echo "🗑️  移除定时自动备份..."

# 移除 crontab 任务
crontab -l | grep -v "auto-backup.sh" | crontab -

echo "✅ 定时任务已移除"
