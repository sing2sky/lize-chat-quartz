# Git 设置和推送指南

## ⚠️ 当前状态

Git 未安装或不在系统 PATH 中。需要先安装 Git 才能推送代码到 GitHub。

## 📥 步骤 1: 安装 Git

1. **下载 Git for Windows**
   - 访问：https://git-scm.com/download/win
   - 下载最新版本的 Git for Windows

2. **安装 Git**
   - 运行下载的安装程序
   - 使用默认设置即可（一路 Next）
   - **重要**：确保选择 "Add Git to PATH" 选项

3. **验证安装**
   - 关闭并重新打开 PowerShell 或终端
   - 运行：`git --version`
   - 如果显示版本号，说明安装成功

## 🚀 步骤 2: 推送代码到 GitHub

### 方法 A: 使用自动化脚本（推荐）

1. **运行脚本**：
   ```powershell
   cd D:\lize-chat\quartz
   .\push-to-github.ps1
   ```

2. **按提示操作**：
   - 脚本会自动检查 Git
   - 初始化仓库（如果需要）
   - 添加文件
   - 提交更改
   - 提示你输入 GitHub 仓库 URL
   - 自动推送到 GitHub

### 方法 B: 手动执行命令

```powershell
# 1. 进入项目目录
cd D:\lize-chat\quartz

# 2. 初始化 Git 仓库
git init

# 3. 检查 .gitignore（已确认包含 node_modules）
# .gitignore 文件已存在且正确配置

# 4. 添加所有文件
git add .

# 5. 提交
git commit -m "Initial commit: Quartz 4.0 with tech theme for lize.chat"

# 6. 设置主分支
git branch -M main

# 7. 添加远程仓库（替换为你的实际 URL）
git remote add origin https://github.com/你的用户名/lize-chat-quartz.git

# 8. 推送到 GitHub
git push -u origin main
```

## 📋 步骤 3: 创建 GitHub 仓库

如果还没有创建 GitHub 仓库：

1. **访问 GitHub**
   - 登录 https://github.com
   - 点击右上角的 "+" → "New repository"

2. **创建仓库**
   - Repository name: `lize-chat-quartz`
   - Description: `Quartz 4.0 digital garden for lize.chat`
   - **重要**：选择 **Public** 或 **Private**（根据你的需求）
   - **不要**勾选：
     - ❌ Initialize this repository with a README
     - ❌ Add .gitignore
     - ❌ Choose a license
   - 点击 "Create repository"

3. **复制仓库 URL**
   - 创建后会显示仓库 URL
   - 格式：`https://github.com/你的用户名/lize-chat-quartz.git`

## ✅ 验证推送

推送成功后：

1. **访问 GitHub 仓库**
   - 打开：https://github.com/你的用户名/lize-chat-quartz
   - 应该能看到所有文件

2. **检查文件**
   - ✅ 应该看到 `quartz.config.ts`
   - ✅ 应该看到 `package.json`
   - ✅ 应该看到 `quartz/` 目录
   - ❌ **不应该**看到 `node_modules/`（已在 .gitignore 中）

## 🔧 故障排除

### 问题 1: "git: command not found"
**解决**：Git 未安装或未添加到 PATH
- 重新安装 Git，确保选择 "Add Git to PATH"
- 重启终端

### 问题 2: "Permission denied"
**解决**：需要配置 Git 用户信息
```powershell
git config --global user.name "你的名字"
git config --global user.email "你的邮箱"
```

### 问题 3: "Repository not found"
**解决**：
- 确保仓库 URL 正确
- 确保仓库已创建
- 检查是否有访问权限

### 问题 4: "Authentication failed"
**解决**：需要配置 GitHub 认证
- 使用 Personal Access Token（推荐）
- 或使用 GitHub Desktop
- 或配置 SSH 密钥

## 📝 .gitignore 确认

已确认 `.gitignore` 文件包含以下内容（正确配置）：
- ✅ `node_modules` - 不会上传
- ✅ `public` - 构建输出目录
- ✅ `.obsidian` - Obsidian 配置
- ✅ `.quartz-cache` - Quartz 缓存

## 🎯 下一步

推送成功后：
1. 在 Vercel 中导入这个 GitHub 仓库
2. 配置部署设置（参考 `QUICK_DEPLOY.md`）
3. 将 lize.chat 域名指向新部署
