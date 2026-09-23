# Ghi chú "ADN" phiên trò chuyện Claude Code trên web — v2

Ngày ghi: 2026-09-23
Kho: `nguyenvandinh2978-oss/impossible-builds-skill`

Tài liệu mô tả những thành phần tạo nên một phiên Claude Code chạy trên đám mây (web hoặc điện thoại) khi làm việc với kho này.

## Thay đổi so với v1

- Thêm mục 3 "Bộ khung harness" (PR #8, #9, #11): `AGENTS.md`, hook chặn lệnh nguy hiểm, `.claude/rules/`.
- Mục 2 bổ sung các nguồn chỉ dẫn mới được nạp vào phiên.
- Mục 6 bổ sung hàng rào kỹ thuật bằng hook, bên cạnh các quy tắc bằng lời.
- Thêm mục 8 "Điều quan sát được trong phiên": hook có hiệu lực ngay giữa phiên, còn quyết định "hỏi lại" thì được tự duyệt.
- Cập nhật "Việc còn mở".

## 1. Môi trường chạy

- Container Linux trên đám mây của Claude Code, không phải máy tính cá nhân.
- Kho được clone mới mỗi khi phiên khởi động. Mỗi phiên làm việc trên một nhánh riêng dạng `claude/...`.
- Container bị thu hồi khi phiên không hoạt động một thời gian: việc gì chưa commit và push lên GitHub sẽ mất.
- Mạng ra ngoài đi qua proxy theo chính sách mạng của môi trường.
- Có sẵn Python 3, nên hook của kho chạy được ngay trong container.

## 2. Chỉ dẫn được nạp vào đầu phiên

| Nguồn | Có trong phiên web? | Nội dung |
|---|---|---|
| Chỉ dẫn hệ thống Claude Code | Có | Cách làm việc, quy tắc git, quy tắc GitHub |
| `CLAUDE.md` của kho | Có | 11 quy tắc làm việc, cấu trúc trả lời 6 mục, quy tắc đặt tên tệp, mục "Bộ khung harness" |
| `.claude/settings.json` của kho | Có | Gắn hook `PreToolUse` chạy trước mọi lệnh Bash và mọi lần ghi tệp |
| `.claude/rules/*.md` của kho | Chưa kiểm chứng | Luật theo chủ đề; cần xác nhận bằng `/memory` |
| `AGENTS.md` của kho | Không thấy tự nạp (chưa kiểm chứng) | Trong phiên này tệp không xuất hiện trong chỉ dẫn đầu phiên. `CLAUDE.md` trỏ tới nó; agent phụ và công cụ AI khác đọc khi được dẫn tới |
| `~/.claude/CLAUDE.md` toàn cục | **Không** | Nằm trên máy cá nhân, không được đưa lên container |

Hệ quả: bối cảnh cá nhân (xưng hô, chức vụ, định hướng riêng) đặt trong tệp toàn cục không có hiệu lực trong phiên web. Tương tự, luật đặt ở `~/.claude/rules/` trên máy cá nhân cũng không có trong phiên web. Vì vậy kho đặt luật theo chủ đề ở `.claude/rules/` bên trong kho.

## 3. Bộ khung harness

| Thành phần | Tệp trong kho | Vai trò |
|---|---|---|
| CLAUDE.md | `CLAUDE.md` | Luật làm việc chung, tự nạp mỗi phiên |
| AGENTS.md | `AGENTS.md` | Luật cho agent phụ và các công cụ AI khác, trỏ về `CLAUDE.md` và `SKILL.md` |
| Hook | `.claude/settings.json`, `.claude/hooks/chan-lenh-nguy-hiem.py` | Chặn cứng lệnh nguy hiểm bằng mã |
| Rules | `.claude/rules/dat-ten-tep.md`, `prompt-video.md`, `git-va-github.md` | Luật theo chủ đề, nạp khi cần |
| Skill | `impossible-builds-video-director/`, `.claude/skills/bao-cao-tuan/` | Quy trình chuyên môn gọi bằng một câu lệnh |

Hook có ba mức:

- **Chặn hẳn:** `rm -rf`, `git push --force`, push lên `main`/`master`, `git reset --hard`, `git clean -f`, `git branch -D`, `find -delete`, tải mã từ Internet rồi chạy luôn, và một số lệnh khác.
- **Hỏi lại:** xóa, đổi tên hoặc ghi đè tệp cấu trúc cố định nằm trong kho.
- **Cho qua:** mọi việc còn lại.

Chi tiết và kết quả kiểm tra 51 ca: `README.md` (mục "Bộ khung harness") và `2026-09-23-bao-cao-kiem-tra-hook-v2.md`.

## 4. Kỹ năng (skills)

- Skill của kho: `bao-cao-tuan` (trong `.claude/skills/`).
- Skill trong tài khoản: `impossible-builds-video-director`, `dinh-gpt-van-ban-dang`, `k9-book-master`, `so-sanh-du-toan-thuc-mua`.
- Skill chung: `docx`, `xlsx`, `pptx`, `pdf`, `skill-creator`, `code-review`.

## 5. Công cụ và kết nối

- Tệp và lệnh: đọc, ghi, sửa, tìm kiếm, chạy Bash. Mọi lệnh Bash và mọi lần ghi tệp đều đi qua hook trước.
- GitHub qua MCP, giới hạn trong phạm vi kho này: mở và merge Pull Request, đọc trạng thái PR.
- Kết nối: Gmail, Google Drive, vidIQ, Claude Docs.
- Artifact để xuất bản trang HTML.
- Agent phụ, hẹn giờ nhắc việc, theo dõi hoạt động PR.

## 6. Quy tắc an toàn đi kèm

Có hai lớp: quy tắc bằng lời, Claude tự tuân theo; và hàng rào bằng mã, hook chặn cứng.

| Quy tắc | Bằng lời | Bằng mã (hook) |
|---|---|---|
| Không tạo Pull Request hay hành động bên ngoài khi chưa được xác nhận | Chỉ dẫn hệ thống, quy tắc 10 `CLAUDE.md` | Chỉ chặn push lên `main`/`master` và force push |
| Không tự ý xóa, ghi đè, đổi tên tệp quan trọng | Quy tắc 4 `CLAUDE.md` | Hỏi lại với tệp cấu trúc cố định trong kho |
| Không xóa hàng loạt, không làm mất thay đổi chưa commit | — | Chặn `rm -rf`, `git reset --hard`, `git clean -f`... |
| Không ghi tên model vào commit, PR hoặc tệp trong kho | Chỉ dẫn hệ thống | — |

## 7. Mô hình

- Phiên được cấu hình với một model Claude cụ thể. Model thực tế trả lời có thể khác nếu hệ thống chuyển sang model dự phòng.
- Muốn biết chính xác, yêu cầu Claude tra thông tin phiên bằng công cụ `get_session`.

## 8. Điều quan sát được trong phiên

- **Hook có hiệu lực ngay giữa phiên.** Vừa tạo xong `.claude/settings.json`, lệnh kế tiếp của Claude đã bị hook kiểm tra, không cần mở phiên mới.
- **Hook đã chặn thật 3 lần đúng:** `git branch -D`, `git reset --hard`, `rm -rf`. Trước khi sửa, hook cũng chặn nhầm 2 lần vì chữ nằm trong heredoc và trong commit message; cả 2 lỗi đã được sửa.
- **Quyết định "hỏi lại" được tự duyệt.** Trong phiên web, hook trả về "hỏi" nhưng không có hộp hỏi hiện ra, lệnh vẫn chạy. Khả năng cao là do chế độ quyền của phiên. Vì vậy trong phiên web, lớp "hỏi lại" chỉ còn tác dụng ghi nhận; lớp "chặn hẳn" mới là hàng rào thật.
- **Mỗi PR đã merge thì nhánh `claude/...` được làm lại từ `main`** trước khi làm việc tiếp, không chồng commit mới lên lịch sử đã merge.

## Việc còn mở

- Chưa có cách đưa bối cảnh cá nhân vào phiên web mà không công khai thông tin riêng trong kho — cần quyết định riêng.
- Chưa thử hook trên máy Windows thật (cần Python 3 thật, không phải lối tắt của Microsoft Store).
- Chưa kiểm chứng hộp hỏi có hiện ra trên máy cá nhân ở chế độ quyền thường.
- Chưa kiểm chứng `.claude/rules/` có được tự nạp; cần chạy `/memory` trong Claude Code.
