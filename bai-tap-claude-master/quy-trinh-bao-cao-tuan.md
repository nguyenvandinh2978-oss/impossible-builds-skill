# QUY TRÌNH: BÁO CÁO TUẦN

Chủ sở hữu: Nguyễn Văn Định
Ngày lưu: 2026-09-18
Trạng thái: ĐANG HOẠT ĐỘNG

## Cách kích hoạt

Gõ đúng ba chữ **`Chạy Báo cáo Tuần`** (hoặc `Báo cáo Tuần`) rồi gửi kèm dữ liệu thô mới.
Không cần nhắc lại định dạng cột, không cần nhắc lại luật rà lỗi. Toàn bộ quy tắc dưới đây
được áp dụng tự động.

## Đầu ra bắt buộc — bảng 6 cột, đúng thứ tự

| Ngày | Sản phẩm | Số lượng | Đơn giá | Doanh thu | Ghi chú |
|---|---|---|---|---|---|

Quy ước trình bày:
- Ngày giữ đúng định dạng trong sổ gốc (ví dụ `28/08`).
- Số lượng luôn kèm đơn vị tính (ổ, hộp, cái, ly).
- Đơn giá và Doanh thu ghi đầy đủ theo đồng, có dấu chấm phân cách nghìn (`30.000đ`).
- Ghi chú ghi ngắn gọn: thông tin khách hàng, và nhãn lỗi nếu có.
- Dòng gộp nhiều mặt hàng phải **tách thành nhiều dòng**, mỗi mặt hàng một dòng.
- Cuối bảng luôn kèm phần **BÁO CÁO LỖI** và phần **ĐỐI CHIẾU TỔNG TIỀN**.

## LUẬT GẮT GAO — tuyệt đối không được vi phạm

1. **Không đoán mò.** Chỗ nào dữ liệu thiếu thì ghi đúng chữ `THIẾU DỮ LIỆU` vào ô đó.
   Tuyệt đối không tự suy ra, không tự điền, không tự làm tròn.
2. **Không tự sửa đè lên sổ.** Chỗ nào số liệu mâu thuẫn thì ghi chữ `SAI LỆCH` ở cột Ghi chú,
   nêu rõ số đúng theo phép tính và số sổ đang ghi, nhưng **giữ nguyên con số gốc** ở cột
   Doanh thu để còn đối chiếu.
3. **Không im lặng bỏ qua.** Mọi dòng có vấn đề đều phải xuất hiện trong bảng và trong phần
   BÁO CÁO LỖI, không được lược bỏ cho bảng đẹp.
4. **Không suy đơn giá từ phép chia.** Có tổng thu và số lượng nhưng thiếu đơn giá thì vẫn
   ghi `THIẾU DỮ LIỆU`, vì không loại trừ khả năng có giảm giá hoặc khuyến mãi.
5. **Nêu rõ việc cần người xác nhận.** Cuối báo cáo liệt kê các câu hỏi cần chủ tiệm trả lời.

## BỐN LOẠI LỖI PHẢI TỰ ĐỘNG PHÁT HIỆN

| # | Loại lỗi | Dấu hiệu nhận biết | Xử lý |
|---|---|---|---|
| 1 | **Thiếu số lượng** | Dòng có tên hàng và đơn giá nhưng không có số lượng | Số lượng và Doanh thu đều ghi `THIẾU DỮ LIỆU` |
| 2 | **Thiếu đơn giá** | Dòng có số lượng và tổng thu nhưng không ghi đơn giá | Đơn giá ghi `THIẾU DỮ LIỆU`, không chia ngược ra |
| 3 | **Gộp đơn** | Một dòng chứa từ hai mặt hàng trở lên, chỉ có một tổng thu | Tách thành nhiều dòng; Đơn giá và Doanh thu từng dòng ghi `THIẾU DỮ LIỆU`, ghi chú tổng chung của cả đơn |
| 4 | **Sai số liệu** | Số lượng × Đơn giá ≠ Doanh thu ghi trong sổ | Ghi `SAI LỆCH`, nêu rõ số đúng và số chênh lệch |

Ngoài bốn loại trên, nếu phát hiện bất thường khác (trùng dòng, ngày không hợp lệ, đơn vị
tính lẫn lộn) thì báo thêm ở mục **Bất thường khác**, không gộp vào bốn loại chuẩn.

## ĐỐI CHIẾU TỔNG TIỀN — luôn có ở cuối

| Chỉ tiêu | Cách tính |
|---|---|
| Tổng doanh thu theo đúng con số ghi sổ | Cộng nguyên các con số sổ ghi |
| Tổng sau khi sửa các lỗi phép tính | Thay con số sai bằng kết quả tính đúng |
| Chênh lệch do lỗi ghi chép | Hiệu của hai dòng trên |

Luôn nói rõ những dòng nào **chưa được tính vào tổng** vì thiếu căn cứ.

---

## Lần chạy tham chiếu

Ngày 2026-09-18, chạy trên tệp `so-ban-hang-mau.txt` (Tiệm Cô Ba, tuần 28/08 – 05/09):
18 dòng sổ gốc → 19 dòng bảng sạch, phát hiện đúng 4 lỗi (thiếu số lượng 30/08, thiếu đơn
giá 01/09, gộp đơn 03/09, sai phép tính 04/09 lệch 10.000đ). Tổng ghi sổ 1.452.000đ, tổng
sau sửa 1.442.000đ. Chi tiết xem `2026-09-18-bai-tap-1-viec-lap-lai-v1.md`.
