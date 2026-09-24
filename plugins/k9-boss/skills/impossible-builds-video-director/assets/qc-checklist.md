# QC Checklist — Tự kiểm tra trước khi xuất

Đi qua từng mục. Mục nào sai thì sửa Khối 1 hoặc Khối 2 rồi kiểm lại. Ghi kết quả vào mục I của Khối 2.

## Định dạng
- [ ] Khối 1 chỉ có prompt đánh số, bắt đầu "1.", đúng 1 dòng trống giữa các prompt, không tiêu đề, bullet, code fence, dòng nhạc, giải thích xen vào.
- [ ] Đúng số prompt (7 cho Short, 60 hoặc số đã thống nhất cho Long).
- [ ] Mỗi prompt là một đoạn văn liên tục, có đủ 11 thành phần theo `output-format.md`.
- [ ] Mỗi prompt kết thúc bằng negative prompt đầy đủ, không "etc.".
- [ ] Khối 2 có đủ 9 mục A đến I, video dài thêm vote, pinned voting comment, lịch xuất bản.

## Hook và phạm vi
- [ ] Cảnh 1 mở bằng xung đột hình ảnh mạnh nhất, đúng nhịp 0–1 / 1–2 / 2–3 giây.
- [ ] Không mở bằng logo, lời chào, lịch sử, toàn cảnh tĩnh, máy móc chung chung.
- [ ] Payoff khớp lời hứa tiêu đề theo Quy tắc phạm vi.
- [ ] Câu hỏi tiêu đề được trả lời trong voice-over trước CTA.

## Chuỗi tình huống liên hoàn
- [ ] End state cảnh N khớp inherited state cảnh N+1 cho mọi cặp.
- [ ] Cứ khoảng 2 giây có một chuyển biến mới trong mỗi prompt.
- [ ] Không cảnh thừa, không khoảng chết, không reset hay đảo tiến độ.
- [ ] Trình tự thi công hợp lý theo `channel-dna.md` mục 8.

## Continuity
- [ ] Một địa điểm, một hình học, số cấu kiện không đổi.
- [ ] Đội, PPE, máy móc (tên và màu), vật liệu khớp Continuity Bible trong mọi cảnh.
- [ ] Không nhân bản hoặc dịch chuyển thiết bị.
- [ ] Thời tiết và ánh sáng chuyển hợp lý.

## Nhân vật và an toàn
- [ ] Không lời thoại, không lipsync, không nhìn máy quay, không tạo dáng.
- [ ] Không lộ mặt khi có thể tránh; nhân vật hư cấu, không giống người thật.
- [ ] Cảnh trình bày tĩnh không vượt giới hạn (1 cho Short, 3–4 cho Long 60 cảnh).
- [ ] Worker Position Ledger xác nhận mọi công nhân đứng trên bề mặt khô, ổn định, có lan can.
- [ ] Không công nhân trong bê tông ướt, hố khoan, ống vách, giếng chìm, khuôn kín, đường xả, vùng tải treo.
- [ ] Người làm việc tay, máy làm việc nặng; không ngược lại.

## Camera và vật lý
- [ ] 100% cảnh là time-lapse tốc độ cao, ghi thời lượng thực và hệ số nén.
- [ ] Camera A cố định, không pan, tilt, roll, orbit, tracking, zoom, drift.
- [ ] Camera B/C chỉ xuất hiện khi đã khai báo trong Continuity Bible, có match-cut về A.
- [ ] Vật lý tự nhiên: không bay lơ lửng, không biến hình, không xuất hiện hoặc biến mất đột ngột.

## Âm thanh
- [ ] Trong prompt chỉ có diegetic sound, không nhạc, không lời.
- [ ] Bản đồ nhạc ở mục G có tiến trình cao trào theo nhịp, tempo, không đều đều.
- [ ] Có dòng xác nhận royalty-free.
- [ ] VO cao hơn nhạc 3–5 dB được ghi.

## Chính sách
- [ ] Mô tả có disclosure AI.
- [ ] Không bịa tên dự án, công ty, chi phí, kỷ lục, tiêu chuẩn thật.
- [ ] Không gọi hình ảnh AI là cảnh quay thật.
- [ ] Không chữ, logo, watermark trong prompt; overlay text chỉ ghi ở mục A.
- [ ] Đủ 6 metadata: thumbnail prompt, description, 3–5 hashtag, 30 keyword, pinned comment, filename.
