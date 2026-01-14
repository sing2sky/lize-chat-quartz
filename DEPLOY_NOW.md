# 🚀 立即部署到 lize.chat

## ⚠️ 当前状态

- ❌ lize.chat 显示 404（网站未部署）
- ✅ 代码已推送到 GitHub
- ✅ 构建配置已准备好

## 📋 快速部署步骤

### 步骤 1: 访问 Vercel

1. **打开浏览器**
2. **访问**: https://vercel.com/dashboard
3. **登录**（使用 GitHub 账号）

### 步骤 2: 导入项目

**如果项目已存在：**
1. 在项目列表中找到 `lize-chat-quartz`
2. 点击进入项目
3. 检查部署状态
4. 如果部署失败，点击 "Redeploy"

**如果项目不存在：**
1. 点击 **"Add New..."** → **"Project"**
2. 选择 **"Import Git Repository"**
3. 搜索并选择：`sing2sky/lize-chat-quartz`
4. 点击 **"Import"**

### 步骤 3: 配置项目

在项目配置页面：

**基本设置：**
- **Project Name**: `lize-chat-quartz`（或你喜欢的名字）
- **Framework Preset**: **Other**
- **Root Directory**: 留空（或设置为 `quartz`）

**构建设置：**
- **Build Command**: `npm run build`
- **Output Directory**: `public`
- **Install Command**: `npm install`

**环境变量：**
- 通常不需要额外配置

### 步骤 4: 部署

1. 点击 **"Deploy"** 按钮
2. 等待构建完成（通常 1-2 分钟）
3. 查看构建日志，确认成功

### 步骤 5: 配置域名

**如果域名还未配置：**

1. **进入项目设置**
   - 点击项目 → **Settings** → **Domains**

2. **添加域名**
   - 点击 **"Add Domain"**
   - 输入：`lize.chat`
   - 点击 **"Add"**

3. **配置 DNS**
   - Vercel 会显示需要添加的 DNS 记录
   - 通常是 CNAME 记录
   - 在你的域名注册商处添加这些记录

4. **等待 DNS 生效**
   - 通常需要几分钟到几小时
   - 可以在 Vercel Dashboard 中查看状态

## ✅ 验证部署

部署完成后：

1. **访问网站**
   - https://lize.chat
   - 应该显示"欢迎来到丽泽讲会"

2. **检查内容**
   - ✅ 标题：丽泽讲会
   - ✅ 主题：极客蓝 (#0070f3)
   - ✅ 2.5D 阴影效果

3. **检查 RSS Feed**
   - https://lize.chat/index.xml
   - 应该显示 RSS feed 内容

## 🔄 如果部署失败

### 检查构建日志

1. 进入 Vercel Dashboard
2. 点击项目 → **Deployments**
3. 点击失败的部署
4. 查看 **"Build Logs"**

### 常见问题

**问题 1: Build Command 错误**
- 确认使用：`npm run build`
- 不是：`npm run quartz build`

**问题 2: Output Directory 错误**
- 确认使用：`public`
- 不是：`dist` 或其他

**问题 3: Node.js 版本**
- 在项目设置中检查 Node.js 版本
- Quartz 需要 Node.js >= 22

## 📝 配置文件参考

你的 `vercel.json` 已配置好：

```json
{
  "buildCommand": "npm run build",
  "outputDirectory": "public",
  "installCommand": "npm install",
  "framework": null
}
```

## 🎯 快速检查清单

- [ ] 代码已推送到 GitHub
- [ ] Vercel 项目已创建或存在
- [ ] 构建配置正确（Build Command, Output Directory）
- [ ] 部署成功（查看构建日志）
- [ ] 域名已配置（如果使用自定义域名）
- [ ] DNS 记录已添加（如果使用自定义域名）
- [ ] 网站可以访问

## 💡 提示

- **首次部署**：可能需要 2-3 分钟
- **后续更新**：推送代码后自动部署，通常 1-2 分钟
- **查看进度**：在 Vercel Dashboard 中实时查看构建日志

## 🆘 需要帮助？

如果遇到问题：
1. 查看 Vercel 构建日志
2. 检查 `vercel.json` 配置
3. 确认 `package.json` 中有 `build` 脚本
4. 查看详细指南：`ACCESS_LIZE_CHAT.md`
