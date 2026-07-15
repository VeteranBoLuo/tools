<h1 align="center">🛠 Boluo 개발자 도구 모음 · 무료 온라인 도구 35개</h1>

<p align="center">
  일상 개발 작업을 한곳에서 —— <b>설치 불필요 · 회원가입 불필요 · 바로 사용</b><br>
  <sub>Free Online Developer Toolkit · API · Bookmarklet · CLI · Web Tools</sub>
</p>

<p align="center">
  <a href="https://boluo66.top/toolkit/"><img src="https://img.shields.io/badge/%EC%98%A8%EB%9D%BC%EC%9D%B8%20%EC%B2%B4%ED%97%98-615ced?style=for-the-badge" alt="demo"></a>
  <img src="https://img.shields.io/badge/tools-35-3fb950?style=for-the-badge" alt="tools">
  <img src="https://img.shields.io/badge/%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85%20%EB%B6%88%ED%95%84%EC%9A%94-3fb950?style=for-the-badge" alt="회원가입 불필요">
  <a href="https://github.com/VeteranBoLuo/tools/stargazers"><img src="https://img.shields.io/github/stars/VeteranBoLuo/tools?style=for-the-badge&color=555&label=stars" alt="stars"></a>
</p>

<p align="center">
  <a href="README.md"><img src="https://img.shields.io/badge/%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87-555?style=for-the-badge" alt="简体中文"></a>
  <a href="README.en.md"><img src="https://img.shields.io/badge/English-555?style=for-the-badge" alt="English"></a>
  <a href="README.ja.md"><img src="https://img.shields.io/badge/%E6%97%A5%E6%9C%AC%E8%AA%9E-555?style=for-the-badge" alt="日本語"></a>
  <img src="https://img.shields.io/badge/%ED%95%9C%EA%B5%AD%EC%96%B4-615ced?style=for-the-badge" alt="한국어">
</p>

<p align="center">
  <a href="https://boluo66.top/toolkit/"><img src="https://boluo66.top/toolkit/screenshot-v3.png" alt="Boluo 개발자 도구 모음 온라인 화면" width="88%" /></a>
</p>

> [!NOTE]
> 이 저장소는 Boluo Toolkit의 공식 탐색 및 다국어 쇼케이스 저장소입니다. 도구 설명과 온라인 진입점에 집중하며 서버 소스 코드는 포함하지 않습니다. 모든 공개 도구는 [온라인 도구 모음](https://boluo66.top/toolkit/)에서 무료로 사용할 수 있습니다.

---

## ✨ 하이라이트

다른 곳에서는 찾기 어렵거나, 특히 손에 잘 맞는 것들:

- **🌐 [myip · 내 IP](https://boluo66.top/toolkit/myip.html)** —— 단순 IP 조회가 아닙니다. 국내·해외의 여러 에코 소스를 동시에 대조해 **프록시나 분할 라우팅 사용 여부를 한눈에** 알 수 있습니다(소스 A는 다른 IP, 소스 B는 또 다른 IP). IPv6와 WebRTC 로컬 주소 탐지도 포함.
- **🔒 [cert · SSL 인증서 심층 조회](https://boluo66.top/cert/?host=github.com)** —— 전체 인증서 체인, SAN 목록, 키 종류, TLS 버전, 만료까지 남은 일수를 URL 하나로.
- **🌍 [dnsprop · DNS 전파 확인](https://boluo66.top/dnsprop/?domain=github.com)** —— DNS 레코드를 바꿨는데 반영됐을까? Cloudflare / Google / Quad9 + AliDNS / DNSPod / 114(7개 리졸버)를 병렬 조회해 비교.
- **📖 [read · 본문 추출](https://boluo66.top/read/?url=https%3A%2F%2Fexample.com)** —— 광고·내비게이션·사이드바를 제거하고 기사 본문만 남깁니다.
- **🔀 [trace · 리디렉션 추적](https://boluo66.top/trace/?url=https%3A%2F%2Fgithub.com)** —— 전체 리디렉션 체인, 각 홉의 상태 코드·소요 시간·Location. 301/302 디버깅에 유용.

---

## 왜 이 도구 상자인가

개발에서 흔한 상황들:

- **사이트의 favicon이 필요?** 브라우저로 요소 검사하는 대신 `GET /favimg/?url=xxx`
- **DNS 변경이 전파됐나?** 리졸버를 하나씩 바꿔 확인하기 번거롭죠 —— `GET /dnsprop/?domain=xxx` 로 7개 한 번에 비교
- **페이지가 복사 금지?** 콘솔에서 해제 코드 찾는 대신 Bookmarklet 을 드래그해 원클릭
- **이 페이지, 어디가 느리지?** DevTools의 Network를 열 필요 없이 `perf` 북마클릿을 드래그하면 로딩 시간과 리소스 크기가 바로 보입니다
- **총 코드 줄 수는?** `npx git-heat` 한 줄로 연간 리포트

**각 도구는 하나의 구체적인 문제를 해결하고, 다 쓰면 바로 사라집니다.**

---

## 📦 도구 목록

### API — URL만 바꾸면 결과가

모든 API는 `GET`을 지원하고 JSON 또는 이미지를 반환합니다. **SDK·인증 불필요**, 어떤 언어 / 플랫폼에서도:

```html
<!-- <img>로 사이트에 바로 삽입 -->
<img src="https://boluo66.top/favimg/?url=github.com" alt="icon">

<!-- fetch로 페이지에서 호출 -->
fetch('https://boluo66.top/ip/?ip=8.8.8.8').then(r => r.json())

<!-- 터미널에서 한 줄 -->
curl "https://boluo66.top/dnsprop/?domain=github.com"
```

| 도구 | 예시 | 반환 | 설명 |
|---|---|---|---|
| [**favicon-api**](https://boluo66.top/favimg/) | `GET /favimg/?url=xxx` | 이미지 | URL 하나로 favicon |
| [**ip**](https://boluo66.top/ip/?ip=8.8.8.8) | `GET /ip/?ip=xxx` | JSON | 국가·도시·ISP·ASN, `&lang=ko` 지원 |
| [**uptime**](https://boluo66.top/toolkit/) | `GET /uptime/?url=xxx` | JSON | 상태 코드·응답 시간·SSL 만료 |
| [**security**](https://boluo66.top/toolkit/) | `GET /security/?url=xxx` | JSON | 9개 보안 헤더 가중 채점 + TLS 분석 |
| [**cert**](https://boluo66.top/cert/?host=github.com) | `GET /cert/?host=xxx` | JSON | 인증서 체인·SAN·키 종류·TLS 버전 |
| [**trace**](https://boluo66.top/trace/?url=https%3A%2F%2Fgithub.com) | `GET /trace/?url=xxx` | JSON | 전체 리디렉션 체인 + 홉별 시간 + 최종 헤더 |
| [**dns**](https://boluo66.top/dns/?domain=github.com&type=A) | `GET /dns/?domain=xxx&type=A` | JSON | 10종 레코드, A/AAAA는 실제 TTL |
| [**dnsprop**](https://boluo66.top/dnsprop/?domain=github.com) | `GET /dnsprop/?domain=xxx` | JSON | 7개 글로벌 / 국내 리졸버 병렬 비교 |
| [**whois**](https://boluo66.top/whois/?domain=github.com) | `GET /whois/?domain=xxx` | JSON | 등록기관·등록 / 만료일·네임서버 |
| [**metadata**](https://boluo66.top/metadata/?url=https%3A%2F%2Fboluo66.top) | `GET /metadata/?url=xxx` | JSON | title·OG 태그·favicon·h1-h3·모든 link |
| [**read**](https://boluo66.top/read/?url=https%3A%2F%2Fexample.com) | `GET /read/?url=xxx` | JSON | Mozilla Readability 기반 깔끔한 본문 |

### Bookmarklet — 북마크바에 드래그, 어디서나 사용

**어떤 페이지에서도** 클릭 한 번, 모두 클라이언트에서 실행, 아무것도 업로드하지 않습니다:

| 도구 | 설명 |
|---|---|
| **perf** | 해당 페이지의 로딩 시간(DNS/TCP/TTFB/DOM/완료) + 리소스 수와 크기 |
| **seo** | title/description 길이, H1, canonical, alt 누락, OG, 글자 수 —— 통과 / 경고 / 실패 |
| **table2csv** | 페이지의 임의의 `<table>`을 CSV로 복사 또는 다운로드 |
| **linkcheck** | 페이지의 모든 링크를 스캔해 깨진 링크 표시 |
| **all-links** | 현재 페이지의 모든 링크 추출 |
| **imgextract** | 모든 이미지 추출, ZIP 다운로드 지원 |
| **cookies** | 쿠키 조회·검색·편집·삭제 |
| **lsstorage** | localStorage 조회·검색·편집·삭제 |
| **panda** | 페이지를 흑백으로 만들어 시각적 잡음 제거 |
| **uncopy** | 복사 / 우클릭 / 텍스트 선택 금지 해제 |

> 사용법: [도구 상자 페이지](https://boluo66.top/toolkit/)를 열고 버튼을 북마크바에 드래그하세요. 이후 어떤 페이지에서든 클릭하면 됩니다.

### CLI — 명령어 한 줄

| 도구 | 명령어 |
|---|---|
| [**git-heat**](https://www.npmjs.com/package/git-heat) | `npx git-heat` |
| [**rmport**](https://www.npmjs.com/package/rmport) | `npx rmport 3000` |

### 웹 도구 — 열면 바로 사용

| 도구 | 설명 | |
|---|---|---|
| **myip** | 공개 IP + 국내 / 해외 다중 소스 비교 + 분할 라우팅 감지 | [→ 열기](https://boluo66.top/toolkit/myip.html) |
| **jwt** | header/payload 디코딩 + HS256 서명 검증 | [→ 열기](https://boluo66.top/toolkit/jwt.html) |
| **cidr** | CIDR → 네트워크 / 마스크 / 브로드캐스트 / 호스트 수 | [→ 열기](https://boluo66.top/toolkit/cidr.html) |
| **hash** | MD5 / SHA / Base64 / URL 인코딩·디코딩 | [→ 열기](https://boluo66.top/toolkit/hash.html) |
| **cron** | crontab 식 해석 + 다음 실행 시각 | [→ 열기](https://boluo66.top/toolkit/cron.html) |
| **code-preview** | 코드를 붙여넣어 예쁜 스크린샷 출력 | [→ 열기](https://boluo66.top/toolkit/code-preview.html) |
| **timestamp** | Unix 타임스탬프 ↔ 날짜 | [→ 열기](https://boluo66.top/toolkit/timestamp.html) |
| **palette** | 색 하나로 8가지 배색 | [→ 열기](https://boluo66.top/toolkit/palette.html) |
| **diff** | 두 텍스트의 차이 하이라이트 | [→ 열기](https://boluo66.top/toolkit/diff.html) |
| **regex-tester** | 실시간 매칭 + 그룹 + 개수 | [→ 열기](https://boluo66.top/toolkit/regex-tester.html) |
| **api-playground** | 브라우저에서 REST 요청 전송 | [→ 열기](https://boluo66.top/toolkit/api-playground.html) |
| **mermaid-editor** | Mermaid 작성, 실시간 미리보기, SVG/PNG 내보내기 | [→ 열기](https://boluo66.top/toolkit/mermaid-editor.html) |

---

## 🔒 개인정보와 구현

- **API 도구**: 대부분 서드파티 런타임 의존성이 없는 가벼운 구현을 사용합니다. 서버는 내부 / 예약 주소를 차단하며(SSRF 방어), 본문 추출에는 Mozilla Readability와 jsdom을 사용합니다.
- **Bookmarklet / 웹 도구**: 대부분의 기능은 브라우저 로컬에서 실행됩니다. 네트워크가 필요한 도구는 사용자가 시작한 작업에 필요한 요청만 전송합니다.

---

<p align="center">
  도움이 되었다면 ⭐ Star 부탁드립니다 ✨<br>
  원하는 도구가 있나요? <a href="https://github.com/VeteranBoLuo/tools/issues">Issue 남기기 →</a>
</p>
