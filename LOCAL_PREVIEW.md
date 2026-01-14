# 本地预览指南

## 🚀 启动本地开发服务器

### 方法 1: 构建并预览（推荐）

```powershell
cd D:\lize-chat\quartz
npm run build --serve
```

或：

```powershell
node quartz/bootstrap-cli.mjs build --serve
```

### 方法 2: 仅构建（不启动服务器）

```powershell
npm run build
```

然后使用其他静态文件服务器（如 `npx serve public`）

## 🌐 访问地址

- **本地预览**: http://localhost:8080
- **如果端口被占用**: Quartz 会自动选择其他端口（如 8081, 8082 等）
- **查看终端输出**: 确认实际使用的端口号

## 📋 当前内容

网站首页包含：
- ✅ 标题：欢迎来到丽泽讲会
- ✅ 描述：思想的流转与碰撞
- ✅ 极客蓝主题 (#0070f3)
- ✅ 2.5D 科技风格

## 🔄 更新内容

1. **修改内容文件**
   - 编辑 `content/` 目录下的 Markdown 文件
   - 或添加新文件

2. **重新构建**
   - 如果服务器在运行，修改会自动检测并重新构建
   - 或手动运行：`npm run build`

3. **刷新浏览器**
   - 按 `F5` 或 `Ctrl + R` 刷新页面

## 🛑 停止服务器

- 在运行服务器的终端中按 `Ctrl + C`
- 或关闭终端窗口

## 📝 添加内容

### 创建新笔记

在 `content/` 目录下创建 `.md` 文件：

```markdown
---
title: 我的笔记标题
date: 2025-01-14
description: 笔记描述
tags: [标签1, 标签2]
---

# 笔记内容

这里是你的笔记内容...
```

### 链接 Obsidian 仓库

```powershell
cd D:\lize-chat\quartz
.\link-obsidian.ps1
```

## ✅ 验证主题

打开网站后，检查：

- ✅ 链接颜色：极客蓝 (#0070f3)
- ✅ 标题颜色：深空灰蓝 (#1a202c)
- ✅ 2.5D 阴影效果：蓝色光晕
- ✅ 网站标题：丽泽讲会

## 🌍 生产环境

部署后的网站：
- **URL**: https://lize.chat
- **RSS Feed**: https://lize.chat/index.xml
