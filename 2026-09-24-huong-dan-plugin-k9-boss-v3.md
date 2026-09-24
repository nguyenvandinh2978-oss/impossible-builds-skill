# Hướng dẫn từng bước plugin k9-boss — v3

Ngày tạo: 2026-09-24
Phiên bản plugin: **0.2.0**
Kho: `nguyenvandinh2978-oss/impossible-builds-skill`

## Thay đổi so với v2

- **Sửa lỗi:** v2 ghi chỉ cần `/plugin marketplace update` là nâng được plugin. Thực tế lệnh đó chỉ làm mới danh mục cửa hàng; phải chạy thêm `/plugin update` rồi nạp lại bằng `/reload-plugins`.
- `/reload-plugins` đã kiểm chứng trên máy thật: nạp được plugin mà không cần khởi động lại phiên.
- Viết lại thành các bước tuần tự cho ba tình huống: cài mới, nâng cấp, gỡ hoặc tắt.
- Thêm bảng lỗi hay gặp.

## Tóm tắt nhanh

| Tình huống | Lệnh |
|---|---|
| Cài mới | `/plugin marketplace add nguyenvandinh2978-oss/impossible-builds-skill` → `/plugin install k9-boss@k9-boss-market` → `/reload-plugins` |
| Nâng cấp | `/plugin marketplace update k9-boss-market` → `/plugin update k9-boss@k9-boss-market` → `/reload-plugins` |
| Kiểm tra | `/plugin list` |
| Gọi skill | `/k9-boss:bao-cao-tuan`, `/k9-boss:impossible-builds-video-director` |

Các lệnh bắt đầu bằng `/` gõ **trong khung chat của Claude Code**. Lệnh `claude plugin ...` gõ **ở cửa sổ dòng lệnh** (PowerShell, Terminal), ngoài Claude Code. Hai cách cho cùng kết quả.

---

## A. Cài mới (dự án chưa có k9-boss)

### Bước 0 — Chuẩn bị (chỉ làm một lần trên mỗi máy)

Kho để riêng tư thì máy phải đăng nhập GitHub trước. Mở PowerShell hoặc Terminal:

```
gh auth login
gh auth setup-git
```

Kho công khai thì bỏ qua bước này.

### Bước 1 — Mở Claude Code trong dự án

```
cd <thư-mục-dự-án>
claude
```

### Bước 2 — Thêm cửa hàng

Trong khung chat Claude Code:

```
/plugin marketplace add nguyenvandinh2978-oss/impossible-builds-skill
```

Kết quả đúng: `Successfully added marketplace: k9-boss-market`.

### Bước 3 — Cài plugin

```
/plugin install k9-boss@k9-boss-market
```

Nếu được hỏi phạm vi cài (scope):

| Chọn | Khi nào |
|---|---|
| **user** | Muốn mọi dự án trên máy này đều có k9-boss (khuyên dùng) |
| **project** | Chỉ dự án này, và muốn ghi vào `.claude/settings.json` để người khác (hoặc phiên web) cũng có |
| **local** | Chỉ dự án này, chỉ riêng anh |

Kết quả đúng: `Successfully installed plugin: k9-boss@k9-boss-market`.

### Bước 4 — Nạp plugin vào phiên

```
/reload-plugins
```

Kết quả đúng: `Reloaded: 1 plugin · 2 skills · ... · 1 hook ...`

Nếu vẫn báo `0 plugins`: gõ `/exit`, rồi chạy lại `claude`.

Lưu ý: chạy `/reload-plugins` **trước** khi cài sẽ báo `0 plugins` — bình thường, vì chưa có gì để nạp.

### Bước 5 — Kiểm tra

```
/plugin list
```

Kết quả đúng:

```
k9-boss@k9-boss-market
  Version: 0.2.0
  Status: enabled
```

### Bước 6 — Dùng thử

1. Gọi skill: `/k9-boss:bao-cao-tuan` rồi dán vài dòng sổ sách.
2. Gọi skill video: `/k9-boss:impossible-builds-video-director` kèm một tiêu đề video.
3. Thử hook: bảo Claude "chạy `rm -rf thu-muc-thu`". Kết quả đúng: lệnh bị chặn, báo "Hook chặn: rm -rf xóa hàng loạt không thể hoàn tác".

---

## B. Nâng cấp (dự án đã có bản cũ)

Làm mỗi khi kho có bản plugin mới (sau khi PR được merge vào `main`).

### Bước 1 — Làm mới danh mục cửa hàng

```
/plugin marketplace update k9-boss-market
```

Kết quả đúng: `Successfully updated marketplace: k9-boss-market`.

Lệnh này **chỉ tải danh mục mới**, chưa nâng plugin.

### Bước 2 — Nâng plugin

```
/plugin update k9-boss@k9-boss-market
```

Kết quả đúng: `Plugin "k9-boss" updated from 0.1.0 to 0.2.0 ... Restart to apply changes.`

Nếu báo đã là bản mới nhất: kiểm tra lại Bước 1, hoặc PR chưa được merge.

### Bước 3 — Nạp bản mới vào phiên

```
/reload-plugins
```

Bắt buộc: chưa nạp lại thì phiên vẫn chạy bản cũ. Nếu không ăn, `/exit` rồi `claude`.

### Bước 4 — Kiểm tra

```
/plugin list
```

`Version` phải là số mới (0.2.0).

---

## C. Tắt hoặc gỡ

| Việc | Lệnh |
|---|---|
| Tắt tạm (giữ nguyên, bật lại được) | `/plugin disable k9-boss@k9-boss-market` |
| Bật lại | `/plugin enable k9-boss@k9-boss-market` |
| Gỡ hẳn | `/plugin uninstall k9-boss@k9-boss-market` |
| Bỏ cửa hàng | `/plugin marketplace remove k9-boss-market` |

Sau mỗi thao tác: `/reload-plugins` (hoặc `/exit` rồi `claude`).

---

## D. Cách tương đương ở dòng lệnh (ngoài Claude Code)

```
claude plugin marketplace add nguyenvandinh2978-oss/impossible-builds-skill
claude plugin install k9-boss@k9-boss-market
claude plugin marketplace update k9-boss-market
claude plugin update k9-boss@k9-boss-market
claude plugin list
claude plugin details k9-boss
```

`claude plugin details k9-boss` cho biết plugin có những skill, hook nào và tốn bao nhiêu token.

---

## E. Lỗi hay gặp

| Hiện tượng | Nguyên nhân thường gặp | Cách xử lý |
|---|---|---|
| `marketplace add` báo không tìm thấy kho / 404 | Kho riêng tư, máy chưa đăng nhập GitHub | Làm Bước 0 mục A |
| Gõ `/k9-boss:...` không ra | Chưa nạp lại plugin sau khi cài | `/reload-plugins`; không được thì `/exit` rồi `claude` |
| `/plugin update` báo đã mới nhất dù kho có bản mới | Chưa `marketplace update`, hoặc PR chưa merge vào `main` | Làm Bước 1 mục B; kiểm tra PR |
| Hook báo không tìm thấy Python 3 | Máy chưa cài Python 3 | Cài Python 3 (Windows: python.org, tích "Add to PATH") |
| Hook hỏi lại hai lần cho một lệnh | Bật plugin ngay trong kho `impossible-builds-skill` (kho đã có hook riêng) | Không cần bật plugin trong kho này |

---

## F. Kết quả kiểm tra ngày 2026-09-24

| Kiểm tra (HOME tạm cách ly, cài từ GitHub) | Kết quả |
|---|---|
| Cài mới bản 0.2.0: `marketplace add` + `install` | Đạt; `details` nhận 2 skill + 1 hook PreToolUse |
| Nâng cấp 0.1.0 → 0.2.0: `marketplace update` + `update` | Đạt; báo "updated from 0.1.0 to 0.2.0 … Restart to apply changes" |
| Chỉ chạy `marketplace update` | Chưa nâng plugin — lý do sửa hướng dẫn v2 |

| Kiểm tra trên máy thật của người dùng (Windows, PowerShell) | Kết quả |
|---|---|
| `/plugin marketplace add nguyenvandinh2978-oss/impossible-builds-skill` | `Successfully added marketplace: k9-boss-market` |
| Màn hình cài đặt | Hiện đúng "AI Code - Boss Mr Dinh", Version 0.2.0, By: K9; chọn user scope |
| `/plugin install k9-boss@k9-boss-market` | `Installed AI Code - Boss Mr Dinh. Plugin is now active.` |
| `/reload-plugins` sau khi cài | `Reloaded: 1 plugin · 2 skills · 6 agents · 1 hook` — **thay được khởi động lại** |
| `/plugin list` | `k9-boss@k9-boss-market (v0.2.0, user) enabled` |

## G. Chưa kiểm chứng

- `autoUpdate: true` (khai báo trong `.claude/settings.json`) có tự nâng plugin mà không cần Bước 1–2 mục B hay không.
- Gọi skill và hook chặn lệnh trong một phiên trò chuyện thật.
