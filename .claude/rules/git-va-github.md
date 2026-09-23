# Luật git và GitHub

Nguồn gốc: quy tắc 4 và quy tắc 10 trong `CLAUDE.md`. Hook `.claude/hooks/chan-lenh-nguy-hiem.py` chặn cứng những lệnh nguy hiểm nhất. Tệp này ghi phần hook không kiểm tra được.

## Nhánh

- Làm trên nhánh riêng: `claude/...` trong phiên web, hoặc nhánh đặt tên theo việc khi làm trên máy.
- Không commit hay push thẳng lên `main`.

## Commit

- Mỗi commit gói một việc, message nói rõ đã đổi gì và vì sao.
- Không đưa thông tin cá nhân vào kho: họ tên, chức vụ, đơn vị, số điện thoại, khóa API. Thông tin cá nhân để ở `~/.claude/CLAUDE.md` trên máy.
- Không commit tệp tạm, tệp nháp, bản sao lưu.

## Hành động ra bên ngoài: phải xin xác nhận trước

- Mở, merge hoặc đóng Pull Request.
- Bình luận hoặc review trên GitHub.
- Gửi email, chia sẻ tệp Drive, đăng hoặc cập nhật video qua vidIQ.
- Push `--force-with-lease`. Hook cho qua lệnh này, nhưng vẫn phải được người dùng đồng ý.
