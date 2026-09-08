# Output Format — Định dạng đầu ra nghiêm ngặt

Đọc trước khi viết. Định dạng sai làm gãy quy trình dán vào Flow và dựng hậu kỳ.

## Khối 1 — Prompt

**Quy tắc hình thức:**
- Chỉ prompt đánh số. Bắt đầu bằng "1." cùng dòng với nội dung.
- Không tiêu đề, không bullet, không code fence, không dòng nhạc riêng, không giải thích xen vào.
- Đúng 1 dòng trống giữa các prompt.
- Mỗi prompt là **một đoạn văn liên tục** tiếng Anh.
- Video dài: 60 prompt (hoặc số đã thống nhất). Short: đúng 7 prompt.

**Thành phần bắt buộc trong mỗi prompt, theo thứ tự:**
1. Mục đích câu chuyện của cảnh (story purpose).
2. Trạng thái kế thừa từ cảnh trước (inherited state).
3. Camera: Camera A với thông số, hoặc B/C nếu đã khai báo.
4. Nhịp 0–1s / 1–3s / 3–6s / 6–8s.
5. Thời lượng thực tế được nén và phương pháp nén thời gian (ví dụ "represents about 30 working hours compressed roughly 1,300×").
6. Ánh sáng và thời tiết.
7. SFX diegetic.
8. Điểm neo liên tục (continuity anchors): máy móc, số cấu kiện, mốc địa hình.
9. Trạng thái kết thúc (end state) bàn giao cho cảnh sau.
10. Các khóa: continuity lock, safety lock, worker position.
11. **Negative prompt đầy đủ** ở cuối, lấy nguyên từ `assets/negative-prompt-master.md`. Không viết tắt, không "etc.".

Xem `assets/prompt-skeleton.md` để có khung điền.

## Khối 2 — PHÂN TÍCH VÀ GHI CHÚ RIÊNG

Tiêu đề mục: **PHÂN TÍCH VÀ GHI CHÚ RIÊNG**. Gồm đúng các mục sau, giữ chữ cái và tên tiếng Anh:

| Mục | Nội dung |
|---|---|
| A. Strategic Core | Xung đột hình ảnh mạnh nhất, công thức hook đã chọn, câu hỏi tiêu đề và cảnh trả lời, payoff theo Quy tắc phạm vi, dòng gợi ý hook text overlay (chỉ hậu kỳ). |
| B. Continuity Bible | Địa điểm và hình học, số cấu kiện, đội và PPE theo vai trò, bộ máy móc tên và màu, bảng vật liệu, Camera B/C nếu dùng, tiến trình thời tiết và ánh sáng. |
| C. Master Reference Image Prompt | Một prompt ảnh tiếng Anh để tạo ảnh tham chiếu dùng làm Ingredient trong Flow: toàn cảnh địa điểm từ Camera A với máy móc đúng màu, không người lộ mặt, không chữ. |
| D. Construction State Ledger | Bảng cảnh → trạng thái bắt đầu → trạng thái kết thúc. Đây là công cụ kiểm tra chuỗi liên hoàn. |
| E. Worker Position Ledger | Bảng cảnh → công nhân xuất hiện → vị trí và bề mặt đứng → hành động → xác nhận an toàn. Cảnh không có công nhân ghi "none". |
| F. Voice-over hậu kỳ đầy đủ | Toàn bộ lời thuyết minh tiếng Anh-Mỹ, đánh số theo cảnh, khớp 8 giây mỗi cảnh. |
| G. Bản đồ âm thanh và nhạc epic | Tiến trình cao trào theo từng nhịp (cảnh hoặc mốc giây), tempo, lớp âm thanh, SFX hậu kỳ, mức VO so với nhạc, dòng xác nhận royalty-free. |
| H. Thumbnail / Description / Hashtag / Keyword / Pinned comment / Filename | Đủ 6 metadata bên dưới. |
| I. QC Checklist | Đánh dấu từng mục trong `assets/qc-checklist.md`, gồm vật lý tự nhiên, negative prompt đầy đủ, chuỗi tình huống liên hoàn, nhạc tăng tiến theo nhịp. |

**Riêng video dài thêm:** 2 lựa chọn vote, pinned voting comment theo mẫu, lịch Related Video và xuất bản.

Xem `assets/block2-template.md` để có khung điền.

## Sáu metadata luôn có (Long và Short)

1. **Prompt ảnh thumbnail** tiếng Anh. Thử tạo ảnh thật nếu có công cụ, không thì ghi chú "ready for external image tool".
2. **Mô tả** kèm câu disclosure AI, ví dụ: "This video is an AI-generated engineering visualization created for educational and entertainment purposes. It does not depict a real project, company, or location."
3. **3–5 hashtag** đang trend hoặc liên quan cao.
4. **30 từ khóa SEO** viết liền, cách nhau bằng dấu phẩy. Bao gồm góc "bridge demolition" khi video có cảnh phá dỡ.
5. **Pinned comment**: Long là bình chọn A/B, Short là dẫn về video dài liên quan.
6. **Tên file**: chữ-thường-cách-nhau-bằng-gạch-ngang.mp4.

## Thứ tự xuất

1. (Tùy chọn) Khung văn xuôi tiếng Việt nếu người dùng yêu cầu phân tích.
2. Khối 1.
3. Khối 2.

Không chèn bất cứ gì giữa các prompt trong Khối 1.
