---
name: impossible-builds-video-director
description: Đạo diễn kịch bản và prompt video cho kênh YouTube Impossible Builds TV, tối ưu cho Veo 3 và Google Flow. Tạo gói sản xuất đầy đủ cho video dài (60 cảnh × 8 giây, 16:9) và video Short (7 cảnh × 8 giây, 9:16) gồm Khối 1 (prompt đánh số) và Khối 2 (phân tích, Continuity Bible, voice-over, bản đồ nhạc, metadata). Dùng skill này bất cứ khi nào người dùng nhắc đến Impossible Builds, Veo, Flow, prompt video xây dựng, cầu/đập/hầm/cảng bất khả thi, video Short kỹ thuật, ngân hàng tiêu đề, hoặc trả lời bình luận kỹ thuật cho kênh, kể cả khi họ chỉ dán một tiêu đề và nói "làm video này".
---

# Impossible Builds Video Director

Skill này biến một tiêu đề thành gói sản xuất hoàn chỉnh cho Impossible Builds TV: prompt Veo 3 theo từng cảnh 8 giây, sẵn sàng dán vào Google Flow, cộng toàn bộ phần hậu kỳ (voice-over, nhạc, metadata). Mọi quy tắc trong đây đã được kênh duyệt. Mục tiêu là để mỗi gói đầu ra giống hệt nhau về kỷ luật dù đề bài khác nhau, vì kênh dựng hàng chục video theo cùng một hệ thống và bất kỳ sai lệch định dạng nào cũng làm gãy quy trình sản xuất.

## Vì sao khung này chặt như vậy

Veo 3 sinh từng clip 8 giây độc lập. Nếu prompt không tự khóa địa điểm, đội, máy móc và trạng thái tiến độ, các clip sẽ không ghép được thành một câu chuyện liên tục. Vì vậy mỗi prompt phải là một đoạn văn tự đủ, kế thừa trạng thái cảnh trước và bàn giao trạng thái cho cảnh sau. Kênh không dùng thoại nhân vật vì lipsync AI dễ lỗi và khuôn mặt AI dễ trôi, nên toàn bộ thông tin đi qua giọng thuyết minh hậu kỳ. An toàn lao động là ranh giới cứng vì hình ảnh công nhân đứng trong bê tông ướt vừa sai kỹ thuật vừa kéo bình luận tiêu cực.

## Tài liệu tham chiếu

Đọc theo thứ tự này. Đừng viết prompt trước khi đọc xong `channel-dna.md` và tệp chế độ tương ứng.

| Tệp | Khi nào đọc |
|---|---|
| `references/channel-dna.md` | Luôn đọc. Cơ chế cốt truyện, Hook Lock, Continuity Bible, nhân vật, an toàn, camera, âm thanh, chính sách. |
| `references/long-form-mode.md` | Khi làm video dài. Phân bổ 60 hoặc 75 cảnh theo giai đoạn, vote A/B, lịch xuất bản. |
| `references/shorts-mode.md` | Khi làm Short. Ba vai trò, nhịp 56 giây, CTA cố định. |
| `references/output-format.md` | Luôn đọc trước khi viết. Cấu trúc Khối 1 và Khối 2, metadata bắt buộc. |
| `references/title-bank.md` | Khi người dùng đưa tiêu đề từ nguồn khác hoặc xin ngân hàng tiêu đề. |
| `references/comment-replies.md` | Khi người dùng xin trả lời bình luận kỹ thuật. |
| `assets/prompt-skeleton.md` | Khung điền cho một prompt 8 giây. |
| `assets/block2-template.md` | Khung điền cho Khối 2. |
| `assets/negative-prompt-master.md` | Chuỗi negative prompt đầy đủ, dán nguyên vào cuối mỗi prompt. |
| `assets/qc-checklist.md` | Chạy trước khi xuất kết quả. |
| `examples/short-example.md` | Ví dụ Short vai trò 2, đủ 7 cảnh và Khối 2. |
| `examples/long-form-example.md` | Ví dụ video dài đủ 60 cảnh và Khối 2. |

## Quy trình

### Bước 1. Xác định chế độ làm việc

Đọc yêu cầu và xếp vào một trong bốn chế độ:

- **Gói đầy đủ** (mặc định): Khối 1 + Khối 2 cho một video dài hoặc một Short.
- **Chỉ prompt**: người dùng nói "chỉ cần prompt", vẫn xuất Khối 1 + Khối 2 đầy đủ, chỉ bỏ phần văn xuôi giới thiệu. Không bỏ mục nào trong Khối 2 trừ khi được yêu cầu rõ.
- **Phân tích văn xuôi**: người dùng muốn bàn về hook, curiosity gap, thời lượng, CTA. Vẫn tạo đủ Khối 1 + Khối 2, thêm khung văn xuôi tiếng Việt trước hoặc quanh.
- **Ngân hàng tiêu đề** hoặc **trả lời bình luận**: đọc tệp tương ứng, không cần Khối 1.

Nếu đề bài là Short và tiêu đề khớp nhiều vai trò (ví dụ vừa là kết quả, vừa là khoảnh khắc nguy hiểm), hỏi lại người dùng chọn vai trò trước khi viết. Đây là trường hợp duy nhất nên dừng để hỏi.

### Bước 2. Lọc tiêu đề

Soi tiêu đề qua ba lỗi trong `title-bank.md`: bịa số liệu thật, kể tuần tự kiểu "step by step" hoặc "X: Y", phạm vi phóng đại. Nếu dính lỗi, viết lại và nêu ngắn gọn lý do trước khi tiếp tục. Xác định payoff bắt buộc theo Quy tắc phạm vi: tiêu đề nói "trụ/móng" thì kết thúc ở thử tải, nói "cầu" thì cầu phải vận hành.

### Bước 3. Khóa Continuity Bible trước khi viết

Quyết định và ghi ra trước: một địa điểm với hình học cố định, một đội với PPE theo vai trò, một bộ máy móc có tên và màu, một bảng vật liệu, Camera B/C nếu cần. Chọn xung đột hình ảnh mạnh nhất cho Hook Lock. Lập bảng phân bổ cảnh theo giai đoạn (dùng bảng trong tệp chế độ). Chỉ khi bảng này xong mới viết prompt, vì viết prompt rồi mới nghĩ máy móc là cách nhanh nhất tạo lỗi nhân bản thiết bị.

### Bước 4. Viết Khối 1

Với mỗi cảnh, điền `prompt-skeleton.md` thành một đoạn văn liên tục tiếng Anh. Trạng thái kết thúc của cảnh N là trạng thái kế thừa của cảnh N+1, ghi tường minh ở cả hai chỗ. Cứ khoảng 2 giây một chuyển biến mới. Kết thúc mỗi prompt bằng chuỗi negative prompt đầy đủ trong `negative-prompt-master.md`, không rút gọn, không "etc.".

### Bước 5. Viết Khối 2

Điền `block2-template.md` đủ 9 mục A đến I. Video dài thêm 2 lựa chọn vote, pinned voting comment, lịch Related Video. Voice-over tiếng Anh-Mỹ khớp từng cảnh. Bản đồ nhạc ghi tiến trình cao trào theo nhịp, kèm dòng xác nhận royalty-free.

### Bước 6. Tự QC rồi mới xuất

Đi qua `qc-checklist.md`. Sửa lỗi liên tục, phạm vi, nhịp, camera, âm thanh, an toàn, chính sách trước khi trả kết quả. Không để người dùng phát hiện lỗi định dạng.

## Ngôn ngữ đầu ra

- Khối 1 (prompt), voice-over, tiêu đề, mô tả, hashtag, keyword, pinned comment, tên file: **tiếng Anh**.
- Phần phân tích, ghi chú, giải thích cho người dùng: **tiếng Việt**, trừ khi người dùng yêu cầu khác.
- Tiêu đề mục trong Khối 2 giữ nguyên tên tiếng Anh như mẫu để dễ đối chiếu.

## Những điều không bao giờ làm

- Không mở video bằng logo, lời chào, lịch sử dự án, toàn cảnh tĩnh.
- Không cho nhân vật nói, kể cả bộ đàm. Không lộ mặt khi có thể tránh.
- Không cho công nhân đứng trong bê tông ướt, hố khoan, vùng tải treo.
- Không pan, tilt, orbit, zoom với Camera A.
- Không chèn nhạc hay chữ vào prompt. Nhạc và overlay text thuộc hậu kỳ.
- Không bịa tên dự án, công ty, chi phí, kỷ lục, tiêu chuẩn kỹ thuật thật.
- Không gọi hình ảnh AI là cảnh quay thật.
