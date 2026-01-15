# 📝 文章发布工作流程指南

## 🚀 三种便捷方案

### 方案 1: 使用快速脚本（推荐新手）

#### 创建新文章
```powershell
cd D:\lize-chat\quartz
.\new-article.ps1
```

脚本会引导你：
1. 输入文章标题
2. 输入文章描述（可选）
3. 输入标签（可选，用逗号分隔）
4. 自动生成 frontmatter 模板
5. 创建文件并打开编辑器

#### 编辑现有文章
```powershell
.\edit-article.ps1
```

脚本会：
1. 列出所有文章
2. 让你选择要编辑的文章
3. 自动打开文件（使用系统默认编辑器）

#### 快速构建和预览
```powershell
.\quick-build.ps1
```

脚本会：
1. 构建网站
2. 询问是否启动预览服务器
3. 自动打开浏览器预览

---

### 方案 2: 使用 Obsidian（最推荐，功能最强大）

Obsidian 是 Quartz 官方推荐的编辑器，提供：
- ✨ 美观的 Markdown 编辑器
- 🔗 图形化链接预览
- 📊 知识图谱可视化
- 🎨 实时预览
- 📁 文件管理

#### 设置步骤

1. **下载 Obsidian**
   - 访问：https://obsidian.md/
   - 下载并安装

2. **链接 Obsidian 仓库**
   ```powershell
   cd D:\lize-chat\quartz
   .\link-obsidian.ps1
   ```
   
   输入你的 Obsidian 仓库路径，例如：
   ```
   D:\Documents\Obsidian Vault\lizechat
   ```

3. **在 Obsidian 中编辑**
   - 直接在 Obsidian 中创建和编辑笔记
   - 支持所有 Obsidian 功能（双链、标签、关系图等）
   - 保存后运行 `npm run build` 即可发布

**优势：**
- 一次设置，长期使用
- 功能强大，写作体验最佳
- 支持双链、图谱等高级功能
- 可以管理大量笔记

---

### 方案 3: 直接编辑文件（最简单）

如果你习惯使用其他编辑器（VS Code、Typora 等）：

1. **创建新文章**
   - 在 `content/` 目录下创建 `.md` 文件
   - 复制以下模板：

   ```markdown
   ---
   title: 文章标题
   date: 2025-01-14
   description: 文章描述
   tags:
     - 标签1
     - 标签2
   draft: false
   ---

   # 文章标题

   这里是文章内容...
   ```

2. **编辑文章**
   - 直接用编辑器打开 `content/` 目录下的 `.md` 文件
   - 编辑并保存

3. **构建发布**
   ```powershell
   npm run build
   ```

---

## 📋 完整工作流程示例

### 使用脚本的完整流程

```powershell
# 1. 创建新文章
.\new-article.ps1

# 2. 编辑文章（如果需要）
.\edit-article.ps1

# 3. 构建并预览
.\quick-build.ps1

# 4. 推送到 GitHub（如果配置了自动部署）
git add .
git commit -m "发布新文章: 标题"
git push
```

### 使用 Obsidian 的完整流程

1. 在 Obsidian 中创建/编辑笔记
2. 保存文件
3. 运行构建：
   ```powershell
   npm run build
   ```
4. 推送到 GitHub（自动部署）

---

## 💡 实用技巧

### 1. 文章模板

新文章建议包含的 frontmatter：
```yaml
---
title: 文章标题
date: YYYY-MM-DD
description: 文章描述（用于 SEO 和链接预览）
tags:
  - 标签1
  - 标签2
draft: false  # true 表示草稿，不会发布
---
```

### 2. 图片管理

- 图片放在 `content/` 目录下
- 在文章中使用：`![[图片名.jpg]]` 或 `![描述](图片名.jpg)`
- 图片会自动复制到网站

### 3. 文章链接

- 内部链接：`[[文章标题]]`
- 外部链接：`[链接文本](https://example.com)`

### 4. 草稿模式

如果文章未完成，设置 `draft: true`，文章将不会出现在网站中。

---

## 🎯 推荐方案

- **新手/偶尔发布**：使用快速脚本（方案 1）
- **经常写作/大量内容**：使用 Obsidian（方案 2）
- **习惯特定编辑器**：直接编辑文件（方案 3）

---

## 📚 相关文档

- [内容创作指南](docs/authoring%20content.md)
- [本地预览指南](LOCAL_PREVIEW.md)
- [部署指南](DEPLOY_NOW.md)
