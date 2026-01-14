# Vercel 清除构建缓存 - 详细步骤

## 📍 方法 1: 通过项目设置清除缓存（推荐）

### 步骤：

1. **登录 Vercel Dashboard**
   - 访问：https://vercel.com/dashboard
   - 使用你的 GitHub 账号登录

2. **找到你的项目**
   - 在项目列表中，找到并点击 `lize-chat-quartz` 项目

3. **进入项目设置**
   - 点击项目页面顶部的 **"Settings"** 标签页

4. **找到构建设置**
   - 在左侧菜单中，找到并点击 **"Build & Development Settings"**

5. **清除构建缓存**
   - 向下滚动，找到 **"Build Cache"** 部分
   - 点击 **"Clear Build Cache"** 按钮
   - 确认清除操作

6. **重新部署**
   - 清除缓存后，进入 **"Deployments"** 标签页
   - 点击最新部署右侧的 **"..."** 菜单
   - 选择 **"Redeploy"**

## 📍 方法 2: 通过部署页面重新部署（自动清除）

### 步骤：

1. **进入部署页面**
   - 访问：https://vercel.com/dashboard
   - 点击 `lize-chat-quartz` 项目
   - 点击顶部的 **"Deployments"** 标签页

2. **重新部署**
   - 找到最新的部署记录
   - 点击部署记录右侧的 **"..."**（三个点）菜单
   - 选择 **"Redeploy"**
   - 在弹出窗口中，勾选 **"Use existing Build Cache"** 的**反选**（即不勾选）
   - 点击 **"Redeploy"**

## 📍 方法 3: 通过 Vercel CLI（如果已安装）

### 步骤：

```bash
# 安装 Vercel CLI（如果还没有）
npm i -g vercel

# 登录
vercel login

# 清除缓存并重新部署
vercel --force
```

## 🎯 推荐操作流程

### 最简单的方法：

1. **访问项目**
   - https://vercel.com/dashboard
   - 点击 `lize-chat-quartz` 项目

2. **重新部署**
   - 点击 **"Deployments"** 标签页
   - 点击最新部署的 **"..."** → **"Redeploy"**
   - **不要勾选** "Use existing Build Cache"
   - 点击确认

3. **等待部署完成**
   - 通常需要 1-2 分钟
   - 查看构建日志确认成功

4. **清除浏览器缓存**
   - 访问 https://lize.chat
   - 按 `Ctrl + Shift + R` 硬刷新

## 📸 界面位置说明

### Settings 页面路径：
```
Vercel Dashboard
  └─ 你的项目 (lize-chat-quartz)
      └─ Settings (顶部标签页)
          └─ Build & Development Settings (左侧菜单)
              └─ Build Cache 部分
                  └─ Clear Build Cache 按钮
```

### Deployments 页面路径：
```
Vercel Dashboard
  └─ 你的项目 (lize-chat-quartz)
      └─ Deployments (顶部标签页)
          └─ 最新部署记录
              └─ ... (三个点菜单)
                  └─ Redeploy
```

## ⚠️ 注意事项

1. **清除缓存会重新构建**
   - 构建时间可能会稍长一些
   - 但可以确保使用最新的配置

2. **如果找不到 "Clear Build Cache" 按钮**
   - 可能是 Vercel 界面更新了
   - 可以直接使用 "Redeploy" 方法（方法 2）
   - 在 Redeploy 时不勾选缓存选项即可

3. **构建日志**
   - 重新部署后，点击部署记录可以查看构建日志
   - 确认构建成功且没有错误

## 🔍 如果仍然找不到

### 替代方案：

1. **直接推送新提交触发部署**
   ```powershell
   cd D:\lize-chat\quartz
   git commit --allow-empty -m "Trigger rebuild"
   git push origin main
   ```

2. **联系 Vercel 支持**
   - 如果界面确实找不到该选项
   - 可以通过 Vercel Dashboard 的 Help 联系支持

## ✅ 验证缓存已清除

重新部署后，检查构建日志：
- 应该看到 "Cleaning up previous outputs" 或类似信息
- 构建时间应该和首次部署类似（不会特别快）
