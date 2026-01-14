# 清理缓存和验证部署指南

## 🔍 当前状态检查

### 1. 本地构建验证

已重新构建项目，验证主题变量是否正确：
- ✅ `--secondary: #0070f3` (极客蓝)
- ✅ `--dark: #1a202c` (深空灰蓝)
- ✅ `--tertiary: #3291ff` (科技蓝)

### 2. Git 状态

检查是否有未提交的更改需要推送。

## 🧹 清理缓存步骤

### 浏览器缓存清理

1. **Chrome/Edge**
   - 按 `Ctrl + Shift + Delete`
   - 选择"缓存的图片和文件"
   - 时间范围：选择"全部时间"
   - 点击"清除数据"

2. **硬刷新页面**
   - Windows: `Ctrl + Shift + R` 或 `Ctrl + F5`
   - Mac: `Cmd + Shift + R`

3. **开发者工具清理**
   - 打开开发者工具 (F12)
   - 右键点击刷新按钮
   - 选择"清空缓存并硬性重新加载"

### Vercel 缓存清理

1. **重新部署**
   - 访问 Vercel Dashboard
   - 找到 `lize-chat-quartz` 项目
   - 点击 "Deployments"
   - 找到最新的部署
   - 点击 "..." → "Redeploy"

2. **清除构建缓存**
   - 进入项目 Settings
   - 找到 "Build & Development Settings"
   - 点击 "Clear Build Cache"
   - 然后重新部署

3. **环境变量检查**
   - 确保没有影响构建的缓存环境变量

## ✅ 验证部署

### 检查清单

1. **访问网站**
   - 打开 https://lize.chat
   - 或 Vercel 提供的预览 URL

2. **检查主题颜色**
   - 链接应该是极客蓝 (#0070f3)
   - 标题应该是深空灰蓝 (#1a202c)
   - 按钮应该有蓝色渐变

3. **检查 CSS 变量**
   - 打开开发者工具 (F12)
   - 进入 Console
   - 运行：`getComputedStyle(document.documentElement).getPropertyValue('--secondary')`
   - 应该返回：`#0070f3`

4. **检查 RSS Feed**
   - 访问 https://lize.chat/index.xml
   - 标题应该是"丽泽讲会"
   - 链接应该是 https://lize.chat

## 🔧 如果主题仍然不正确

### 方法 1: 强制重新构建

```powershell
cd D:\lize-chat\quartz
# 清理构建输出
Remove-Item -Path "public" -Recurse -Force
# 重新构建
npm run build
# 提交并推送
git add .
git commit -m "Force rebuild: clear cache"
git push origin main
```

### 方法 2: 检查 Vercel 构建日志

1. 访问 Vercel Dashboard
2. 进入项目 → Deployments
3. 点击最新的部署
4. 查看 "Build Logs"
5. 确认：
   - 构建成功
   - 没有错误
   - CSS 文件正确生成

### 方法 3: 检查文件是否正确推送

```powershell
cd D:\lize-chat\quartz
# 检查文件是否在 Git 中
git ls-files | Select-String "custom.scss|quartz.config.ts"
# 检查文件内容
git show HEAD:quartz/styles/custom.scss | Select-String "#0070f3"
```

## 📋 快速验证命令

### 本地验证

```powershell
cd D:\lize-chat\quartz
# 清理并重建
Remove-Item -Path "public" -Recurse -Force
npm run build

# 检查 CSS 变量
Select-String -Path "public\index.css" -Pattern "#0070f3|#1a202c" | Select-Object -First 5
```

### 检查部署

1. **GitHub 仓库**
   - 访问：https://github.com/sing2sky/lize-chat-quartz
   - 确认最新提交已推送

2. **Vercel 部署**
   - 访问：https://vercel.com/dashboard
   - 检查部署状态
   - 查看构建日志

## 🎯 预期结果

部署成功后，你应该看到：

- ✅ 网站标题：丽泽讲会
- ✅ 链接颜色：极客蓝 (#0070f3)
- ✅ 标题颜色：深空灰蓝 (#1a202c)
- ✅ 2.5D 阴影效果：蓝色光晕
- ✅ RSS Feed：正确生成

## ⚠️ 常见问题

### 问题 1: 看到旧的绿色主题

**原因**：浏览器缓存或 CDN 缓存

**解决**：
1. 硬刷新浏览器 (Ctrl+Shift+R)
2. 清除浏览器缓存
3. 在 Vercel 中清除构建缓存并重新部署

### 问题 2: CSS 变量不匹配

**原因**：构建时使用了错误的配置

**解决**：
1. 确认 `quartz.config.ts` 中的颜色配置正确
2. 确认 `quartz/styles/custom.scss` 存在且正确
3. 重新构建并推送

### 问题 3: 部署失败

**原因**：构建命令或配置错误

**解决**：
1. 检查 Vercel 构建日志
2. 确认 `vercel.json` 配置正确
3. 确认 `package.json` 中有 `build` 脚本
