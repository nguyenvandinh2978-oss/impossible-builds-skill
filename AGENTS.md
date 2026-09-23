# AGENTS.md — Luật cho các ghế máy

Tệp này dành cho mọi tác tử AI làm việc trong kho: agent phụ do Claude Code sinh ra, và các công cụ khác đọc `AGENTS.md` (Codex, Cursor, Copilot, Gemini CLI...). Tệp chỉ ghi phần luật riêng cho tác tử. Luật gốc nằm ở chỗ khác, không chép lại ở đây để tránh hai bản lệch nhau.

## Đọc gì trước

1. `CLAUDE.md`: quy tắc làm việc chung và quy tắc đặt tên tệp. Nếu mâu thuẫn, `CLAUDE.md` thắng tệp này.
2. `SKILL.md` của skill được giao:
   - Video Impossible Builds TV: `impossible-builds-video-director/SKILL.md`
   - Báo cáo Tuần: `.claude/skills/bao-cao-tuan/SKILL.md`
3. `.claude/rules/`: luật theo chủ đề, đọc tệp nào khớp với việc đang làm.

## Luật riêng cho tác tử

1. **Làm đúng phạm vi được giao.** Nhận việc đọc thì chỉ đọc. Nhận việc viết thì chỉ ghi vào tệp hoặc thư mục đã được nêu tên.
2. **Không đụng tệp cấu trúc cố định.** Không xóa, đổi tên hay ghi đè `CLAUDE.md`, `AGENTS.md`, `SKILL.md`, `README.md`, các tệp trong `references/`, `assets/`, `examples/`, `.claude/`. Cần sửa thì đề xuất nội dung sửa và để phiên chính xin người dùng xác nhận.
3. **Không hành động ra bên ngoài.** Không push, không mở Pull Request, không bình luận GitHub, không gửi email, không đăng video. Việc đó do phiên chính làm sau khi người dùng xác nhận (quy tắc 10 `CLAUDE.md`).
4. **Không bịa số liệu.** Thiếu dữ liệu thì ghi rõ thiếu gì. Chỗ nào không chắc thì nói không chắc.
5. **Báo cáo lại đầy đủ.** Khi xong việc, trả về: tệp đã đọc, tệp đã tạo hoặc sửa, kết quả kiểm tra, điểm còn nghi vấn. Phiên chính dùng báo cáo này để trả lời người dùng theo cấu trúc 6 mục của `CLAUDE.md`.
6. **Ngôn ngữ.** Prompt sản xuất video, voice-over và metadata viết bằng tiếng Anh Mỹ. Giải thích và báo cáo viết bằng tiếng Việt.

## Hàng rào kỹ thuật

Kho có hook `.claude/hooks/chan-lenh-nguy-hiem.py`, chạy trước mọi lệnh Bash và mọi lần ghi tệp:

- **Chặn hẳn:** `rm -rf`, `git push --force`, push thẳng lên `main`/`master`, `git reset --hard`, `git clean -f`, `git branch -D`, `find -delete`, tải mã từ Internet rồi chạy luôn, và một số lệnh khác.
- **Hỏi người dùng:** xóa, đổi tên hoặc ghi đè các tệp cấu trúc cố định ở mục 2.

Bị hook chặn thì đừng tìm cách lách. Hãy báo lại lý do chặn cho phiên chính.
