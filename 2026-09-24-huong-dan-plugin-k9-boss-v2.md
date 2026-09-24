# Hướng dẫn plugin k9-boss — v2

Ngày tạo: 2026-09-24
Phiên bản plugin: **0.2.0** (đợt 2).

## Thay đổi so với v1

- Đã merge bản 0.1.0 vào `main` (PR #16); cài từ GitHub đã kiểm chứng đạt.
- Thêm skill `impossible-builds-video-director` (bản sao từ thư mục gốc kho).
- Thêm hook chặn lệnh nguy hiểm vào plugin: dự án nào cài `k9-boss` cũng được bảo vệ.
- Nâng phiên bản 0.1.0 → 0.2.0.

## 1. Plugin k9-boss là gì

Kho skill tổng đóng gói theo chuẩn plugin của Claude Code. Sửa skill ở một chỗ, mọi dự án cài plugin đều dùng bản mới.

| Lớp | Tên | Ghi chú |
|---|---|---|
| Tên hiển thị | AI Code - Boss Mr Dinh | Trường `displayName`, chỉ để hiển thị |
| Tên plugin (kỹ thuật) | `k9-boss` | Dùng trong lệnh gọi |
| Tên cửa hàng (marketplace) | `k9-boss-market` | Dùng khi cài đặt |

Không đặt chữ "claude" trong tên kỹ thuật: quy cách Agent Skills dành riêng từ này.

## 2. Cấu trúc trong kho

```
impossible-builds-skill/
├── .claude-plugin/
│   └── marketplace.json          danh mục cửa hàng k9-boss-market
└── plugins/
    └── k9-boss/
        ├── .claude-plugin/
        │   └── plugin.json       khai báo plugin k9-boss
        ├── skills/
        │   ├── bao-cao-tuan/                      bản sao từ .claude/skills/bao-cao-tuan/
        │   └── impossible-builds-video-director/  bản sao từ impossible-builds-video-director/
        └── hooks/
            ├── hooks.json                gắn hook PreToolUse, gọi script qua ${CLAUDE_PLUGIN_ROOT}
            └── chan-lenh-nguy-hiem.py    bản sao từ .claude/hooks/
```

Bản gốc vẫn giữ nguyên để kho này và skill đã tải lên tài khoản không gãy.

**Lưu ý đồng bộ:** mỗi skill và hook hiện có hai bản (gốc và trong plugin). Khi sửa, sửa cả hai, hoặc về sau chọn plugin làm bản gốc duy nhất.

**Lưu ý hook chạy hai lần:** nếu bật plugin ngay trong kho này, hook của kho (`.claude/settings.json`) và hook của plugin cùng chạy. Kết quả vẫn đúng, chỉ chậm hơn chút; không cần bật plugin trong kho này.

## 3. Cài vào một dự án khác

### Cách A — gõ lệnh (trên máy, trong phiên Claude Code)

```
/plugin marketplace add nguyenvandinh2978-oss/impossible-builds-skill
/plugin install k9-boss@k9-boss-market
```

Kho riêng tư: đăng nhập git trước (`gh auth login` rồi `gh auth setup-git`).

### Cách B — khai báo sẵn trong dự án (khuyên dùng)

Thêm vào `.claude/settings.json` của dự án đó rồi commit:

```json
{
  "extraKnownMarketplaces": {
    "k9-boss-market": {
      "source": { "source": "github", "repo": "nguyenvandinh2978-oss/impossible-builds-skill" },
      "autoUpdate": true
    }
  },
  "enabledPlugins": {
    "k9-boss@k9-boss-market": true
  }
}
```

## 4. Gọi skill

```
/k9-boss:bao-cao-tuan
/k9-boss:impossible-builds-video-director
```

Hoặc nói tự nhiên ("Chạy Báo cáo Tuần", đưa tiêu đề video); Claude tự nhận ra skill theo mô tả.

Hook không cần gọi: cài plugin là hook tự chạy trước mọi lệnh Bash/PowerShell và mọi lần ghi tệp.

## 5. Cập nhật

1. Sửa skill trong `plugins/k9-boss/skills/...`.
2. Tăng `version` trong `plugins/k9-boss/.claude-plugin/plugin.json` và `.claude-plugin/marketplace.json`.
3. Commit, push, merge vào `main`.
4. Ở dự án dùng plugin: `/plugin marketplace update k9-boss-market` (hoặc tự cập nhật nếu bật `autoUpdate`).

## 6. Kết quả kiểm tra ngày 2026-09-24

### Bản 0.1.0 (đã merge)

| Kiểm tra | Kết quả |
|---|---|
| Cài từ GitHub: `marketplace add nguyenvandinh2978-oss/impossible-builds-skill` + `install` | Đạt |

### Bản 0.2.0 (đợt 2)

| Kiểm tra | Kết quả |
|---|---|
| `claude plugin validate .` và `claude plugin validate plugins/k9-boss` | Đạt, không cảnh báo |
| So sánh bản sao với bản gốc (`diff -r`) | Giống hệt |
| Cài trong HOME tạm cách ly, `claude plugin details k9-boss` | Nhận 2 skill + 1 hook PreToolUse; ~719 token thường trực |
| Hook qua `${CLAUDE_PLUGIN_ROOT}`, chạy trong một dự án thử khác: `rm -rf du-lieu` | deny (đúng) |
| `git push origin main` | deny (đúng) |
| Ghi đè `SKILL.md` đã có trong dự án thử | ask (đúng) |
| `ls -la` | cho qua (đúng) |

## 7. Chưa kiểm chứng

- Hook của plugin kích hoạt trong một phiên trò chuyện thật (mới mô phỏng bằng cách gọi đúng lệnh trong `hooks.json`).
- Gọi thực tế `/k9-boss:...` trong một phiên mới.
- `displayName` hiển thị thế nào trong giao diện web.

## 8. Bước tiếp theo dự kiến

- Anh cài thử ở một dự án khác, gọi skill và thử một lệnh bị chặn.
- Quyết định bản gốc duy nhất (plugin hay thư mục cũ) để tránh hai bản lệch nhau.
- Cân nhắc tách sang kho riêng `k9-skills` khi bộ skill lớn dần.
