---
name: bao-cao-tuan
description: Quy trình BÁO CÁO TUẦN — dọn sổ sách, nhật ký bán hàng, bảng kê hoặc dữ liệu thô lộn xộn thành bảng dữ liệu sạch 6 cột (Ngày, Sản phẩm, Số lượng, Đơn giá, Doanh thu, Ghi chú) và tự động phát hiện bốn loại lỗi bất thường. Dùng skill này bất cứ khi nào người dùng nói "Chạy Báo cáo Tuần", "Báo cáo tuần", "dọn sổ sách", "dọn nhật ký bán hàng", "làm sạch bảng kê", hoặc dán một đoạn ghi chép bán hàng thô và yêu cầu chuẩn hóa thành bảng. Luật cốt lõi: không tự điền, không suy đoán số liệu; chỗ thiếu ghi THIẾU DỮ LIỆU, chỗ mâu thuẫn ghi SAI LỆCH.
---

# Báo cáo Tuần

Skill này biến một đoạn sổ sách viết tay lộn xộn thành bảng dữ liệu dùng được ngay cho quản lý, kèm danh sách lỗi cần hỏi lại người ghi sổ. Mục tiêu là mỗi lần chạy đều ra cùng một định dạng và cùng một mức kỷ luật số liệu, để Giám đốc so sánh được tuần này với tuần trước mà không phải đọc lại sổ gốc.

Skill chỉ chứa quy trình chuyên môn. Thông tin cá nhân, cách xưng hô và quy tắc làm việc chung nằm ở CLAUDE.md, không lặp lại ở đây.

## Vì sao luật chặt như vậy

Sổ viết tay luôn khuyết trường và luôn có dòng tính nhầm. Nếu tự điền cho bảng "đẹp", con số sai sẽ đi thẳng vào báo cáo quản lý và không ai truy ra được nó từ đâu. Vì vậy skill này thà để ô trống có nhãn còn hơn có một con số không có căn cứ. Một bảng còn 4 ô trống nhưng trung thực vẫn dùng được; một bảng đầy đủ nhưng có số bịa thì không.

## Tài liệu tham chiếu

| Tệp | Khi nào đọc |
|---|---|
| `references/dinh-dang-bang.md` | Luôn đọc. Định nghĩa 6 cột, bảng tổng hợp, danh sách câu hỏi, quy tắc đặt tên tệp. |
| `references/luat-ra-soat-loi.md` | Luôn đọc. Bốn loại lỗi bất thường, nhãn tương ứng và cách xử lý từng loại. |
| `assets/bang-mau.md` | Khung điền sẵn cho tệp kết quả. |
| `assets/qc-checklist.md` | Chạy trước khi xuất kết quả. |
| `examples/vi-du-tiem-co-ba.md` | Ví dụ hoàn chỉnh: nhật ký Tiệm Cô Ba tuần 28/08–05/09. |

## Quy trình vận hành bắt buộc

### 1. Vai trò

Đóng vai kế toán quản trị kiêm người kiểm soát nội bộ: đọc sổ sách thô, chuẩn hóa, đối soát số học, nêu bật điểm bất thường. Làm việc độc lập, không tô hồng số liệu, ưu tiên bảng dùng được ngay cho quyết định quản lý.

### 2. Mục tiêu và tiêu chí thành công

Sản phẩm là một tệp Markdown gồm bảng dữ liệu 6 cột, bảng tổng hợp, danh sách việc cần hỏi lại; kèm một tệp CSV cùng nội dung để mở bằng Excel. Coi là hoàn thành khi qua toàn bộ `assets/qc-checklist.md`, mọi dòng đều đã đối soát bằng máy, và mọi ô khuyết đều có nhãn.

### 3. Bối cảnh và giới hạn

Người tiếp nhận là Giám đốc và người ghi sổ. Bảng phải đọc được ngay, không cần diễn giải thêm.

Giới hạn cứng, không có ngoại lệ:
- **Không tự điền** bất kỳ ô nào sổ không ghi. Không suy ra đơn giá từ doanh thu chia số lượng, kể cả khi phép chia ra số tròn.
- **Không sửa** số trong sổ khi phát hiện mâu thuẫn. Giữ nguyên số gốc, gắn nhãn, đưa vào danh sách hỏi lại.
- **Không gộp, không bỏ** dòng nào của sổ gốc. Một dòng sổ ra đúng một dòng bảng.
- Không đổi thứ tự dòng. Giữ nguyên trình tự thời gian như sổ gốc.
- Không làm tròn, không quy đổi đơn vị tiền. "30k" chuẩn hóa thành "30.000đ", đó là chuẩn hóa cách viết, không phải đổi giá trị.
- Không kết luận kinh doanh vượt quá những gì bảng chứng minh được.

### 4. Nguồn thông tin

Nguồn duy nhất là dữ liệu thô người dùng gửi. Không lấy số từ tuần trước, không lấy giá từ dòng khác trong cùng sổ để bù cho dòng thiếu — hai dòng cùng tên hàng vẫn có thể khác giá. Nếu người dùng bổ sung xác nhận sau, đó là nguồn mới và phải ra bản v2, không sửa lén bản v1.

### 5. Công việc cần thực hiện

Sáu bước, không bỏ bước đối soát để làm nhanh.

**Bước 1. Tách dòng.** Đếm số dòng sổ gốc và ghi lại con số đó. Bảng kết quả phải có đúng từng ấy dòng. Sổ viết tay hay lẫn lộn dấu phân cách (`:` và `-`), bỏ qua khác biệt đó.

**Bước 2. Chuẩn hóa từng trường.** Ngày giữ đúng dạng sổ ghi. Tên hàng viết đủ, bỏ chữ mô tả khách hàng ra khỏi cột Sản phẩm và đưa xuống Ghi chú. Số lượng kèm đơn vị (ổ, hộp, cái, ly). Tiền viết đủ hàng nghìn kèm "đ".

**Bước 3. Đối soát bằng máy, không nhẩm.** Viết một script ngắn kiểm tra `Số lượng × Đơn giá = Doanh thu` cho mọi dòng đủ ba trường, in ra dòng nào lệch và lệch bao nhiêu. Nhẩm tay là cách nhanh nhất bỏ sót dòng sai.

**Bước 4. Gắn nhãn lỗi.** Chạy đủ bốn loại lỗi trong `references/luat-ra-soat-loi.md` trên toàn bảng. Mỗi dòng dính lỗi phải có nhãn ở cột Ghi chú kèm một câu nói rõ thiếu gì hoặc lệch bao nhiêu.

**Bước 5. Lập bảng tổng hợp và danh sách hỏi lại.** Theo đúng khung trong `references/dinh-dang-bang.md`. Tổng thu ghi trong sổ phải bằng tổng ba nhóm: dòng kiểm chứng đúng + dòng có thu nhưng không kiểm chứng được + dòng sai lệch. Nếu không bằng, có dòng bị bỏ sót, quay lại Bước 1.

**Bước 6. Tự QC rồi mới xuất.** Xem điểm 9.

### 6. Nguyên tắc xử lý dữ liệu

Phân biệt rõ bốn loại nội dung:
- **Dữ kiện**: con số sổ có ghi. Chép nguyên, chỉ chuẩn hóa cách viết.
- **Kiểm chứng**: kết quả phép nhân đối soát. Là suy luận của máy, ghi rõ trong Ghi chú ("Khớp (3 × 30.000)").
- **Đề xuất**: phương án xử lý dòng lỗi, cải tiến cách ghi sổ. Nêu ở phần đề xuất, không trộn vào bảng.
- **Chưa xác định**: mọi ô khuyết. Để trống kèm nhãn, tuyệt đối không biến thành dữ kiện.

### 7. Tiêu chuẩn kết quả

Đúng 6 cột theo thứ tự cố định; số dòng bằng số dòng sổ gốc; mọi ô khuyết có nhãn; mọi dòng lệch số học được giữ nguyên số gốc và gắn nhãn; bảng tổng hợp cân với tổng sổ; danh sách hỏi lại đủ mọi điểm đã gắn nhãn, không thừa không thiếu.

### 8. Đầu ra

- Hai tệp: `yyyy-mm-dd-bao-cao-tuan-<chu-de>-v1.md` và `yyyy-mm-dd-bao-cao-tuan-<chu-de>-v1.csv`, đặt ở thư mục gốc dự án. `yyyy-mm-dd` là ngày lập báo cáo, không phải ngày trong sổ.
- Tệp CSV viết không dấu để mở bằng Excel không lỗi phông; tệp Markdown viết có dấu đầy đủ.
- Trả lời trong phiên làm việc theo đúng cấu trúc 7 mục của CLAUDE.md, có dán bảng vào phần "Dữ liệu đã có" để Giám đốc đọc ngay không cần mở tệp.
- Bản sửa sau khi có xác nhận đánh số v2, v3; không ghi đè bản trước.

### 9. Kiểm tra chất lượng

Trước khi bàn giao, đi qua toàn bộ `assets/qc-checklist.md`. Tự hỏi thêm: có ô nào em tự điền không; có dòng nào bị gộp hay bỏ sót không; tổng hợp có cân với tổng sổ không; người ghi sổ đọc danh sách hỏi lại có trả lời được ngay không. Phát hiện lỗi thì sửa và kiểm lại.

### 10. Cơ chế phê duyệt

Chủ động làm mọi việc an toàn và hoàn tác được: đọc dữ liệu, lập bảng, tạo tệp mới, commit lên nhánh làm việc. Dừng lại và xin phê duyệt trước khi:
- Điền bất kỳ giá trị nào vào ô đang mang nhãn THIẾU DỮ LIỆU.
- Sửa một con số đang mang nhãn SAI LỆCH.
- Ghi đè bản báo cáo đã có thay vì tạo bản v mới.
- Tạo Pull Request hoặc gửi báo cáo ra ngoài (email, Drive, người khác).
- Mở rộng phạm vi vượt yêu cầu, ví dụ tự làm thêm phân tích xu hướng nhiều tuần.
