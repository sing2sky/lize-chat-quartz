# 🚀 快速部署 Quartz 到 lize.chat

## 当前状态

✅ **Quartz 项目已配置完成**
- 主题色已改为极客蓝 (#0070f3) 和深空灰蓝 (#1a202c)
- 2.5D 科技风格已应用
- Vercel 配置文件已创建 (`vercel.json`)

⚠️ **lize.chat 目前仍显示旧内容**（Astro 项目）

## 部署步骤（3 步）

### 步骤 1: 推送 Quartz 项目到 GitHub

```powershell
cd D:\lize-chat\quartz

# 初始化 Git（如果还没有）
git init

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: Quartz 4.0 with tech theme for lize.chat"

# 创建 GitHub 仓库（在浏览器中）
# 访问: https://github.com/new
# 仓库名: quartz-lize-chat（或你喜欢的名字）
# 不要初始化 README、.gitignore 或 license

# 关联远程仓库（替换为你的用户名和仓库名）
git branch -M main
git remote add origin https://github.com/你的用户名/quartz-lize-chat.git
git push -u origin main
```

### 步骤 2: 在 Vercel 中更新项目

**选项 A: 更新现有 lize.chat 项目**

1. 访问 https://vercel.com/dashboard
2. 找到 **lize.chat** 项目
3. 进入 **Settings** → **General**
4. 更新以下设置：
   - **Root Directory**: 如果项目在 monorepo 中，设置为 `quartz`
   - **Build Command**: `npm run quartz build`
   - **Output Directory**: `public`
   - **Install Command**: `npm install`
5. 进入 **Git** 标签页，更新连接的仓库为新的 Quartz 仓库
6. 点击 **Deployments** → **Redeploy**

**选项 B: 创建新项目并更新域名**

1. 访问 https://vercel.com/new
2. 导入新的 GitHub 仓库（quartz-lize-chat）
3. 配置：
   - **Framework Preset**: Other
   - **Build Command**: `npm run quartz build`
   - **Output Directory**: `public`
   - **Install Command**: `npm install`
4. 在项目设置中添加域名 `lize.chat`
5. 部署

### 步骤 3: 验证部署

部署完成后（通常 1-2 分钟）：
1. 访问 https://lize.chat
2. 检查：
   - ✅ 网站标题是否为 "丽泽讲会"
   - ✅ 主题色是否为极客蓝 (#0070f3)
   - ✅ 2.5D 阴影效果是否生效
   - ✅ 整体风格是否更具科技感

## 如果遇到问题

### Git 未安装
```powershell
# 下载安装 Git
# https://git-scm.com/download/win
# 安装后重启终端
```

### 构建失败
```powershell
# 本地测试构建
cd D:\lize-chat\quartz
npm run quartz build

# 检查 public 目录是否生成
# 如果失败，查看错误信息
```

### 内容为空
- 确保 `content/` 目录有 Markdown 文件
- 或运行 `.\link-obsidian.ps1` 链接 Obsidian 仓库

## 回滚（如果需要）

如果新部署有问题：
1. 访问 Vercel Dashboard
2. 进入 **Deployments**
3. 找到之前的成功部署
4. 点击 **...** → **Promote to Production**

## 后续更新

每次更新内容后：
```powershell
cd D:\lize-chat\quartz
git add .
git commit -m "Update content"
git push
```

Vercel 会自动重新部署。
