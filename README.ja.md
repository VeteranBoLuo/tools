# 🛠 開発者ツールボックス

[简体中文](README.md) · [English](README.en.md) · **日本語** · [한국어](README.ko.md)

> 日々の開発作業を URL ひとつで。**クライアント不要・登録不要・環境構築不要。**
> API · Bookmarklet · CLI · Web ツール、全 35 種、きっと役立つものが見つかります。

<p align="center">
  <a href="https://boluo66.top/toolkit/"><b>🌐 オンラインで試す</b></a>
  ·
  <a href="https://github.com/VeteranBoLuo/tools/stargazers"><img src="https://img.shields.io/github/stars/VeteranBoLuo/tools?style=flat" alt="Stars"></a>
  ·
  <img src="https://img.shields.io/badge/tools-35-success" alt="35 tools">
  ·
  <img src="https://img.shields.io/badge/dependencies-0-brightgreen" alt="zero deps">
  ·
  <img src="https://img.shields.io/badge/license-MIT-blue" alt="MIT">
</p>

---

## ✨ ハイライト

他ではなかなか無い、または特に使い心地の良いものをいくつか：

- **🌐 [myip · 自分の IP](https://boluo66.top/toolkit/myip.html)** —— 単なる IP 確認ではありません。国内・海外の複数のエコーソースを同時に照合し、**プロキシや分割ルーティングを使っているか一目で分かります**(ソース A は別の IP、ソース B はまた別）。IPv6 と WebRTC ローカルアドレス探索も。
- **🔒 cert · SSL 証明書チェック** —— 完全な証明書チェーン、SAN リスト、鍵種別、TLS バージョン、有効期限までの日数を URL ひとつで。
- **🌍 dnsprop · DNS 伝播チェック** —— DNS レコードを変更して反映されたか?Cloudflare / Google / Quad9 + AliDNS / DNSPod / 114(7 リゾルバ)を並列に問い合わせて比較。
- **📖 read · 本文抽出** —— 広告・ナビ・サイドバーを除去し、記事本文だけを残します。
- **🔀 trace · リダイレクト追跡** —— 完全なリダイレクトチェーン、各ホップのステータスコード・所要時間・Location。301/302 のデバッグに最適。

---

## なぜこのツールボックス

開発でよくある場面：

- **サイトの favicon が欲しい?** ブラウザで要素を調べて…より `GET /favimg/?url=xxx`
- **DNS 変更は反映された?** リゾルバを一つずつ試すのは面倒 —— `GET /dnsprop/?domain=xxx` で 7 つ一括比較
- **ページがコピー禁止?** コンソールで解除コードを探すより、Bookmarklet をドラッグしてワンクリック
- **このページ、どこが遅い?** DevTools の Network を開かなくても、`perf` ブックマークレットをドラッグすれば所要時間とリソースサイズが一目で
- **総コード行数は?** `npx git-heat` 一発で年次レポート

**各ツールは一つの具体的な問題を解決し、使い終わったらすぐ退場します。**

---

## 📦 ツール一覧

### API — URL を変えるだけ

すべての API は `GET` に対応、JSON または画像を返します。**SDK 不要・認証不要**、あらゆる言語 / プラットフォームから：

```html
<!-- <img> でサイトに直接埋め込み -->
<img src="https://boluo66.top/favimg/?url=github.com" alt="icon">

<!-- fetch でページから呼び出し -->
fetch('https://boluo66.top/ip/?ip=8.8.8.8').then(r => r.json())

<!-- ターミナルで一行 -->
curl https://boluo66.top/uptime/?url=example.com
```

| ツール | 例 | 返却 | 説明 |
|---|---|---|---|
| **favimg** | `GET /favimg/?url=xxx` | 画像 | URL ひとつで favicon |
| **ip** | `GET /ip/?ip=xxx` | JSON | 国・都市・ISP・ASN、`&lang=ja` 対応 |
| **uptime** | `GET /uptime/?url=xxx` | JSON | ステータス・応答時間・SSL 期限 |
| **security** | `GET /security/?url=xxx` | JSON | 9 種のセキュリティヘッダを加重採点 + TLS 分析 |
| **cert** | `GET /cert/?host=xxx` | JSON | 証明書チェーン・SAN・鍵種別・TLS バージョン |
| **trace** | `GET /trace/?url=xxx` | JSON | 完全なリダイレクトチェーン + 各ホップ時間 + 最終ヘッダ |
| **dns** | `GET /dns/?domain=xxx&type=A` | JSON | 10 種のレコード、A/AAAA は実 TTL |
| **dnsprop** | `GET /dnsprop/?domain=xxx` | JSON | 7 つのグローバル / 国内リゾルバを並列比較 |
| **whois** | `GET /whois/?domain=xxx` | JSON | レジストラ・登録 / 期限日・ネームサーバ |
| **metadata** | `GET /metadata/?url=xxx` | JSON | title・OG タグ・favicon・h1-h3・全 link |
| **read** | `GET /read/?url=xxx` | JSON | Mozilla Readability によるクリーンな本文 |

### Bookmarklet — ブックマークバーにドラッグ、どこでも使える

**任意のページ**でクリックするだけ、すべてクライアント側、何もアップロードしません：

| ツール | 内容 |
|---|---|
| **perf** | そのページの読み込み時間(DNS/TCP/TTFB/DOM/完了）+ リソース数とサイズ |
| **seo** | title/description の長さ、H1、canonical、alt 欠落、OG、文字数 —— 合格 / 警告 / 不合格 |
| **table2csv** | ページ内の任意の `<table>` を CSV でコピーまたはダウンロード |
| **linkcheck** | ページの全リンクを走査し、リンク切れを検出 |
| **all-links** | 現在のページの全リンクを抽出 |
| **imgextract** | 全画像を抽出、ZIP ダウンロード対応 |
| **cookies** | Cookie の閲覧・検索・編集・削除 |
| **lsstorage** | localStorage の閲覧・検索・編集・削除 |
| **panda** | ページをグレースケール化して視覚ノイズを削減 |
| **uncopy** | コピー / 右クリック / テキスト選択の禁止を解除 |

> 使い方：[ツールボックスのページ](https://boluo66.top/toolkit/)を開き、ボタンをブックマークバーにドラッグ。以降は任意のページでクリックするだけ。

### CLI — コマンド一発

| ツール | コマンド |
|---|---|
| **git-heat** | `npx git-heat` |
| **rmport** | `npx rmport 3000` |

### Web ツール — 開くだけ

| ツール | 内容 | |
|---|---|---|
| **myip** | 公開 IP + 国内 / 海外の複数ソース比較 + 分割ルーティング検出 | [→ 開く](https://boluo66.top/toolkit/myip.html) |
| **jwt** | header/payload のデコード + HS256 署名検証 | [→ 開く](https://boluo66.top/toolkit/jwt.html) |
| **cidr** | CIDR → ネットワーク / マスク / ブロードキャスト / ホスト数 | [→ 開く](https://boluo66.top/toolkit/cidr.html) |
| **hash** | MD5 / SHA / Base64 / URL エンコード・デコード | [→ 開く](https://boluo66.top/toolkit/hash.html) |
| **cron** | crontab 式を解説 + 次回実行時刻 | [→ 開く](https://boluo66.top/toolkit/cron.html) |
| **code-preview** | コードを貼り付けて美しいスクショを出力 | [→ 開く](https://boluo66.top/toolkit/code-preview.html) |
| **timestamp** | Unix タイムスタンプ ↔ 日付 | [→ 開く](https://boluo66.top/toolkit/timestamp.html) |
| **palette** | 1 色から 8 種の配色 | [→ 開く](https://boluo66.top/toolkit/palette.html) |
| **diff** | 2 つのテキストの差分をハイライト | [→ 開く](https://boluo66.top/toolkit/diff.html) |
| **regex-tester** | リアルタイムマッチ + グループ + 件数 | [→ 開く](https://boluo66.top/toolkit/regex-tester.html) |
| **api-playground** | ブラウザで REST リクエストを送信 | [→ 開く](https://boluo66.top/toolkit/api-playground.html) |
| **mermaid-editor** | Mermaid を書いてライブプレビュー、SVG/PNG 出力 | [→ 開く](https://boluo66.top/toolkit/mermaid-editor.html) |

---

## 🔒 プライバシーと実装

- **API ツール**：サードパーティ依存ゼロ。サーバ側で内部 / 予約アドレスをブロック(SSRF 対策)。
- **Bookmarklet / Web ツール**：完全にブラウザ内で動作 —— 入力(鍵・トークン・テキスト)は**アップロードされません**。

---

<p align="center">
  <img src="https://boluo66.top/toolkit/screenshot-v3.png" alt="開発者ツールボックスのスクリーンショット" width="70%" style="border-radius: 12px" />
</p>

<p align="center">
  役に立ったら ⭐ Star をいただけると嬉しいです ✨<br>
  欲しいツールがある? <a href="https://github.com/VeteranBoLuo/tools/issues">Issue を立てる →</a>
</p>
