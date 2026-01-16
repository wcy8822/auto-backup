#!/bin/bash
# 添加符号链接到备份系统

BACKUP_DIR="$HOME/auto-backup"

echo "🔗 添加文件/目录到自动备份系统"
echo ""

# 检查参数
if [ $# -eq 0 ]; then
    echo "用法："
    echo "  ~/auto-backup/add-link.sh <文件/目录路径> [类型]"
    echo ""
    echo "类型："
    echo "  tool        - 个人工具（默认）"
    echo "  learning    - 学习项目"
    echo ""
    echo "示例："
    echo "  ~/auto-backup/add-link.sh ~/my-script.sh tool"
    echo "  ~/auto-backup/add-link.sh ~/learning/python learning"
    echo ""
    read -p "请输入要备份的文件/目录完整路径: " SOURCE_PATH
    [ -z "$SOURCE_PATH" ] && exit 1
    read -p "请输入类型 (tool/learning，默认 tool): " LINK_TYPE
    LINK_TYPE=${LINK_TYPE:-tool}
else
    SOURCE_PATH="$1"
    LINK_TYPE="${2:-tool}"
fi

# 验证源文件/目录存在
if [ ! -e "$SOURCE_PATH" ]; then
    echo "❌ 错误：文件或目录不存在: $SOURCE_PATH"
    exit 1
fi

# 获取文件/目录名
SOURCE_NAME=$(basename "$SOURCE_PATH")

# 确定链接目标目录
case "$LINK_TYPE" in
    tool|tools)
        TARGET_DIR="$BACKUP_DIR/personal-tools"
        ;;
    learning|project|projects)
        TARGET_DIR="$BACKUP_DIR/learning-projects"
        ;;
    *)
        echo "❌ 错误：未知类型 '$LINK_TYPE'"
        echo "   支持的类型：tool, learning"
        exit 1
        ;;
esac

# 创建链接
LINK_PATH="$TARGET_DIR/$SOURCE_NAME"

# 检查链接是否已存在
if [ -e "$LINK_PATH" ]; then
    echo "⚠️  警告：链接已存在: $LINK_PATH"
    read -p "是否删除并重新创建？: " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf "$LINK_PATH"
    else
        echo "❌ 取消操作"
        exit 1
    fi
fi

# 创建符号链接
ln -s "$SOURCE_PATH" "$LINK_PATH"

echo "✅ 链接创建成功！"
echo ""
echo "   源路径: $SOURCE_PATH"
echo "   链接位置: $LINK_PATH"
echo ""
echo "📝 这个文件现在会被自动备份了！"
echo ""
echo "查看所有链接："
echo "  ~/auto-backup/list-links.sh"
