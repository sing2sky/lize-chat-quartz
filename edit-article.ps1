# ==========================================
# 快速打开文章编辑脚本
# ==========================================

$CONTENT_DIR = "D:\lize-chat\quartz\content"

Write-Host "📝 选择要编辑的文章" -ForegroundColor Cyan
Write-Host ""

# 获取所有 Markdown 文件
$files = Get-ChildItem -Path $CONTENT_DIR -Filter "*.md" | Where-Object { $_.Name -ne "index.md" }

if ($files.Count -eq 0) {
    Write-Host "❌ 没有找到文章文件" -ForegroundColor Red
    exit 1
}

# 显示文件列表
Write-Host "文章列表：" -ForegroundColor Yellow
$index = 1
$fileList = @()
foreach ($file in $files) {
    # 尝试读取标题（从 frontmatter 或文件名）
    $title = $file.BaseName
    try {
        $content = Get-Content $file.FullName -Raw -Encoding UTF8
        if ($content -match '(?m)^title:\s*(.+)$') {
            $title = $matches[1].Trim()
        }
    } catch {
        # 如果读取失败，使用文件名
    }
    Write-Host "  [$index] $title" -ForegroundColor White
    $fileList += $file.FullName
    $index++
}

Write-Host ""

# 选择文件
$selection = Read-Host "请选择文章编号 (1-$($files.Count)) 或输入文件名"

$selectedFile = $null

# 尝试解析为数字
if ([int]::TryParse($selection, [ref]$null)) {
    $fileIndex = [int]$selection - 1
    if ($fileIndex -ge 0 -and $fileIndex -lt $files.Count) {
        $selectedFile = $fileList[$fileIndex]
    }
}

# 如果不是数字，尝试按文件名匹配
if ($null -eq $selectedFile) {
    $matchedFiles = $files | Where-Object { 
        $_.Name -like "*$selection*" -or $_.BaseName -like "*$selection*" 
    }
    if ($matchedFiles.Count -eq 1) {
        $selectedFile = $matchedFiles[0].FullName
    } elseif ($matchedFiles.Count -gt 1) {
        Write-Host "❌ 找到多个匹配的文件，请使用编号选择" -ForegroundColor Red
        exit 1
    }
}

if ($null -eq $selectedFile) {
    Write-Host "❌ 未找到匹配的文章" -ForegroundColor Red
    exit 1
}

# 打开文件（使用默认编辑器）
Write-Host "📂 正在打开: $selectedFile" -ForegroundColor Green
Start-Process $selectedFile

Write-Host ""
Write-Host "✅ 文件已打开，编辑后记得运行: npm run build" -ForegroundColor Cyan
