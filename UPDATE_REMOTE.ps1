# ==========================================
# 更新远程仓库 URL 并推送
# ==========================================

$ErrorActionPreference = "Stop"

Write-Host "🔗 更新远程仓库 URL 并推送代码" -ForegroundColor Cyan
Write-Host "=" * 60 -ForegroundColor Cyan

$QUARTZ_DIR = "D:\lize-chat\quartz"
Set-Location $QUARTZ_DIR

# 获取 GitHub 用户名
Write-Host "`n📝 请输入你的 GitHub 用户名：" -ForegroundColor Yellow
$username = Read-Host "GitHub 用户名"

if (-not $username -or $username -eq "[填入你的真实用户名]") {
    Write-Host "❌ 无效的用户名" -ForegroundColor Red
    Write-Host "`n请提供你的真实 GitHub 用户名" -ForegroundColor Yellow
    Write-Host "例如：如果你的 GitHub 主页是 https://github.com/zhangsan" -ForegroundColor White
    Write-Host "那么用户名就是：zhangsan" -ForegroundColor White
    pause
    exit 1
}

$repoUrl = "https://github.com/$username/lize-chat-quartz.git"

Write-Host "`n🔗 更新远程仓库 URL..." -ForegroundColor Yellow
Write-Host "新 URL: $repoUrl" -ForegroundColor Cyan

# 删除现有远程仓库（如果存在）
git remote remove origin 2>$null

# 添加新的远程仓库
git remote add origin $repoUrl

# 验证
Write-Host "`n✅ 远程仓库已更新" -ForegroundColor Green
git remote -v

# 推送代码
Write-Host "`n📤 推送到 GitHub..." -ForegroundColor Yellow
Write-Host "这可能需要一些时间，请稍候..." -ForegroundColor Cyan

try {
    git push -u origin main
    
    Write-Host "`n✅ 推送成功！" -ForegroundColor Green
    Write-Host "`n🎉 完成！你的代码已推送到 GitHub" -ForegroundColor Green
    Write-Host "仓库地址: $repoUrl" -ForegroundColor Cyan
    Write-Host "`n下一步：" -ForegroundColor Yellow
    Write-Host "1. 访问仓库确认文件已上传" -ForegroundColor White
    Write-Host "2. 在 Vercel 中导入这个仓库" -ForegroundColor White
    Write-Host "3. 配置部署设置（参考 QUICK_DEPLOY.md）" -ForegroundColor White
    
} catch {
    Write-Host "`n❌ 推送失败" -ForegroundColor Red
    Write-Host "错误信息: $_" -ForegroundColor Red
    Write-Host "`n可能的原因：" -ForegroundColor Yellow
    Write-Host "1. 仓库不存在，请确认仓库名称是 'lize-chat-quartz'" -ForegroundColor White
    Write-Host "2. 用户名不正确" -ForegroundColor White
    Write-Host "3. 没有权限，请检查 GitHub 认证" -ForegroundColor White
    Write-Host "4. 需要配置认证（Personal Access Token）" -ForegroundColor White
    Write-Host "`n手动推送命令：" -ForegroundColor Cyan
    Write-Host "git push -u origin main" -ForegroundColor White
}

Write-Host "`n按任意键退出..."
pause
