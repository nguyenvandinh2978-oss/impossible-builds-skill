# Hướng dẫn plugin k9-boss — v1

Ngày tạo: 2026-09-24
Trạng thái: **bản thử**, mới chứa 1 skill (`bao-cao-tuan`).

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
        └── skills/
            └── bao-cao-tuan/     bản sao từ .claude/skills/bao-cao-tuan/
```

Bản gốc `.claude/skills/bao-cao-tuan/` vẫn giữ nguyên để kho này không gãy.

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
```

Hoặc nói "Chạy Báo cáo Tuần" như cũ; Claude tự nhận ra skill theo mô tả.

## 5. Cập nhật

1. Sửa skill trong `plugins/k9-boss/skills/...`.
2. Tăng `version` trong `plugins/k9-boss/.claude-plugin/plugin.json` và `.claude-plugin/marketplace.json`.
3. Commit, push, merge vào `main`.
4. Ở dự án dùng plugin: `/plugin marketplace update k9-boss-market` (hoặc tự cập nhật nếu bật `autoUpdate`).

## 6. Kết quả kiểm tra ngày 2026-09-24

| Kiểm tra | Kết quả |
|---|---|
| `claude plugin validate .` (marketplace) | Đạt |
| `claude plugin validate plugins/k9-boss` | Đạt, không cảnh báo |
| Thêm marketplace và cài plugin trong thư mục HOME tạm cách ly | Đạt: `k9-boss@k9-boss-market` v0.1.0, enabled |
| `claude plugin details k9-boss` | Nhận skill `bao-cao-tuan` (~370 token thường trực, ~3,7k token khi gọi) |

## 7. Chưa kiểm chứng

- Cài từ GitHub (Cách A/B) khi kho để riêng tư, trong phiên web đám mây.
- `displayName` hiển thị thế nào trong giao diện web.
- Gọi thực tế `/k9-boss:bao-cao-tuan` trong một phiên mới.

## 8. Bước tiếp theo dự kiến

- Chuyển `impossible-builds-video-director` vào `plugins/k9-boss/skills/`.
- Đưa hook chặn lệnh nguy hiểm vào `plugins/k9-boss/hooks/`, dùng `${CLAUDE_PLUGIN_ROOT}`.
- Cân nhắc tách sang kho riêng `k9-skills` khi bộ skill lớn dần.
