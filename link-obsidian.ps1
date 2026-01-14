# ==========================================
# 关联 Obsidian 仓库脚本
# ==========================================

$QUARTZ_CONTENT = "D:\lize-chat\quartz\content"
$OBSIDIAN_PATH = Read-Host "请输入你的 Obsidian 仓库完整路径（例如：D:\Documents\Obsidian Vault\lizechat）"

if (-not (Test-Path $OBSIDIAN_PATH)) {
    Write-Host "❌ 路径不存在: $OBSIDIAN_PATH" -ForegroundColor Red
    exit 1
}

# 备份现有 content 目录（如果存在且不是链接）
if (Test-Path $QUARTZ_CONTENT) {
    $item = Get-Item $QUARTZ_CONTENT
    if (-not $item.LinkType) {
        Write-Host "📦 备份现有 content 目录..." -ForegroundColor Yellow
        Rename-Item -Path $QUARTZ_CONTENT -NewName "content.backup" -Force
    } else {
        Write-Host "⚠️  content 已经是链接，正在删除..." -ForegroundColor Yellow
        Remove-Item -Path $QUARTZ_CONTENT -Force
    }
}

# 创建目录链接（junction）
Write-Host "🔗 创建目录链接..." -ForegroundColor Cyan
cmd /c mklink /J "$QUARTZ_CONTENT" "$OBSIDIAN_PATH"

if (Test-Path $QUARTZ_CONTENT) {
    Write-Host "✅ 软链接创建成功！" -ForegroundColor Green
    Write-Host "   源路径: $OBSIDIAN_PATH" -ForegroundColor White
    Write-Host "   链接路径: $QUARTZ_CONTENT" -ForegroundColor White
} else {
    Write-Host "❌ 软链接创建失败" -ForegroundColor Red
}
