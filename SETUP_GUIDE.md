# Quartz 4.0 完整设置指南

## ✅ 已完成的任务

### 1. ✅ 品牌化定制

- **网站标题**：已改为 "丽泽讲会"
- **基准 URL**：已设置为 "lize.chat"
- **语言设置**：已改为 "zh-CN"
- **主题颜色**：已应用医药深蓝色 (#1d3557)
- **2.5D 风格**：已添加边框阴影效果

### 2. ⏳ 待完成的任务

#### 步骤 1: 关联 Obsidian 仓库

**方法 A：使用脚本（推荐）**

```powershell
cd D:\lize-chat\quartz
.\link-obsidian.ps1
```

然后输入你的 Obsidian 仓库路径，例如：
```
D:\Documents\Obsidian Vault\lizechat
```

**方法 B：手动创建链接**

```powershell
cd D:\lize-chat\quartz
# 备份现有 content（如果存在）
if (Test-Path "content") { Rename-Item -Path "content" -NewName "content.backup" }
# 创建目录链接
cmd /c mklink /J "content" "你的Obsidian仓库路径"
```

**方法 C：使用 Quartz 命令**

```powershell
cd D:\lize-chat\quartz
npx quartz create -X symlink -s "你的Obsidian仓库路径"
```

#### 步骤 2: Git 初始化和推送到 GitHub

**前提条件**：需要先安装 Git
- 下载：https://git-scm.com/download/win
- 安装后重启终端

**执行步骤**：

```bash
cd D:\lize-chat\quartz

# 1. 初始化 Git 仓库
git init

# 2. 添加所有文件
git add .

# 3. 提交
git commit -m "Initial quartz setup: 丽泽讲会"

# 4. 创建 GitHub 仓库
# 访问 https://github.com/new
# 创建新仓库（例如：my-quartz-garden）
# 不要初始化 README、.gitignore 或 license

# 5. 关联远程仓库（替换为你的仓库地址）
git branch -M main
git remote add origin https://github.com/你的用户名/仓库名.git
git push -u origin main
```

#### 步骤 3: 配置 Vercel 部署

1. **访问 Vercel**：https://vercel.com
2. **导入项目**：
   - 点击 "Add New..." → "Project"
   - 选择你的 GitHub 仓库
   - Framework Preset: **Other**
   - Build Command: `npm run quartz build`
   - Output Directory: `public`
   - Install Command: `npm install`
3. **环境变量**（如果需要）：
   - 通常不需要额外配置
4. **部署**：
   - 点击 "Deploy"
   - 等待部署完成
   - 访问生成的 URL

## 🎨 自定义配置

### 修改网站标题和描述

编辑 `quartz.config.ts`：
```typescript
pageTitle: "丽泽讲会",
pageTitleSuffix: " | 思想的流转与碰撞",
```

### 修改主题颜色

编辑 `quartz.config.ts` 中的 `colors` 部分，或修改 `quartz/styles/custom.scss`

### 添加自定义样式

编辑 `quartz/styles/custom.scss` 文件

## 📝 添加内容

1. **如果使用 Obsidian 链接**：
   - 直接在 Obsidian 中编辑笔记
   - Quartz 会自动读取更新

2. **如果使用本地 content 目录**：
   - 将 Markdown 文件放入 `content/` 目录
   - 运行 `npm run quartz build` 重新构建

## 🚀 本地预览

```bash
cd D:\lize-chat\quartz
npm run quartz build --serve
```

访问：http://localhost:8080

## 📚 参考文档

- Quartz 官方文档：https://quartz.jzhao.xyz/
- 配置指南：https://quartz.jzhao.xyz/configuration
- 插件列表：https://quartz.jzhao.xyz/plugins
