# ==========================================
# 快速创建新文章脚本
# ==========================================

$CONTENT_DIR = "D:\lize-chat\quartz\content"

Write-Host "📝 创建新文章" -ForegroundColor Cyan
Write-Host ""

# 获取文章标题
$title = Read-Host "请输入文章标题"

if ([string]::IsNullOrWhiteSpace($title)) {
    Write-Host "❌ 标题不能为空" -ForegroundColor Red
    exit 1
}

# 生成文件名（将标题转换为文件名）
$fileName = $title -replace '[<>:"/\\|?*]', '' -replace '\s+', '-' -replace '-+', '-'
$fileName = $fileName.Trim('-')
$fileName = $fileName.ToLower()

# 如果文件已存在，询问是否覆盖
$filePath = Join-Path $CONTENT_DIR "$fileName.md"
if (Test-Path $filePath) {
    $overwrite = Read-Host "文件 $fileName.md 已存在，是否覆盖？(y/N)"
    if ($overwrite -ne 'y' -and $overwrite -ne 'Y') {
        Write-Host "❌ 已取消创建" -ForegroundColor Yellow
        exit 0
    }
}

# 获取可选信息
$description = Read-Host "请输入文章描述（可选，直接回车跳过）"
$tagsInput = Read-Host "请输入标签（可选，用逗号分隔，直接回车跳过）"

# 生成日期
$date = Get-Date -Format "yyyy-MM-dd"

# 解析标签
$tags = @()
if (-not [string]::IsNullOrWhiteSpace($tagsInput)) {
    $tags = $tagsInput -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' }
}

# 创建 frontmatter
$frontmatter = "---`n"
$frontmatter += "title: $title`n"
$frontmatter += "date: $date`n"

if (-not [string]::IsNullOrWhiteSpace($description)) {
    $frontmatter += "description: $description`n"
}

if ($tags.Count -gt 0) {
    $frontmatter += "tags:`n"
    foreach ($tag in $tags) {
        $frontmatter += "  - $tag`n"
    }
}

$frontmatter += "draft: false`n"
$frontmatter += "---`n`n"

# 添加标题作为内容开头
$content = $frontmatter + "# $title`n`n"

# 写入文件
$content | Out-File -FilePath $filePath -Encoding UTF8

Write-Host ""
Write-Host "✅ 文章创建成功！" -ForegroundColor Green
Write-Host "   文件路径: $filePath" -ForegroundColor White
Write-Host ""
Write-Host "📋 下一步：" -ForegroundColor Cyan
Write-Host "   1. 编辑文章: code `"$filePath`"" -ForegroundColor White
Write-Host "   2. 构建网站: npm run build" -ForegroundColor White
Write-Host "   3. 预览网站: npm run build --serve" -ForegroundColor White
