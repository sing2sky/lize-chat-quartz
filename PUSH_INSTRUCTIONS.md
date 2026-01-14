# 📤 推送代码到 GitHub - 操作指南

## ✅ 已完成

- ✅ Git 已安装并配置
- ✅ 代码已提交（297 个文件）
- ✅ 主分支已设置为 `main`
- ✅ 远程仓库已添加（但需要确认用户名）

## ⚠️ 当前问题

远程仓库未找到，可能原因：
1. GitHub 用户名不正确
2. 仓库尚未创建

## 🔧 解决方案

### 步骤 1: 确认 GitHub 用户名

请告诉我你的 GitHub 用户名，或者运行以下命令查看：

```powershell
git config --get user.name
```

### 步骤 2: 创建 GitHub 仓库（如果还没有）

1. **访问 GitHub**
   - 打开：https://github.com/new

2. **创建新仓库**
   - Repository name: `lize-chat-quartz`
   - Description: `Quartz 4.0 digital garden for lize.chat`
   - 选择 Public 或 Private
   - **重要**：不要勾选以下选项：
     - ❌ Initialize this repository with a README
     - ❌ Add .gitignore
     - ❌ Choose a license
   - 点击 "Create repository"

### 步骤 3: 更新远程仓库 URL

根据你的实际 GitHub 用户名，运行：

```powershell
cd D:\lize-chat\quartz

# 删除现有远程仓库
git remote remove origin

# 添加正确的远程仓库（替换 YOUR_USERNAME 为你的实际用户名）
git remote add origin https://github.com/YOUR_USERNAME/lize-chat-quartz.git

# 验证
git remote -v
```

### 步骤 4: 推送代码

```powershell
git push -u origin main
```

## 🔐 如果遇到认证问题

如果推送时要求输入用户名和密码：

1. **使用 Personal Access Token（推荐）**
   - 访问：https://github.com/settings/tokens
   - 点击 "Generate new token (classic)"
   - 选择权限：`repo`（完整仓库权限）
   - 复制生成的 token
   - 推送时：
     - Username: 你的 GitHub 用户名
     - Password: 粘贴 token（不是密码）

2. **或使用 GitHub Desktop**
   - 下载：https://desktop.github.com/
   - 使用图形界面推送

## 📋 快速命令（替换 YOUR_USERNAME）

```powershell
cd D:\lize-chat\quartz
git remote remove origin
git remote add origin https://github.com/YOUR_USERNAME/lize-chat-quartz.git
git push -u origin main
```

## ✅ 验证推送成功

推送成功后：
1. 访问：https://github.com/YOUR_USERNAME/lize-chat-quartz
2. 应该能看到所有文件
3. 确认 `node_modules` 不在仓库中（已在 .gitignore 中）

## 🎯 下一步

推送成功后：
1. 在 Vercel 中导入这个 GitHub 仓库
2. 配置部署设置（参考 `QUICK_DEPLOY.md`）
3. 将 lize.chat 域名指向新部署
