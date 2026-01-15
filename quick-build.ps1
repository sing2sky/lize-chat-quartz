# ==========================================
# 快速构建并预览脚本
# ==========================================

$QUARTZ_DIR = "D:\lize-chat\quartz"

Write-Host "🚀 构建并预览网站" -ForegroundColor Cyan
Write-Host ""

# 切换到项目目录
Set-Location $QUARTZ_DIR

# 构建
Write-Host "📦 正在构建..." -ForegroundColor Yellow
npm run build

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ 构建成功！" -ForegroundColor Green
    Write-Host ""
    
    # 询问是否启动预览服务器
    $serve = Read-Host "是否启动预览服务器？(Y/n)"
    
    if ($serve -ne 'n' -and $serve -ne 'N') {
        Write-Host ""
        Write-Host "🌐 启动预览服务器..." -ForegroundColor Yellow
        Write-Host "   访问地址: http://localhost:8080" -ForegroundColor White
        Write-Host "   按 Ctrl+C 停止服务器" -ForegroundColor White
        Write-Host ""
        npm run build --serve
    }
} else {
    Write-Host ""
    Write-Host "❌ 构建失败，请检查错误信息" -ForegroundColor Red
    exit 1
}
