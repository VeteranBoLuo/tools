# AGENTS.md — tools(展示页)AI 开发规范

给 AI / 协作者:改本仓库前**先读这份**。踩过的坑都在这。

## 这是什么

`boluo66.top/toolkit` 的**落地页 + 纯客户端工具**(Bookmarklet / Web 工具的 HTML)。
姊妹仓 [**toolkit**](https://github.com/VeteranBoLuo/toolkit)(本地 `../../toolkit/`)= 后端 API/CLI 实现,有自己的 AGENTS.md。

## ⚠️ 版本控制惯例:只跟踪 index.html + README.md

本仓库**故意只 git 跟踪 `index.html` 和 `README.md`**(见提交 `d5c0068`)。所有 Web 工具的 `.html`(myip/hash/cidr/jwt/cron/…)、`scripts/`、`og-image.svg` 都是**未跟踪但要部署**的文件。
→ 新增 Web 工具时**别 `git add` 那个 .html**;`deploy.sh` 靠 `git ls-files --others` 自动发现未跟踪 `*.html` 并部署。

## 部署

```bash
bash scripts/deploy.sh   # 先跑 validate.py,通过才部署
```
它:① `python3 scripts/validate.py` 自检(不过就中止);② scp `index.html` + 未跟踪 `*.html` 到 `root@139.9.83.16:/www/wwwroot/toolkit/`(SSH key `~/.ssh/hermes_server`)。

## validate.py 规矩(改完 index.html 必须先过)

- **JSON-LD `itemListElement` 数量必须 == `<article class="tool-card">` 卡片数**;加一张卡就要加一条 JSON-LD,并把 `numberOfItems` 一起改。
- position 必须 1..N 连续无重复。
- JS(第一个 `<script>`)括号 / 花括号平衡。
- **不得引用已删工具**:`'qr' / 'og' / 'gradient' / 'uuid' / previewGradient`(守卫会报错)。这四个是刻意删的,别复活。
- 导航圆点 `data-target` 必须有对应 `id`。

## ⚠️ Bookmarklet 铁律:`href="javascript:..."` 里不能有裸双引号 `"`

双引号会截断 HTML 属性 + 被 validate 拦。写法:
- JS 字符串一律**单引号**。
- innerHTML 里的 HTML 属性:用**不带引号**(`<div class=hd>`)或 `&quot;`。
- 若输出内容里确实要 `"` 字符(如 CSV 转义),用 `String.fromCharCode(34)`。
- 面板尽量用 `createElement` + `el.style.cssText` + `textContent` 构建,天然无引号问题。
- 写完先 `node --check`(去掉 `javascript:` 前缀),再从**线上**页面提取一遍确认没被 HTML 转义破坏。

## 卡片结构 & 接线

- 分类:**API / Bookmarklet / CLI / Web(在线)**,各有 `id="cat-api|cat-bm|cat-cli|cat-web"` 区块 + 顶部 `.cat-nav` 圆点。
- **API 卡**:有输入框 + 预览。要在主 `<script>` 的 `preview(tool)` 里加一个 `if (tool==='x')` 分支(渲染到 `#x-preview`),并在 `copyApiUrl` 处理参数;URL 类工具加进 `urlTools` 数组(自动补 https)。
- **Web 卡**:`<a href="/toolkit/<tool>.html" class="tool-link">打开工具 →</a>`,新建同名 `.html`(暗色主题,`:root` 变量见现有页,返回链接 `/toolkit/`)。
- **Bookmarklet 卡**:BM 徽章 + mockup 预览 + 可拖拽 `<a href="javascript:...(见上铁律)" draggable="true" ondragstart=...>`。
- **精选亮点 / README 链接**:指向落地页 `https://boluo66.top/toolkit/`(或 `#cat-api`)或工具的 `.html` 页——**绝不要直接链原始 API 端点**(点开是 JSON,体验差)。

## 新增一张卡的清单

1. 在对应分类区块插入 `<article class="tool-card">…</article>`。
2. JSON-LD:`numberOfItems` +1,追加一条 `{position:N+1, name:"x · 中文名"}`。
3. API 卡还要接 `preview()` / `copyApiUrl()`;Web 卡建 `.html`;BM 卡守好双引号铁律。
4. `python3 scripts/validate.py` 过。
5. `bash scripts/deploy.sh` 部署,curl `https://boluo66.top/toolkit/xxx` 验证。
6. README 同步(工具数 badge、分类表)。

## 杂项

- 截图 `screenshot-v3.png`(在服务器 `/www/wwwroot/toolkit/`)需手动重截更新,AI 无法生成。
- 客户端工具的输入(密钥/令牌/文本)不要上传服务器——纯浏览器处理是卖点。
- **README 有中英两版**:`README.md`(简体中文,默认)+ `README.en.md`(English),顶部互相切换。**改一版要同步另一版**(工具增删、数量 badge 都要一起改)。
