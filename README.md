# impossible-builds-skill

Skill tạo video cho Impossible Builds TV.

## Skill: Impossible Builds Video Director

Thư mục `impossible-builds-video-director/` là một Claude Skill hoàn chỉnh dùng để tạo gói sản xuất video cho kênh YouTube Impossible Builds TV, tối ưu cho Veo 3 và Google Flow.

Skill tạo ra:
- **Video dài**: 60 cảnh × 8 giây (8 phút, 16:9), có thể scale lên 75 cảnh.
- **Video Short**: 7 cảnh × 8 giây (56 giây, 9:16), theo ba vai trò cố định.
- **Ngân hàng tiêu đề** theo cụm 1 Long + 2 Short.
- **Trả lời bình luận kỹ thuật**.

Mỗi gói gồm Khối 1 (prompt Veo đánh số, tiếng Anh) và Khối 2 (phân tích, Continuity Bible, ledger, voice-over, bản đồ nhạc, metadata).

## Cấu trúc

```
impossible-builds-video-director/
├── SKILL.md                      quy trình điều phối
├── references/
│   ├── channel-dna.md            bộ gen kênh: cốt truyện, hook, continuity, an toàn, camera, âm thanh
│   ├── long-form-mode.md         phân bổ 60/75 cảnh, vote A/B, lịch xuất bản
│   ├── shorts-mode.md            ba vai trò Short, nhịp 56 giây, CTA
│   ├── output-format.md          định dạng Khối 1 và Khối 2, 6 metadata
│   ├── title-bank.md             công thức tiêu đề, bộ lọc ba lỗi
│   └── comment-replies.md        cấu trúc trả lời bình luận kỹ thuật
├── assets/
│   ├── prompt-skeleton.md        khung một prompt 8 giây
│   ├── block2-template.md        khung Khối 2
│   ├── negative-prompt-master.md chuỗi negative prompt chuẩn
│   └── qc-checklist.md           checklist tự kiểm tra
└── examples/
    ├── short-example.md          Short vai trò 2, đủ 7 cảnh và Khối 2
    └── long-form-example.md      video dài đủ 60 cảnh và Khối 2
```

## Bản mẫu dùng chung

Thư mục `templates/` chứa các bản mẫu không thuộc riêng skill nào:

- `templates/khung-cau-lenh-cong-viec-chuyen-sau.md`: khung 12 mục để giao một nhiệm vụ chuyên sâu cho Claude (vai trò, mục tiêu, bối cảnh, nguồn, công việc, xử lý dữ liệu, tiêu chuẩn, đầu ra, QC, phê duyệt, thiếu thông tin, bàn giao). Mục "Quy trình vận hành bắt buộc" trong SKILL.md là khung này đã điền sẵn cho vai trò đạo diễn video.

## Cách dùng

Cài skill vào Claude (Claude Code, Claude.ai hoặc Cowork) rồi dán tiêu đề, ví dụ:

- "Làm video dài: How Do Engineers Anchor a Bridge Inside a Flooding Canyon River?"
- "Làm Short vai trò 2 cho hub cầu hẻm núi."
- "Cho tôi ngân hàng tiêu đề 3 hub về đập và hầm."

Tài liệu bên trong viết tiếng Việt. Prompt, voice-over và metadata xuất tiếng Anh.
