# Vercel 部署修复说明

## 问题

错误：`Command "npm run quartz build" exited with 126`

错误代码 126 通常表示权限问题或命令无法执行。

## 解决方案

### 已修复的内容

1. **添加了 `build` 脚本到 `package.json`**
   ```json
   "build": "node quartz/bootstrap-cli.mjs build"
   ```

2. **更新了 `vercel.json`**
   - 从 `npm run quartz build` 改为 `npm run build`
   - 使用明确的 `node` 命令执行，避免权限问题

### 修复后的配置

**package.json:**
```json
{
  "scripts": {
    "build": "node quartz/bootstrap-cli.mjs build",
    "quartz": "./quartz/bootstrap-cli.mjs",
    ...
  }
}
```

**vercel.json:**
```json
{
  "buildCommand": "npm run build",
  "outputDirectory": "public",
  "installCommand": "npm install",
  "framework": null
}
```

## 下一步

1. **代码已推送到 GitHub**
   - 修复已提交并推送

2. **在 Vercel 中重新部署**
   - Vercel 会自动检测到新的提交
   - 或者手动触发重新部署：
     - 进入 Vercel Dashboard
     - 找到项目
     - 点击 "Redeploy"

3. **验证部署**
   - 检查构建日志，应该不再出现错误 126
   - 构建应该成功完成

## 如果仍有问题

### 检查 Node.js 版本

Quartz 4.0 需要 Node.js >= 22。在 Vercel 项目设置中：
- 进入 Settings → General
- 检查 Node.js Version
- 确保设置为 22.x 或更高

### 检查构建日志

如果仍有问题，查看 Vercel 构建日志中的详细错误信息。

### 替代方案

如果问题持续，可以尝试在 Vercel 项目设置中直接设置：
- **Build Command**: `node quartz/bootstrap-cli.mjs build`
- **Output Directory**: `public`
- **Install Command**: `npm install`
