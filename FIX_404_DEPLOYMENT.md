# 🔧 修复 404 DEPLOYMENT_NOT_FOUND 错误

## ❌ 错误信息

```
404: NOT_FOUND
Code: DEPLOYMENT_NOT_FOUND
```

## 📋 问题原因

这个错误表示：
- ❌ Vercel 上还没有部署 `lize-chat-quartz` 项目
- ❌ 或者项目存在但部署失败/被删除
- ❌ 或者域名配置指向了不存在的部署

## ✅ 解决方案

### 方法 1: 在 Vercel 中创建新项目（推荐）

#### 步骤 1: 访问 Vercel

1. **打开浏览器**
2. **访问**: https://vercel.com/new
3. **登录**（使用 GitHub 账号）

#### 步骤 2: 导入 GitHub 仓库

1. **选择仓库**
   - 在仓库列表中找到：`sing2sky/lize-chat-quartz`
   - 或搜索：`lize-chat-quartz`
   - 点击仓库

2. **如果仓库不在列表中**
   - 点击 "Adjust GitHub App Permissions"
   - 授权 Vercel 访问你的仓库
   - 刷新页面

#### 步骤 3: 配置项目

在项目配置页面：

**项目名称：**
- Project Name: `lize-chat-quartz`（或你喜欢的名字）

**构建设置：**
- Framework Preset: **Other**
- Root Directory: 留空（或 `quartz`）
- Build Command: `npm run build`
- Output Directory: `public`
- Install Command: `npm install`

**环境变量：**
- 通常不需要额外配置

#### 步骤 4: 部署

1. **点击 "Deploy"**
2. **等待构建**
   - 通常需要 1-2 分钟
   - 可以在页面上查看实时构建日志

3. **构建成功**
   - 会显示部署 URL（如：`lize-chat-quartz.vercel.app`）
   - 点击可以访问网站

#### 步骤 5: 配置自定义域名

**如果使用 lize.chat：**

1. **进入项目设置**
   - 点击项目 → **Settings** → **Domains**

2. **添加域名**
   - 点击 **"Add Domain"**
   - 输入：`lize.chat`
   - 点击 **"Add"**

3. **配置 DNS**
   - Vercel 会显示需要添加的 DNS 记录
   - 通常是 CNAME 记录指向 Vercel
   - 在你的域名注册商处添加这些记录

4. **等待生效**
   - DNS 传播通常需要几分钟到几小时
   - 可以在 Vercel Dashboard 中查看状态

### 方法 2: 检查现有项目

如果项目已存在但部署失败：

1. **访问 Vercel Dashboard**
   - https://vercel.com/dashboard

2. **找到项目**
   - 搜索：`lize-chat-quartz`

3. **检查部署状态**
   - 点击项目 → **Deployments**
   - 查看最新的部署记录

4. **如果部署失败**
   - 点击失败的部署
   - 查看 **"Build Logs"** 了解错误原因
   - 修复问题后点击 **"Redeploy"**

5. **如果没有部署记录**
   - 点击 **"Deployments"** → **"Create Deployment"**
   - 或推送新代码触发自动部署

## 🔍 验证部署

部署成功后：

1. **访问 Vercel 提供的 URL**
   - 格式：`项目名.vercel.app`
   - 或：`lize.chat`（如果已配置域名）

2. **检查内容**
   - ✅ 应该显示"欢迎来到丽泽讲会"
   - ✅ 主题颜色：极客蓝 (#0070f3)
   - ✅ 2.5D 阴影效果

3. **检查 RSS Feed**
   - 访问：`https://你的域名/index.xml`
   - 应该显示 RSS feed 内容

## 📝 配置文件确认

确保以下文件存在且正确：

### vercel.json ✅
```json
{
  "buildCommand": "npm run build",
  "outputDirectory": "public",
  "installCommand": "npm install"
}
```

### package.json ✅
```json
{
  "scripts": {
    "build": "node quartz/bootstrap-cli.mjs build"
  }
}
```

## 🐛 常见问题

### 问题 1: 找不到 GitHub 仓库

**解决：**
- 确认仓库名称：`sing2sky/lize-chat-quartz`
- 确认仓库是 Public 或已授权 Vercel 访问
- 在 Vercel 中调整 GitHub App 权限

### 问题 2: 构建失败

**检查：**
- 查看构建日志中的错误信息
- 确认 Node.js 版本 >= 22
- 确认 `package.json` 中有 `build` 脚本

### 问题 3: 域名不生效

**检查：**
- DNS 记录是否正确配置
- 等待 DNS 传播（可能需要几小时）
- 在 Vercel Dashboard 中查看域名状态

## 🚀 快速操作

### 如果项目已存在：

```powershell
cd D:\lize-chat\quartz
git add .
git commit -m "Trigger deployment"
git push origin main
```

这会触发 Vercel 自动部署。

### 如果项目不存在：

1. 访问：https://vercel.com/new
2. 导入：`sing2sky/lize-chat-quartz`
3. 配置：Build Command = `npm run build`
4. 部署：点击 "Deploy"

## ✅ 部署检查清单

- [ ] GitHub 仓库存在：`sing2sky/lize-chat-quartz`
- [ ] Vercel 账号已登录
- [ ] 项目已在 Vercel 中创建
- [ ] 构建配置正确
- [ ] 部署成功（查看构建日志）
- [ ] 域名已配置（如果使用 lize.chat）
- [ ] DNS 记录已添加（如果使用自定义域名）
- [ ] 网站可以访问

## 📞 下一步

1. **立即操作**：访问 https://vercel.com/new
2. **导入仓库**：选择 `sing2sky/lize-chat-quartz`
3. **配置并部署**：按照上述步骤操作
4. **等待完成**：通常 1-2 分钟
5. **访问网站**：使用 Vercel 提供的 URL 或 lize.chat

部署完成后，404 错误就会消失！
