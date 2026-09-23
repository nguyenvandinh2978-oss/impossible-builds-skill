# Luật đặt tên tệp

Nguồn gốc: mục "Quy tắc đặt tên tệp" trong `CLAUDE.md`. Tệp này thêm ví dụ và cách xử lý các tình huống hay gặp.

## Tài liệu làm việc phát sinh

Gồm kịch bản, ngân hàng tiêu đề, báo cáo, bảng số liệu, ghi chú, hướng dẫn, script. Tên theo mẫu:

```
yyyy-mm-dd-loai-chu-de-vN.ext
```

- Chữ thường, không dấu, phân cách bằng dấu gạch ngang.
- `yyyy-mm-dd` là ngày tạo tệp, không phải ngày của dữ liệu bên trong.
- `loai` là loại tài liệu: `kich-ban`, `ngan-hang-tieu-de`, `bang-ban-hang`, `bao-cao`, `ghi-chu`, `huong-dan`, `script`...
- Phiên bản ghi `v1`, `v2`, `v3`. Không dùng `final`, `new`, `latest`, `moi`, `ban-cuoi`.

Ví dụ đúng đang có trong kho:

- `2026-09-18-bang-ban-hang-tiem-co-ba-v3.csv`
- `2026-09-23-ghi-chu-adn-phien-v1.md`

## Sửa một tài liệu đã có

- Thay đổi lớn, hoặc bản cũ đã gửi cho người khác: tạo bản mới, tăng số phiên bản (`v1` lên `v2`) và giữ nguyên bản cũ.
- Sửa lỗi nhỏ trên bản chưa gửi ai: được sửa tại chỗ, nhưng phải nêu trong báo cáo cuối phiên.

## Không áp dụng mẫu trên

Tệp cấu trúc cố định giữ nguyên tên để không gãy liên kết: `CLAUDE.md`, `AGENTS.md`, `SKILL.md`, `README.md`, các tệp trong `references/`, `assets/`, `examples/`, `.claude/`. Hook sẽ hỏi lại trước khi các tệp này bị xóa, đổi tên hoặc ghi đè.
