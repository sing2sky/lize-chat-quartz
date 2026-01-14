# ==========================================
# Quartz 4.0 完整设置脚本
# ==========================================

Write-Host "🌱 Quartz 4.0 完整设置向导" -ForegroundColor Cyan
Write-Host "=" * 60 -ForegroundColor Cyan

$QUARTZ_DIR = "D:\lize-chat\quartz"
Set-Location $QUARTZ_DIR

# ==========================================
# 步骤 1: 关联 Obsidian 仓库
# ==========================================
Write-Host "`n📁 步骤 1: 关联 Obsidian 仓库" -ForegroundColor Yellow
Write-Host "请选择操作：" -ForegroundColor White
Write-Host "1. 创建软链接到 Obsidian 仓库" -ForegroundColor White
Write-Host "2. 跳过此步骤（稍后手动配置）" -ForegroundColor White
$choice1 = Read-Host "请输入选项 (1/2)"

if ($choice1 -eq "1") {
    $obsidianPath = Read-Host "请输入你的 Obsidian 仓库完整路径"
    
    if (Test-Path $obsidianPath) {
        # 备份现有 content
        if (Test-Path "content") {
            $item = Get-Item "content" -ErrorAction SilentlyContinue
            if ($item -and -not $item.LinkType) {
                Write-Host "📦 备份现有 content 目录..." -ForegroundColor Yellow
                if (Test-Path "content.backup") {
                    Remove-Item "content.backup" -Recurse -Force
                }
                Rename-Item -Path "content" -NewName "content.backup" -Force
            } elseif ($item -and $item.LinkType) {
                Write-Host "⚠️  删除现有链接..." -ForegroundColor Yellow
                Remove-Item -Path "content" -Force
            }
        }
        
        # 创建目录链接
        Write-Host "🔗 创建目录链接..." -ForegroundColor Cyan
        $result = cmd /c mklink /J "content" "$obsidianPath" 2>&1
        
        if (Test-Path "content") {
            Write-Host "✅ Obsidian 仓库链接成功！" -ForegroundColor Green
        } else {
            Write-Host "❌ 链接创建失败，请检查路径和权限" -ForegroundColor Red
        }
    } else {
        Write-Host "❌ 路径不存在: $obsidianPath" -ForegroundColor Red
    }
} else {
    Write-Host "⏭️  跳过 Obsidian 链接设置" -ForegroundColor Yellow
}

# ==========================================
# 步骤 2: Git 配置
# ==========================================
Write-Host "`n🔧 步骤 2: Git 配置" -ForegroundColor Yellow

# 检查 Git 是否可用
try {
    $gitVersion = git --version 2>&1
    Write-Host "✅ Git 已安装" -ForegroundColor Green
    
    # 检查是否已初始化
    if (-not (Test-Path ".git")) {
        Write-Host "📦 初始化 Git 仓库..." -ForegroundColor Cyan
        git init
        Write-Host "✅ Git 仓库初始化完成" -ForegroundColor Green
    } else {
        Write-Host "ℹ️  Git 仓库已存在" -ForegroundColor Blue
    }
    
    # 添加文件
    Write-Host "📝 添加文件到 Git..." -ForegroundColor Cyan
    git add .
    
    # 检查是否有更改
    $status = git status --short
    if ($status) {
        Write-Host "💾 提交更改..." -ForegroundColor Cyan
        git commit -m "Initial quartz setup: 丽泽讲会 - 品牌化定制完成"
        Write-Host "✅ 文件已提交" -ForegroundColor Green
        
        Write-Host "`n📤 下一步：推送到 GitHub" -ForegroundColor Yellow
        Write-Host "1. 访问 https://github.com/new 创建新仓库" -ForegroundColor White
        Write-Host "2. 不要初始化 README、.gitignore 或 license" -ForegroundColor White
        Write-Host "3. 创建后执行以下命令：" -ForegroundColor White
        Write-Host "   git branch -M main" -ForegroundColor Cyan
        Write-Host "   git remote add origin https://github.com/你的用户名/仓库名.git" -ForegroundColor Cyan
        Write-Host "   git push -u origin main" -ForegroundColor Cyan
    } else {
        Write-Host "ℹ️  没有需要提交的更改" -ForegroundColor Blue
    }
    
    # 检查远程仓库
    $remotes = git remote -v 2>&1
    if ($remotes -and $remotes -notmatch "fatal") {
        Write-Host "`n🌐 已配置的远程仓库：" -ForegroundColor Green
        Write-Host $remotes -ForegroundColor White
    } else {
        Write-Host "`n⚠️  尚未配置远程仓库" -ForegroundColor Yellow
        Write-Host "请按照上述步骤创建 GitHub 仓库并添加 remote" -ForegroundColor White
    }
    
} catch {
    Write-Host "❌ Git 未安装或不可用" -ForegroundColor Red
    Write-Host "请先安装 Git: https://git-scm.com/download/win" -ForegroundColor Yellow
    Write-Host "安装后重新运行此脚本" -ForegroundColor Yellow
}

# ==========================================
# 步骤 3: 构建和预览
# ==========================================
Write-Host "`n🚀 步骤 3: 构建项目" -ForegroundColor Yellow
Write-Host "正在构建..." -ForegroundColor Cyan
node quartz/bootstrap-cli.mjs build

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ 构建成功！" -ForegroundColor Green
    Write-Host "`n📋 下一步操作：" -ForegroundColor Cyan
    Write-Host "1. 启动预览服务器: npm run quartz build --serve" -ForegroundColor White
    Write-Host "2. 访问 http://localhost:8080 查看网站" -ForegroundColor White
    Write-Host "3. 配置 Vercel 部署（参考 SETUP_GUIDE.md）" -ForegroundColor White
} else {
    Write-Host "❌ 构建失败，请检查错误信息" -ForegroundColor Red
}

Write-Host "`n✨ 设置完成！" -ForegroundColor Green
Write-Host "详细指南请查看: SETUP_GUIDE.md" -ForegroundColor Cyan
