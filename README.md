# 🛠 开发者工具箱

> 一个 URL 搞定日常开发需求。不装客户端、不注册账号、不配环境。
> API · Bookmarklet · CLI · Web 工具，总有一个用得上。

<p align="center">
  <a href="https://boluo66.top/toolkit/"><b>🌐 在线体验</b></a>
  ·
  <a href="https://github.com/VeteranBoLuo/tools/stargazers"><img src="https://img.shields.io/github/stars/VeteranBoLuo/tools?style=flat" alt="Stars"></a>
  ·
  <img src="https://img.shields.io/badge/tools-24-success" alt="24 tools">
  ·
  <img src="https://img.shields.io/badge/license-MIT-blue" alt="MIT">
</p>

---

## 为什么要做这个工具箱

日常开发中经常遇到这些场景：

- **要看一个网站的 favicon？** 打开浏览器→右键查看元素→翻半天，不如 `GET /favimg/?url=xxx`
- **想查域名的 NS 记录？** 装 dig → 记参数，不如 `GET /dns/?domain=xxx&type=NS`
- **页面禁止复制？** 打开控制台→找解除代码，不如拖个 Bookmarklet 一键搞定
- **项目总共有多少行代码？** `npx git-heat` 一行命令就出年报

**每一个工具解决一个具体问题，用完就走，不留下任何包袱。**

---

## 📦 工具一览

### API — 改 URL 就出结果

| 工具 | 示例 | 说明 |
|---|---|---|
| **favimg · 图标获取** | `GET /favimg/?url=xxx` | 一行 URL，一张 favicon |
| **ip · 地理位置** | `GET /ip/?ip=xxx` | 返回国家、城市、ISP、ASN |
| **uptime · 网站监测** | `GET /uptime/?url=xxx` | 状态码、响应耗时、SSL 到期日 |
| **metadata · 元数据提取** | `GET /metadata/?url=xxx` | title、OG 标签、favicon、h1-h3 |
| **dns · DNS 查询** | `GET /dns/?domain=xxx&type=A` | 10 种 DNS 记录类型 |
| **security · 安全检测** | `GET /security/?url=xxx` | 9 项安全头加权评分 + TLS 分析 |
| **whois · 域名信息** | `GET /whois/?domain=xxx` | 注册商、创建/到期日、DNS 服务器 |
| **read · 正文提取** | `GET /read/?url=xxx` | Mozilla Readability 去广告正文 |

### Bookmarklet — 拖到收藏栏，随时可用

| 工具 | 说明 |
|---|---|
| **panda · 熊猫模式** | 页面变黑白，去色彩干扰专注阅读 |
| **uncopy · 复制解除** | 一键解除禁止复制、右键、选中 |
| **linkcheck · 断链检测** | 扫描页面所有链接，标记断链 |
| **all-links · 页面链接提取** | 提取当前页面所有链接 |
| **imgextract · 图片批量提取** | 一键提取全部图片，支持 ZIP 打包 |
| **cookies · Cookie 管理器** | 查看、搜索、编辑、删除 Cookie |
| **lsstorage · LocalStorage 管理器** | 查看、搜索、编辑、删除 LocalStorage |

> 使用方式：打开 [工具箱页面](https://boluo66.top/toolkit/)，把对应按钮拖到浏览器收藏栏，以后在任何页面点击即可使用。

### CLI — 一行命令

| 工具 | 命令 |
|---|---|
| **git-heat · 年度报告** | `npx git-heat` |
| **rmport · 端口清理** | `npx rmport 3000` |

### 在线工具 — 打开即用

| 工具 | 地址 |
|---|---|
| **api-playground · 接口调试器** | [→ 打开](https://boluo66.top/toolkit/api-playground.html) |
| **mermaid-editor · 图表编辑器** | [→ 打开](https://boluo66.top/toolkit/mermaid-editor.html) |
| **code-preview · 代码截图** | [→ 打开](https://boluo66.top/toolkit/code-preview.html) |
| **timestamp · 时间戳转换** | [→ 打开](https://boluo66.top/toolkit/timestamp.html) |
| **palette · 配色生成** | [→ 打开](https://boluo66.top/toolkit/palette.html) |
| **diff · 文本对比** | [→ 打开](https://boluo66.top/toolkit/diff.html) |
| **regex-tester · 正则测试** | [→ 打开](https://boluo66.top/toolkit/regex-tester.html) |

---

<p align="center">
  <img src="https://boluo66.top/toolkit/screenshot-v3.png" alt="开发者工具箱截图" width="70%" style="border-radius: 12px" />
</p>

<p align="center">
  如果这些工具对你有帮助，欢迎 ⭐ Star 支持 ✨<br>
  想加什么工具？<a href="https://github.com/VeteranBoLuo/tools/issues">提 Issue →</a>
</p>
