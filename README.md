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

## Cách dùng

Cài skill vào Claude (Claude Code, Claude.ai hoặc Cowork) rồi dán tiêu đề, ví dụ:

- "Làm video dài: How Do Engineers Anchor a Bridge Inside a Flooding Canyon River?"
- "Làm Short vai trò 2 cho hub cầu hẻm núi."
- "Cho tôi ngân hàng tiêu đề 3 hub về đập và hầm."

Tài liệu bên trong viết tiếng Việt. Prompt, voice-over và metadata xuất tiếng Anh.

## Skill: Báo cáo Tuần

Thư mục `bao-cao-tuan/` là skill xử lý sổ sách: biến nhật ký bán hàng hoặc bảng kê viết tay lộn xộn thành bảng dữ liệu sạch, kèm danh sách lỗi cần hỏi lại người ghi sổ.

Kích hoạt bằng câu **"Chạy Báo cáo Tuần"** kèm dữ liệu thô.

Đầu ra cố định:
- **Bảng 6 cột**: Ngày, Sản phẩm, Số lượng, Đơn giá, Doanh thu, Ghi chú.
- **Bảng tổng hợp 6 chỉ tiêu**, có đối chiếu cân với tổng thu ghi trong sổ.
- **Danh sách việc cần hỏi lại**, mỗi mục một câu hỏi đóng.
- Hai tệp `yyyy-mm-dd-bao-cao-tuan-<chu-de>-v1.md` và `.csv`.

Năm loại lỗi được rà tự động:

| Loại | Nội dung | Nhãn |
|---|---|---|
| 1 | Khuyết trường bắt buộc (số lượng, đơn giá hoặc doanh thu) | `THIẾU DỮ LIỆU` |
| 2 | Mâu thuẫn số học: Số lượng × Đơn giá ≠ Doanh thu | `SAI LỆCH` |
| 3 | Đơn gộp nhiều mặt hàng, một khoản thu, không tách được | `THIẾU DỮ LIỆU` |
| 4 | Không nhất quán: tên hàng, đơn vị, thiếu năm, cùng hàng hai giá | ghi chú trong dòng |
| 5 | Ngày không hợp lệ, ngoài kỳ báo cáo, hoặc bị đảo dd/mm | `THIẾU DỮ LIỆU` hoặc ghi chú |

Luật cốt lõi: **không tự điền, không suy đoán, không sửa số gốc**. Ô thiếu để trống kèm nhãn; dòng lệch giữ nguyên số sổ và chờ xác nhận.

```
bao-cao-tuan/
├── SKILL.md                      quy trình 10 điểm
├── references/
│   ├── dinh-dang-bang.md         6 cột, bảng tổng hợp, quy tắc đặt tên tệp
│   └── luat-ra-soat-loi.md       năm loại lỗi và cách xử lý từng loại
├── assets/
│   ├── bang-mau.md               khung điền sẵn
│   └── qc-checklist.md           checklist tự kiểm tra
└── examples/
    └── vi-du-tiem-co-ba.md       ví dụ hoàn chỉnh tuần 28/08–05/09
```
