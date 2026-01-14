# 如何在 lize.chat 访问网站

## 🌐 访问生产环境

### 方法 1: 直接访问（如果已部署）

1. **打开浏览器**
2. **访问**: https://lize.chat
3. **如果看到网站**: 说明已成功部署 ✅

### 方法 2: 通过 Vercel Dashboard

1. **访问 Vercel Dashboard**
   - https://vercel.com/dashboard
   - 登录你的账号

2. **找到项目**
   - 点击 `lize-chat-quartz` 项目

3. **查看部署**
   - 点击 "Deployments" 标签页
   - 找到最新的部署（状态应该是 "Ready"）
   - 点击部署记录，会显示访问 URL

4. **访问网站**
   - 点击 "Visit" 按钮
   - 或复制 URL 在浏览器中打开

## 🔧 如果 lize.chat 还没有部署

### 步骤 1: 确认代码已推送

```powershell
cd D:\lize-chat\quartz
git status
git log --oneline -3
```

确保最新代码已推送到 GitHub。

### 步骤 2: 在 Vercel 中部署

1. **访问 Vercel**
   - https://vercel.com/new
   - 或 https://vercel.com/dashboard

2. **导入项目**
   - 点击 "Add New..." → "Project"
   - 选择 GitHub 仓库：`sing2sky/lize-chat-quartz`
   - 或点击 "Import Git Repository"

3. **配置项目**
   - **Framework Preset**: Other
   - **Build Command**: `npm run build`
   - **Output Directory**: `public`
   - **Install Command**: `npm install`
   - **Root Directory**: 留空（或设置为 `quartz`）

4. **配置域名**
   - 在项目设置中添加域名 `lize.chat`
   - Settings → Domains → Add Domain
   - 输入：`lize.chat`
   - 按照提示配置 DNS 记录

5. **部署**
   - 点击 "Deploy"
   - 等待构建完成（通常 1-2 分钟）

### 步骤 3: 配置 DNS（如果需要）

如果域名还没有配置：

1. **获取 Vercel DNS 记录**
   - 在 Vercel 项目设置中查看 DNS 配置
   - 通常需要添加 CNAME 记录

2. **在你的域名注册商处配置**
   - 登录域名管理面板
   - 添加 DNS 记录（按照 Vercel 的提示）

3. **等待 DNS 传播**
   - 通常需要几分钟到几小时

## ✅ 验证部署

### 检查清单

1. **访问网站**
   - ✅ https://lize.chat 可以访问
   - ✅ 显示"欢迎来到丽泽讲会"
   - ✅ 主题颜色正确（极客蓝）

2. **检查 RSS Feed**
   - ✅ https://lize.chat/index.xml 可以访问
   - ✅ 显示 RSS feed 内容

3. **检查构建日志**
   - 在 Vercel Dashboard 中查看构建日志
   - 确认构建成功，没有错误

## 🔄 更新网站

每次更新内容后：

```powershell
cd D:\lize-chat\quartz

# 1. 修改内容文件
# 编辑 content/ 目录下的文件

# 2. 重新构建（可选，Vercel 会自动构建）
npm run build

# 3. 提交并推送
git add .
git commit -m "Update content"
git push origin main

# 4. Vercel 会自动检测并重新部署
# 等待 1-2 分钟，然后刷新 https://lize.chat
```

## 🐛 故障排除

### 问题 1: 访问 lize.chat 显示 404

**可能原因**：
- 域名未配置
- DNS 未生效
- 部署失败

**解决**：
1. 检查 Vercel Dashboard 中的部署状态
2. 确认域名配置正确
3. 检查 DNS 记录

### 问题 2: 网站显示旧内容

**可能原因**：
- 浏览器缓存
- CDN 缓存
- 部署未完成

**解决**：
1. 硬刷新浏览器：`Ctrl + Shift + R`
2. 在 Vercel 中清除构建缓存并重新部署
3. 等待部署完成

### 问题 3: 构建失败

**可能原因**：
- 构建命令错误
- Node.js 版本不匹配
- 依赖问题

**解决**：
1. 查看 Vercel 构建日志
2. 确认 `vercel.json` 配置正确
3. 确认 `package.json` 中有 `build` 脚本

## 📋 快速检查命令

```powershell
# 检查 Git 状态
cd D:\lize-chat\quartz
git status
git log --oneline -3

# 检查远程仓库
git remote -v

# 如果需要推送
git push origin main
```

## 🎯 当前状态

- ✅ 代码已推送到 GitHub: `sing2sky/lize-chat-quartz`
- ✅ 构建配置已修复（`vercel.json`）
- ✅ 主题已配置（极客蓝）
- ⏳ 需要在 Vercel 中部署并配置域名

## 📞 下一步

1. **访问 Vercel Dashboard**
   - https://vercel.com/dashboard

2. **导入或检查项目**
   - 如果项目已存在：检查部署状态
   - 如果项目不存在：导入 GitHub 仓库

3. **配置域名**
   - 添加 `lize.chat` 域名

4. **访问网站**
   - https://lize.chat
