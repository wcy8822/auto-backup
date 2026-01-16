#!/bin/bash
# 安装定时任务

echo "🔧 配置定时自动备份..."

# 添加 crontab 任务（每天凌晨 2 点）
(crontab -l 2>/dev/null; echo "0 2 * * * $HOME/auto-backup/auto-backup.sh") | crontab -

echo "✅ 定时任务已配置：每天凌晨 2 点自动备份"
echo ""
echo "查看定时任务："
echo "  crontab -l"
echo ""
echo "查看备份日志："
echo "  cat ~/auto-backup/backup.log"
echo ""
echo "手动运行备份："
echo "  ~/auto-backup/auto-backup.sh"
