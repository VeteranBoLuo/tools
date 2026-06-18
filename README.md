# 🛠 开发者日常工具箱

一个 API，多种能力。部署一次，到处使用。

```
https://boluo66.top/favimg/?url=xxx   →  网站图标
https://boluo66.top/qr/?content=xxx   →  二维码
https://boluo66.top/og/?url=xxx       →  分享卡片
```

## 设计理念

每个工具一个接口，**零配置、零依赖、零门槛**。

- 所有工具共享同一个域名，换路径切功能
- 统一 `?url=` / `?content=` 参数风格
- 返回即图片，直接嵌入 HTML / Markdown / 任何地方
- 浏览器打开就能用，不需要安装任何东西

## 工具列表

| 工具 | 一句话 | 示例 |
|---|---|---|
| [favimg](https://github.com/VeteranBoLuo/favimg) | 获取任意网站图标 | `/?url=github.com` → 图标 |
| [qr](https://github.com/VeteranBoLuo/qr) | 任意内容生成二维码 | `/?content=hello` → 二维码 |
| [og](https://github.com/VeteranBoLuo/og) | 链接转分享预览卡片 | `/?url=xxx` → 预览卡片 |

## Q&A

**这是 SaaS 吗？**

不是。这是开源的、自己部署的 API 集合。每个工具代码只有几十行，纯 Node.js，零外部付费依赖。

**为什么不做成 npm 包？**

API 形式更通用。一个 URL 可以被任何语言调用（HTML img、Markdown、curl、Python、Swift），不局限于 Node.js 生态。

**代码在哪？**

代码在私有仓库，公开仓库仅展示使用方式和效果。

---

→ 想加新工具？[提 Issue](https://github.com/VeteranBoLuo/tools/issues)
