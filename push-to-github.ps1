# ==========================================
# 推送 Quartz 项目到 GitHub
# ==========================================

$ErrorActionPreference = "Stop"

Write-Host "🚀 开始推送 Quartz 项目到 GitHub..." -ForegroundColor Cyan
Write-Host "=" * 60 -ForegroundColor Cyan

$QUARTZ_DIR = "D:\lize-chat\quartz"
Set-Location $QUARTZ_DIR

# 检查 Git 是否可用
Write-Host "`n📦 检查 Git..." -ForegroundColor Yellow
$gitPath = $null

# 尝试找到 Git
$gitPaths = @(
    "git",
    "C:\Program Files\Git\cmd\git.exe",
    "C:\Program Files (x86)\Git\cmd\git.exe",
    "$env:ProgramFiles\Git\cmd\git.exe",
    "$env:ProgramFiles(x86)\Git\cmd\git.exe"
)

foreach ($path in $gitPaths) {
    try {
        if ($path -eq "git") {
            $result = & git --version 2>&1
            if ($LASTEXITCODE -eq 0) {
                $gitPath = "git"
                Write-Host "✅ 找到 Git: $result" -ForegroundColor Green
                break
            }
        } else {
            if (Test-Path $path) {
                $result = & $path --version 2>&1
                if ($LASTEXITCODE -eq 0) {
                    $gitPath = $path
                    Write-Host "✅ 找到 Git: $result" -ForegroundColor Green
                    break
                }
            }
        }
    } catch {
        continue
    }
}

if (-not $gitPath) {
    Write-Host "❌ Git 未找到！" -ForegroundColor Red
    Write-Host "`n请先安装 Git：" -ForegroundColor Yellow
    Write-Host "1. 访问: https://git-scm.com/download/win" -ForegroundColor White
    Write-Host "2. 下载并安装 Git for Windows" -ForegroundColor White
    Write-Host "3. 安装后重启终端，然后重新运行此脚本" -ForegroundColor White
    pause
    exit 1
}

# 定义 Git 命令函数
function Invoke-Git {
    param([string[]]$Arguments)
    if ($gitPath -eq "git") {
        & git $Arguments
    } else {
        & $gitPath $Arguments
    }
}

# 检查 .gitignore
Write-Host "`n📋 检查 .gitignore..." -ForegroundColor Yellow
if (Test-Path ".gitignore") {
    Write-Host "✅ .gitignore 文件存在" -ForegroundColor Green
    $gitignoreContent = Get-Content ".gitignore" -Raw
    if ($gitignoreContent -match "node_modules") {
        Write-Host "✅ node_modules 已在 .gitignore 中" -ForegroundColor Green
    } else {
        Write-Host "⚠️  node_modules 不在 .gitignore 中，正在添加..." -ForegroundColor Yellow
        Add-Content ".gitignore" "`nnode_modules"
    }
} else {
    Write-Host "⚠️  .gitignore 不存在，正在创建..." -ForegroundColor Yellow
    @"
.DS_Store
.gitignore
node_modules
public
prof
tsconfig.tsbuildinfo
.obsidian
.quartz-cache
private/
.replit
replit.nix
"@ | Out-File ".gitignore" -Encoding UTF8
    Write-Host "✅ .gitignore 已创建" -ForegroundColor Green
}

# 初始化 Git 仓库
Write-Host "`n📦 初始化 Git 仓库..." -ForegroundColor Yellow
if (-not (Test-Path ".git")) {
    Invoke-Git @("init")
    Write-Host "✅ Git 仓库已初始化" -ForegroundColor Green
} else {
    Write-Host "ℹ️  Git 仓库已存在" -ForegroundColor Blue
}

# 添加文件
Write-Host "`n📝 添加文件到暂存区..." -ForegroundColor Yellow
Invoke-Git @("add", ".")

# 检查是否有更改
$status = Invoke-Git @("status", "--short")
if ($status) {
    Write-Host "✅ 文件已添加到暂存区" -ForegroundColor Green
    Write-Host "`n💾 提交更改..." -ForegroundColor Yellow
    $commitMessage = "Initial commit: Quartz 4.0 with tech theme for lize.chat"
    Invoke-Git @("commit", "-m", $commitMessage)
    Write-Host "✅ 提交完成" -ForegroundColor Green
} else {
    Write-Host "ℹ️  没有需要提交的更改" -ForegroundColor Blue
}

# 设置主分支
Write-Host "`n🌿 设置主分支..." -ForegroundColor Yellow
Invoke-Git @("branch", "-M", "main")
Write-Host "✅ 主分支已设置" -ForegroundColor Green

# 获取 GitHub 用户名和仓库名
Write-Host "`n🔗 配置远程仓库..." -ForegroundColor Yellow
$githubUrl = Read-Host "请输入 GitHub 仓库 URL (例如: https://github.com/username/lize-chat-quartz.git)"

if (-not $githubUrl) {
    Write-Host "❌ 未提供仓库 URL" -ForegroundColor Red
    pause
    exit 1
}

# 检查是否已有远程仓库
$remotes = Invoke-Git @("remote", "-v") 2>&1
if ($remotes -and $remotes -notmatch "fatal") {
    Write-Host "⚠️  已存在远程仓库，正在更新..." -ForegroundColor Yellow
    Invoke-Git @("remote", "set-url", "origin", $githubUrl)
} else {
    Write-Host "➕ 添加远程仓库..." -ForegroundColor Cyan
    Invoke-Git @("remote", "add", "origin", $githubUrl)
}

Write-Host "✅ 远程仓库已配置: $githubUrl" -ForegroundColor Green

# 推送代码
Write-Host "`n📤 推送到 GitHub..." -ForegroundColor Yellow
Write-Host "这可能需要一些时间，请稍候..." -ForegroundColor Cyan

try {
    Invoke-Git @("push", "-u", "origin", "main")
    Write-Host "`n✅ 推送成功！" -ForegroundColor Green
    Write-Host "`n🎉 完成！你的代码已推送到 GitHub" -ForegroundColor Green
    Write-Host "仓库地址: $githubUrl" -ForegroundColor Cyan
} catch {
    Write-Host "`n❌ 推送失败" -ForegroundColor Red
    Write-Host "错误信息: $_" -ForegroundColor Red
    Write-Host "`n可能的原因：" -ForegroundColor Yellow
    Write-Host "1. 仓库不存在，请先在 GitHub 上创建仓库" -ForegroundColor White
    Write-Host "2. 没有权限，请检查 GitHub 认证" -ForegroundColor White
    Write-Host "3. 网络问题" -ForegroundColor White
    Write-Host "`n手动推送命令：" -ForegroundColor Cyan
    Write-Host "git push -u origin main" -ForegroundColor White
}

Write-Host "`n按任意键退出..."
pause
