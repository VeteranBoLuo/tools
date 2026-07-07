<h1 align="center">🛠 开发者工具箱</h1>

<p align="center">
  一个 URL 搞定日常开发需求 —— <b>不装客户端 · 不注册账号 · 不配环境</b><br>
  <sub>API · Bookmarklet · CLI · 在线工具 · 共 35 个小工具,总有一个用得上</sub>
</p>

<p align="center">
  <a href="https://boluo66.top/toolkit/"><img src="https://img.shields.io/badge/%E5%9C%A8%E7%BA%BF%E4%BD%93%E9%AA%8C-615ced?style=for-the-badge" alt="demo"></a>
  <img src="https://img.shields.io/badge/tools-35-3fb950?style=for-the-badge" alt="tools">
  <img src="https://img.shields.io/badge/dependencies-0-3fb950?style=for-the-badge" alt="deps">
  <a href="https://github.com/VeteranBoLuo/tools/stargazers"><img src="https://img.shields.io/github/stars/VeteranBoLuo/tools?style=for-the-badge&color=555&label=stars" alt="stars"></a>
  <img src="https://img.shields.io/badge/license-MIT-blue?style=for-the-badge" alt="MIT">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87-615ced?style=for-the-badge" alt="简体中文">
  <a href="README.en.md"><img src="https://img.shields.io/badge/English-555?style=for-the-badge" alt="English"></a>
  <a href="README.ja.md"><img src="https://img.shields.io/badge/%E6%97%A5%E6%9C%AC%E8%AA%9E-555?style=for-the-badge" alt="日本語"></a>
  <a href="README.ko.md"><img src="https://img.shields.io/badge/%ED%95%9C%EA%B5%AD%EC%96%B4-555?style=for-the-badge" alt="한국어"></a>
</p>

---

## ✨ 精选亮点

几个别处不好找、或者做得特别顺手的：

- **🌐 [myip · 本机 IP](https://boluo66.top/toolkit/myip.html)** —— 不只是查 IP。同时对比国内 / 国际多个回显源,**一眼看穿你走没走代理、是不是多出口分流**(国内看 A、国际看 B),还带 IPv6 与 WebRTC 本地地址探测。
- **🔒 cert · SSL 证书深检** —— 完整证书链、SAN 列表、密钥类型、TLS 版本、到期天数,一个 URL 全给你。
- **🌍 dnsprop · DNS 传播检测** —— 改了解析记录多久全网生效?并发查 Cloudflare / Google / Quad9 + 阿里 / DNSPod / 114 共 7 个解析器,对比是否一致。
- **📖 read · 正文提取** —— 去广告、去导航、去侧栏,任意网页只留干净正文。
- **🔀 trace · 重定向追踪** —— 完整跳转链,每一跳的状态码、耗时、Location,调 301/302 利器。

---

## 为什么要做这个工具箱

日常开发中经常遇到这些场景：

- **要看一个网站的 favicon？** 打开浏览器→右键查看元素→翻半天,不如 `GET /favimg/?url=xxx`
- **改了 DNS 想知道全网生效没？** 挨个换解析器测太累,不如 `GET /dnsprop/?domain=xxx` 一次对比 7 家
- **页面禁止复制？** 打开控制台→找解除代码,不如拖个 Bookmarklet 一键搞定
- **想看这个页面加载慢在哪？** 不用打开 DevTools 翻 Network,拖一下 `perf` 书签,耗时和资源体积直接列出来
- **项目总共有多少行代码？** `npx git-heat` 一行命令就出年报

**每一个工具解决一个具体问题,用完就走,不留下任何包袱。**

---

## 📦 工具一览

### API — 改 URL 就出结果

所有 API 都支持 `GET` 请求,返回 JSON 或图片。**无需 SDK、无需认证**,任何语言 / 平台都能用:

```html
<!-- 用 <img> 直接嵌入网站 -->
<img src="https://boluo66.top/favimg/?url=github.com" alt="图标">

<!-- 用 fetch 在页面中调用 -->
fetch('https://boluo66.top/ip/?ip=8.8.8.8').then(r => r.json())

<!-- 终端里一行命令 -->
curl https://boluo66.top/uptime/?url=example.com
```

| 工具 | 示例 | 返回 | 说明 |
|---|---|---|---|
| **favimg · 图标获取** | `GET /favimg/?url=xxx` | 图片 | 一行 URL,一张 favicon |
| **ip · 地理位置** | `GET /ip/?ip=xxx` | JSON | 国家、城市、ISP、ASN,支持 `&lang=zh-CN` |
| **uptime · 网站监测** | `GET /uptime/?url=xxx` | JSON | 状态码、响应耗时、SSL 到期日 |
| **security · 安全检测** | `GET /security/?url=xxx` | JSON | 9 项安全头加权评分 + TLS 分析 |
| **cert · SSL 证书深检** | `GET /cert/?host=xxx` | JSON | 完整证书链、SAN、密钥类型、TLS 版本 |
| **trace · 重定向追踪** | `GET /trace/?url=xxx` | JSON | 完整跳转链 + 每跳耗时 + 终点响应头 |
| **dns · DNS 查询** | `GET /dns/?domain=xxx&type=A` | JSON | 10 种 DNS 记录类型,A/AAAA 带真实 TTL |
| **dnsprop · DNS 传播检测** | `GET /dnsprop/?domain=xxx` | JSON | 7 个全球 / 国内解析器并发对比 |
| **whois · 域名信息** | `GET /whois/?domain=xxx` | JSON | 注册商、创建 / 到期日、DNS 服务器 |
| **metadata · 元数据提取** | `GET /metadata/?url=xxx` | JSON | title、OG 标签、favicon、h1-h3、所有 link |
| **read · 正文提取** | `GET /read/?url=xxx` | JSON | Mozilla Readability 去广告正文 |

### Bookmarklet — 拖到收藏栏，随时可用

在**任意网页**点击即可运行,纯前端、不上传:

| 工具 | 说明 |
|---|---|
| **perf · 页面性能快照** | 该页加载耗时(DNS/TCP/TTFB/DOM/完全加载)+ 资源数量与体积 |
| **seo · 页内 SEO 速检** | 标题 / 描述长度、H1、canonical、缺 alt 图、OG、字数,逐项红黄绿 |
| **table2csv · 表格转 CSV** | 抓取页面任意表格,一键复制或下载为 CSV |
| **linkcheck · 断链检测** | 扫描页面所有链接,标记断链 |
| **all-links · 页面链接提取** | 提取当前页面所有链接 |
| **imgextract · 图片批量提取** | 一键提取全部图片,支持 ZIP 打包 |
| **cookies · Cookie 管理器** | 查看、搜索、编辑、删除 Cookie |
| **lsstorage · LocalStorage 管理器** | 查看、搜索、编辑、删除 LocalStorage |
| **panda · 熊猫模式** | 页面变黑白,去色彩干扰专注阅读 |
| **uncopy · 复制解除** | 一键解除禁止复制、右键、选中 |

> 使用方式:打开 [工具箱页面](https://boluo66.top/toolkit/),把对应按钮拖到浏览器收藏栏,以后在任何页面点击即可使用。

### CLI — 一行命令

| 工具 | 命令 |
|---|---|
| **git-heat · 年度报告** | `npx git-heat` |
| **rmport · 端口清理** | `npx rmport 3000` |

### 在线工具 — 打开即用

| 工具 | 说明 | |
|---|---|---|
| **myip · 本机 IP 查询** | 公网 IP + 多源国内 / 国际对比 + 分流检测 | [→ 打开](https://boluo66.top/toolkit/myip.html) |
| **jwt · JWT 解码 / 校验** | 解析 header/payload + HS256 签名校验 | [→ 打开](https://boluo66.top/toolkit/jwt.html) |
| **cidr · 子网计算器** | CIDR → 网段 / 掩码 / 广播 / 主机数 | [→ 打开](https://boluo66.top/toolkit/cidr.html) |
| **hash · Hash / 编码** | MD5 / SHA / Base64 / URL 编解码 | [→ 打开](https://boluo66.top/toolkit/hash.html) |
| **cron · Cron 解释器** | Crontab 翻译成人话 + 下次执行时间 | [→ 打开](https://boluo66.top/toolkit/cron.html) |
| **code-preview · 代码截图** | 粘贴代码导出精美截图 | [→ 打开](https://boluo66.top/toolkit/code-preview.html) |
| **timestamp · 时间戳转换** | Unix 时间戳 ↔ 日期 | [→ 打开](https://boluo66.top/toolkit/timestamp.html) |
| **palette · 配色生成** | 主色生成 8 种配色方案 | [→ 打开](https://boluo66.top/toolkit/palette.html) |
| **diff · 文本对比** | 两段文本差异高亮 | [→ 打开](https://boluo66.top/toolkit/diff.html) |
| **regex-tester · 正则测试** | 实时匹配 + 分组 + 计数 | [→ 打开](https://boluo66.top/toolkit/regex-tester.html) |
| **api-playground · 接口调试器** | 浏览器里发 REST 请求看响应 | [→ 打开](https://boluo66.top/toolkit/api-playground.html) |
| **mermaid-editor · 图表编辑器** | 写 Mermaid 实时预览,导出 SVG/PNG | [→ 打开](https://boluo66.top/toolkit/mermaid-editor.html) |

---

## 🔒 关于隐私与实现

- **API 工具**:零第三方依赖,服务端拦截内网 / 保留地址(SSRF 防护)。
- **Bookmarklet / 在线工具**:纯浏览器运行,你的输入(密钥、令牌、文本)**不上传服务器**。

---

<p align="center">
  <img src="https://boluo66.top/toolkit/screenshot-v3.png" alt="开发者工具箱截图" width="70%" style="border-radius: 12px" />
</p>

<p align="center">
  如果这些工具对你有帮助,欢迎 ⭐ Star 支持 ✨<br>
  想加什么工具？<a href="https://github.com/VeteranBoLuo/tools/issues">提 Issue →</a>
</p>
