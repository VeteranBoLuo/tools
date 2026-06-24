#!/bin/bash
# 工具箱部署脚本 — 先自检，通过才部署
# 用法：bash scripts/deploy.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$SCRIPT_DIR"

echo "═══════════════════════════════════════"
echo "  工具箱部署"
echo "═══════════════════════════════════════"

# Step 1: 运行自检
echo ""
echo "🔍 运行自检..."
if python3 scripts/validate.py; then
    echo ""
    echo "✅ 自检通过！"
else
    echo ""
    echo "❌ 自检未通过，部署中止"
    echo "   修复上述错误后重试"
    exit 1
fi

# Step 2: 部署 index.html
echo ""
echo "📤 部署 index.html..."
scp -i ~/.ssh/hermes_server index.html root@139.9.83.16:/www/wwwroot/toolkit/index.html
echo "✅ index.html 部署完成"

# Step 3: 检查是否有其他 HTML 文件需要部署
# 新增的 Web 工具文件，通过 git 未跟踪的文件来判断
NEW_FILES=$(git ls-files --others --exclude-standard '*.html' 2>/dev/null || true)
if [ -n "$NEW_FILES" ]; then
    echo ""
    echo "📤 发现未跟踪的 HTML 文件，一并部署..."
    for f in $NEW_FILES; do
        scp -i ~/.ssh/hermes_server "$f" root@139.9.83.16:/www/wwwroot/toolkit/
        echo "  ✅ $f"
    done
fi

# Step 4: 验证
echo ""
echo "🔗 验证线上访问..."
curl -s -o /dev/null -w "  index.html: HTTP %{http_code}\n" "https://boluo66.top/toolkit/"

echo ""
echo "═══════════════════════════════════════"
echo "  ✅ 部署完成！"
echo "═══════════════════════════════════════"
