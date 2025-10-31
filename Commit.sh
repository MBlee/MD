#!/bin/bash

# --- 脚本配置 ---
# 默认的远程分支名称 (你可以根据需要修改)
REMOTE_NAME="origin"
# 默认的本地分支名称 (脚本会自动获取当前分支)
# BRANCH_NAME="main"

echo "🚀 Git 自动化脚本开始执行..."
echo "-------------------------------------"

# 1. 检查是否在 Git 仓库中
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "❌ 错误: 当前目录不是一个 Git 仓库。"
    exit 1
fi

# 获取当前分支名称
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "✅ 当前分支: ${CURRENT_BRANCH}"

# 2. 检查状态
echo -e "\n🔍 执行 'git status'..."
git status

# 询问用户是否继续（检查是否有未暂存的更改）
if git status --porcelain | grep -q '^[ MADRCU? ]'; then
    read -r -p "💡 发现更改。是否继续执行 'git add .', 'git commit' 和 'git push'? (y/n): " CONFIRM
else
    echo -e "\n👍 没有发现更改，无需提交。"
    exit 0
fi

if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]]; then
    echo "👋 脚本已取消。"
    exit 0
fi

# 3. 暂存所有更改 (包括新文件和已修改/删除的文件)
echo -e "\n➕ 执行 'git add .'..."
git add .

# 4. 提交更改
echo -e "\n📝 准备执行 'git commit'..."

if git commit -m "%date%%time%"; then
    echo "✅ 提交成功!"
else
    echo "❌ 提交失败 (可能没有需要提交的更改)。"
    # 如果提交失败，可能是因为之前add了，但没有实际更改，这里允许继续
    # 如果想更严格，可以exit 1
fi

# 5. 推送到远程仓库
echo -e "\n推送开始: 'git push ${REMOTE_NAME} ${CURRENT_BRANCH}'..."
# 执行推送命令
if git push "$REMOTE_NAME" "$CURRENT_BRANCH"; then
    echo "🎉 Git 操作全部完成! 更改已成功推送到 ${REMOTE_NAME}/${CURRENT_BRANCH}。"
else
    echo "❌ 错误: Git 推送失败。请检查您的网络连接或权限。"
    exit 1
fi

echo "-------------------------------------"