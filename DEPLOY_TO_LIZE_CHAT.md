# 将 Quartz 项目部署到 lize.chat

## 当前情况

- **旧项目**：`lize-chat-astro` (Astro) - 当前部署在 lize.chat
- **新项目**：`quartz` (Quartz 4.0) - 需要部署到 lize.chat

## 部署步骤

### 方法 1: 在 Vercel 中切换项目（推荐）

1. **访问 Vercel Dashboard**
   - 登录 https://vercel.com
   - 找到 lize.chat 项目

2. **更新项目设置**
   - 进入项目设置 (Settings)
   - 在 "General" 标签页中：
     - **Root Directory**: 设置为 `quartz`（如果项目在 monorepo 中）
     - 或者直接删除旧项目，导入新项目

3. **更新构建配置**
   - **Build Command**: `npm run quartz build`
   - **Output Directory**: `public`
   - **Install Command**: `npm install`
   - **Framework Preset**: Other

4. **重新部署**
   - 点击 "Deployments" → "Redeploy"
   - 或推送代码到 GitHub 触发自动部署

### 方法 2: 创建新的 Vercel 项目并更新域名

1. **推送 Quartz 项目到 GitHub**
   ```bash
   cd D:\lize-chat\quartz
   git init
   git add .
   git commit -m "Initial commit: Quartz 4.0 with tech theme"
   git branch -M main
   git remote add origin https://github.com/你的用户名/quartz-lize-chat.git
   git push -u origin main
   ```

2. **在 Vercel 中导入新项目**
   - 访问 https://vercel.com/new
   - 选择 GitHub 仓库（quartz-lize-chat）
   - 配置：
     - **Framework Preset**: Other
     - **Build Command**: `npm run quartz build`
     - **Output Directory**: `public`
     - **Install Command**: `npm install`

3. **配置域名**
   - 在项目设置中添加域名 `lize.chat`
   - 更新 DNS 记录（如果需要）

### 方法 3: 使用 Vercel CLI

```bash
# 安装 Vercel CLI
npm i -g vercel

# 进入 Quartz 项目目录
cd D:\lize-chat\quartz

# 部署
vercel

# 生产环境部署
vercel --prod
```

## 重要提示

1. **确保 Git 已初始化**
   - Quartz 需要 Git 来追踪文件修改日期
   - 运行 `git init` 和 `git add .`

2. **检查构建输出**
   - 本地测试：`npm run quartz build`
   - 确保 `public` 目录生成成功

3. **内容目录**
   - 如果使用 Obsidian 链接，确保链接正确
   - 或者将内容文件放入 `content/` 目录

4. **环境变量**
   - 通常不需要额外配置
   - 如果使用自定义域名，确保 `baseUrl` 在 `quartz.config.ts` 中正确设置

## 验证部署

部署完成后：
1. 访问 https://lize.chat
2. 检查主题颜色是否为极客蓝 (#0070f3)
3. 检查 2.5D 阴影效果是否生效
4. 检查网站标题是否为 "丽泽讲会"

## 回滚（如果需要）

如果新部署有问题，可以在 Vercel Dashboard 中：
1. 进入 "Deployments"
2. 找到之前的成功部署
3. 点击 "..." → "Promote to Production"
