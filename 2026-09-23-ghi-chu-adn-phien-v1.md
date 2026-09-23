# Ghi chú "ADN" phiên trò chuyện Claude Code trên web — v1

Ngày ghi: 2026-09-23
Kho: `nguyenvandinh2978-oss/impossible-builds-skill`

Tài liệu mô tả những thành phần tạo nên một phiên Claude Code chạy trên đám mây (web hoặc điện thoại) khi làm việc với kho này.

## 1. Môi trường chạy

- Container Linux trên đám mây của Claude Code, không phải máy tính cá nhân.
- Kho được clone mới mỗi khi phiên khởi động; mỗi phiên làm việc trên một nhánh riêng dạng `claude/...`.
- Container bị thu hồi khi phiên không hoạt động một thời gian: việc gì chưa commit và push lên GitHub sẽ mất.
- Mạng ra ngoài đi qua proxy theo chính sách mạng của môi trường.

## 2. Chỉ dẫn được nạp vào đầu phiên

| Nguồn | Có trong phiên web? | Nội dung |
|---|---|---|
| Chỉ dẫn hệ thống Claude Code | Có | Cách làm việc, quy tắc git, quy tắc GitHub |
| `CLAUDE.md` của kho | Có | 11 quy tắc làm việc, cấu trúc trả lời 6 mục, quy tắc đặt tên tệp |
| `~/.claude/CLAUDE.md` toàn cục | **Không** | Nằm trên máy cá nhân, không được đưa lên container |

Hệ quả: bối cảnh cá nhân (xưng hô, chức vụ, định hướng riêng) đặt trong tệp toàn cục không có hiệu lực trong phiên web.

## 3. Kỹ năng (skills)

- Skill của kho: `bao-cao-tuan` (trong `.claude/skills/`).
- Skill trong tài khoản: `impossible-builds-video-director`, `dinh-gpt-van-ban-dang`, `k9-book-master`, `so-sanh-du-toan-thuc-mua`.
- Skill chung: `docx`, `xlsx`, `pptx`, `pdf`, `skill-creator`, `code-review`.

## 4. Công cụ và kết nối

- Tệp và lệnh: đọc, ghi, sửa, tìm kiếm, chạy Bash.
- GitHub qua MCP, giới hạn trong phạm vi kho này.
- Kết nối: Gmail, Google Drive, vidIQ, Claude Docs.
- Artifact để xuất bản trang HTML.
- Agent phụ, hẹn giờ nhắc việc, theo dõi hoạt động PR.

## 5. Quy tắc an toàn đi kèm

- Không tạo Pull Request hay hành động bên ngoài khi chưa được xác nhận (chỉ dẫn hệ thống và quy tắc 10 của `CLAUDE.md`).
- Không tự ý xóa, ghi đè, đổi tên tệp quan trọng.
- Không ghi tên model vào commit, PR hoặc tệp trong kho.

## 6. Mô hình

- Phiên được cấu hình với một model Claude cụ thể; model thực tế trả lời có thể khác nếu hệ thống chuyển sang model dự phòng.
- Muốn biết chính xác, yêu cầu Claude tra thông tin phiên bằng công cụ `get_session`.

## Việc còn mở

- Chưa có cách đưa bối cảnh cá nhân vào phiên web mà không công khai thông tin riêng trong kho — cần quyết định riêng.
