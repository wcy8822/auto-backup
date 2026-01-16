#!/bin/bash
# 列出所有备份链接

BACKUP_DIR="$HOME/auto-backup"

echo "📋 自动备份系统中的所有链接"
echo "================================"
echo ""

echo "🔧 个人工具："
ls -lh "$BACKUP_DIR/personal-tools/" 2>/dev/null | grep "^l" | awk '{print "  → " $9 " -> " $11}' || echo "  (无链接)"
echo ""

echo "📚 学习项目："
ls -lh "$BACKUP_DIR/learning-projects/" 2>/dev/null | grep "^l" | awk '{print "  → " $9 " -> " $11}' || echo "  (无链接)"
echo ""

echo "提示："
echo "  添加新链接：~/auto-backup/add-link.sh <路径> [类型]"
echo "  移除链接：rm ~/auto-backup/personal-tools/<文件名>"
