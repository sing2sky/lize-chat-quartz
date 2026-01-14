# ✅ 部署验证清单

## 📋 当前状态

### ✅ 本地构建
- CSS 文件已生成并包含极客蓝主题
- 主题变量正确：
  - `--secondary: #0070f3` (极客蓝)
  - `--dark: #1a202c` (深空灰蓝)
  - `--tertiary: #3291ff` (科技蓝)

### ✅ Git 提交
- 最新提交：`434903e Fix Vercel build: Add build script and update vercel.json`
- 代码已推送到 GitHub

## 🧹 清理缓存步骤

### 1. 浏览器缓存清理

**Chrome/Edge:**
1. 按 `Ctrl + Shift + Delete`
2. 选择"缓存的图片和文件"
3. 时间范围：选择"全部时间"
4. 点击"清除数据"

**硬刷新页面:**
- Windows: `Ctrl + Shift + R` 或 `Ctrl + F5`
- Mac: `Cmd + Shift + R`

**开发者工具清理:**
1. 打开开发者工具 (F12)
2. 右键点击刷新按钮
3. 选择"清空缓存并硬性重新加载"

### 2. Vercel 缓存清理

**方法 1: 重新部署**
1. 访问 https://vercel.com/dashboard
2. 找到 `lize-chat-quartz` 项目
3. 点击 "Deployments"
4. 找到最新的部署
5. 点击 "..." → "Redeploy"

**方法 2: 清除构建缓存**
1. 进入项目 Settings
2. 找到 "Build & Development Settings"
3. 点击 "Clear Build Cache"
4. 然后重新部署

## ✅ 验证部署

### 检查清单

1. **访问网站**
   - 打开 https://lize.chat
   - 或 Vercel 提供的预览 URL

2. **检查主题颜色**
   - ✅ 链接应该是极客蓝 (#0070f3)
   - ✅ 标题应该是深空灰蓝 (#1a202c)
   - ✅ 按钮应该有蓝色渐变
   - ✅ 2.5D 阴影效果应该可见

3. **检查 CSS 变量（开发者工具）**
   - 打开开发者工具 (F12)
   - 进入 Console
   - 运行：
     ```javascript
     getComputedStyle(document.documentElement).getPropertyValue('--secondary')
     ```
   - 应该返回：`#0070f3`

4. **检查 RSS Feed**
   - 访问 https://lize.chat/index.xml
   - 标题应该是"丽泽讲会"
   - 链接应该是 https://lize.chat

## 🔧 如果主题仍然不正确

### 强制重新部署

1. **在 Vercel 中清除缓存并重新部署**
   - Settings → Build & Development Settings
   - Clear Build Cache
   - 然后 Redeploy

2. **检查构建日志**
   - 进入 Deployments
   - 查看最新的构建日志
   - 确认构建成功且没有错误

3. **验证文件是否正确推送**
   - 访问：https://github.com/sing2sky/lize-chat-quartz
   - 确认 `quartz/styles/custom.scss` 存在
   - 确认 `quartz.config.ts` 中的颜色配置正确

## 📝 快速验证命令

### 本地验证

```powershell
cd D:\lize-chat\quartz

# 清理并重建
Remove-Item -Path "public" -Recurse -Force
npm run build

# 检查主题变量
Select-String -Path "public\index.css" -Pattern "#0070f3|#1a202c"
```

### 浏览器验证

打开开发者工具 (F12)，在 Console 中运行：

```javascript
// 检查主题变量
console.log('Secondary:', getComputedStyle(document.documentElement).getPropertyValue('--secondary'));
console.log('Dark:', getComputedStyle(document.documentElement).getPropertyValue('--dark'));
console.log('Tertiary:', getComputedStyle(document.documentElement).getPropertyValue('--tertiary'));

// 应该输出：
// Secondary: #0070f3
// Dark: #1a202c
// Tertiary: #3291ff
```

## 🎯 预期结果

部署成功后，你应该看到：

- ✅ 网站标题：丽泽讲会
- ✅ 链接颜色：极客蓝 (#0070f3)
- ✅ 标题颜色：深空灰蓝 (#1a202c)
- ✅ 2.5D 阴影效果：蓝色光晕
- ✅ RSS Feed：正确生成

## ⚠️ 如果看到绿色主题变量

如果你在浏览器中看到 `--brand_color_green_primary` 等绿色变量，这些**不是** Quartz 项目的变量，可能来自：

1. **浏览器扩展**：某些扩展会注入 CSS
2. **其他网站的样式**：跨站样式污染
3. **开发者工具中的其他资源**：检查 Network 标签页

**解决方法**：
- 禁用浏览器扩展后重试
- 使用无痕模式访问
- 检查 Network 标签页，确认加载的是正确的 CSS 文件
