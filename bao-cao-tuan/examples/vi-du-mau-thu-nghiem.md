# Bảng dữ liệu bán hàng – Tiệm Cô Ba (06/09 – 12/09)

> **CẢNH BÁO: SỐ LIỆU GIẢ LẬP, KHÔNG DÙNG CHO KẾ TOÁN.**
> Đây là kết quả chạy thử skill `bao-cao-tuan` trên bộ dữ liệu mẫu `du-lieu-tho-mau.md`
> do Claude dựng theo yêu cầu của Giám đốc để nghiệm thu quy trình.

Nguồn: bộ dữ liệu thô giả lập `du-lieu-tho-mau.md`, 19 dòng.
Nguyên tắc xử lý: **chỉ chuẩn hóa hình thức, không tự điền và không suy đoán số liệu**.
Chỗ nào sổ không ghi thì để trống và đánh dấu `THIẾU DỮ LIỆU`; chỗ nào số liệu tự mâu thuẫn thì giữ nguyên số trong sổ và đánh dấu `SAI LỆCH`.

Lưu ý chung: sổ **không ghi năm** cho bất kỳ dòng nào — `THIẾU DỮ LIỆU` ở cấp toàn bảng. Cột Ngày giữ đúng dạng ngày/tháng như sổ gốc.

## Bảng dữ liệu

| Ngày | Sản phẩm | Số lượng | Đơn giá | Doanh thu | Ghi chú |
|---|---|---|---|---|---|
| 06/09 | Bánh mì heo quay | 4 ổ | 30.000đ | 120.000đ | Khách quen. Khớp (4 × 30.000). Xem dòng 11/09 cùng mặt hàng nhưng giá 35.000đ. |
| 06/09 | Xôi gà | 2 hộp | 35.000đ | 70.000đ | Khách Zalo. Khớp (2 × 35.000). Tên hàng khác với "xôi gà xé" ngày 10/09 – cần thống nhất danh mục. |
| 06/09 | Bánh bao kim sa | 3 chiếc | 20.000đ | 60.000đ | Khách vãng lai. Khớp (3 × 20.000). Đơn vị ghi "chiếc", các dòng bánh bao khác ghi "cái" – cần thống nhất. |
| 07/09 | Bánh mì pate chả | 6 ổ | 25.000đ | 150.000đ | Khớp (6 × 25.000). |
| 07/09 | Cà phê sữa đá | 2 ly | 22.000đ | 44.000đ | Khớp (2 × 22.000). |
| 07/09 | Xôi xá xíu | 2 hộp | | 76.000đ | **THIẾU DỮ LIỆU**: sổ không ghi đơn giá. Không suy ra từ doanh thu chia số lượng. Khách quen. |
| 08/09 | Bánh mì ốp la | 5 ổ | 20.000đ | 100.000đ | Khớp (5 × 20.000). |
| 08/09 | Bánh mì gà nướng xé | | 30.000đ | 90.000đ | **THIẾU DỮ LIỆU**: sổ không ghi số lượng. Không suy ra từ doanh thu chia đơn giá. Giao chị Hoa. |
| 09/09 | Đơn gộp: bánh mì xíu mại + xôi mặn đặc biệt | 3 ổ + 2 hộp | | 174.000đ | **THIẾU DỮ LIỆU**: sổ ghi gộp một khoản thu 174.000đ cho cả hai mặt hàng, không ghi đơn giá từng món nên không tách được. Không mượn giá ở dòng khác để tách. Khách Zalo. |
| 09/09 | Bánh bao chay | 10 cái | 15.000đ | 140.000đ | **SAI LỆCH**: 10 × 15.000 = 150.000đ, sổ ghi thu 140.000đ, lệch 10.000đ. Giữ nguyên số trong sổ, chờ Tiệm xác nhận sai ở đơn giá, số lượng hay số tiền thu. Đơn sỉ. |
| 10/09 | Xôi gà xé | 2 hộp | 35.000đ | 70.000đ | Khớp (2 × 35.000). Tên hàng khác với "xôi gà" ngày 06/09 – cần thống nhất danh mục. |
| 10/09 | Bánh mì thịt nguội | 3 ổ | 32.000đ | 96.000đ | Khách quen. Khớp (3 × 32.000). |
| 11/09 | Bánh mì heo quay | 2 ổ | 35.000đ | 70.000đ | Khớp (2 × 35.000). Cùng mặt hàng, cùng tuần, giá khác dòng 06/09 (30.000đ) – sổ không ghi lý do. |
| 11/09 | Xôi thịt kho trứng | 3 hộp | 40.000đ | 120.000đ | Khớp (3 × 40.000). |
| 11/09 | Bánh bao trứng muối | 4 cái | 25.000đ | 100.000đ | Khớp (4 × 25.000). |
| 12/09 | Bánh mì xá xíu | 2 ổ | 28.000đ | 56.000đ | Khách qua lấy. Khớp (2 × 28.000). |
| 12/09 | Cà phê đen đá | 3 ly | 18.000đ | 54.000đ | Khớp (3 × 18.000). |
| 12/09 | Xôi mặn đặc biệt | 1 hộp | 45.000đ | | **THIẾU DỮ LIỆU**: sổ không ghi số tiền thu. Không tự điền dù có đủ số lượng và đơn giá. |
| 13/09 | Bánh mì ốp la | 2 ổ | 20.000đ | 40.000đ | Khách vãng lai. Khớp (2 × 20.000). **Lỗi loại 5b**: ngày này nằm **ngoài** kỳ 06/09–12/09 – cần xác nhận thuộc kỳ báo cáo nào. |

## Tổng hợp

| Chỉ tiêu | Giá trị | Ghi chú |
|---|---|---|
| Số dòng ghi nhận | 19 | Trong đó 1 dòng gộp hai mặt hàng (09/09) và 1 dòng ngoài kỳ (13/09). |
| Dòng kiểm chứng đúng (SL × ĐG = Doanh thu) | 14 dòng – **1.150.000đ** | Số sạch, dùng được ngay. Đã gồm dòng 13/09 ngoài kỳ. |
| Dòng có thu nhưng không kiểm chứng được | 3 dòng – **340.000đ** | 07/09 xôi xá xíu 76.000đ; 08/09 bánh mì gà nướng xé 90.000đ; 09/09 đơn gộp 174.000đ. |
| Dòng sai lệch | 1 dòng – **140.000đ** theo sổ | 09/09 bánh bao chay; nếu đúng đơn giá thì phải là 150.000đ. |
| Dòng thiếu hoàn toàn doanh thu | 1 dòng | 12/09 xôi mặn đặc biệt. |
| *Trong đó: dòng ngoài kỳ* | *1 dòng – 40.000đ* | *13/09 bánh mì ốp la, lỗi loại 5b.* |
| **Tổng thu ghi trong sổ** | **1.630.000đ** | Chưa xử lý phần sai lệch 10.000đ và chưa cộng dòng 12/09. |

Nếu dòng 09/09 được xác nhận là ghi thiếu tiền thu, tổng thu sẽ là **1.640.000đ** (chưa kể dòng 12/09 còn thiếu). Con số này **chưa được xác nhận**.

Nếu dòng 13/09 không thuộc kỳ này, tổng thu của tuần 06–12/09 giảm còn **1.590.000đ**. Con số này **chưa được xác nhận**.

## Danh sách việc cần hỏi lại Tiệm Cô Ba

1. **07/09 – xôi xá xíu**: đơn giá thực tế là bao nhiêu (thu 76.000đ cho 2 hộp)?
2. **08/09 – bánh mì gà nướng xé**: bán bao nhiêu ổ (đơn giá 30.000đ, thu 90.000đ)?
3. **12/09 – xôi mặn đặc biệt**: đã thu tiền chưa, thu bao nhiêu?
4. **09/09 – bánh bao chay**: sai ở đơn giá, số lượng hay số tiền thu (lệch 10.000đ)?
5. **09/09 – đơn gộp khách Zalo**: giá bánh mì xíu mại và xôi mặn đặc biệt từng món?
6. **06/09 và 11/09 – bánh mì heo quay**: vì sao một dòng 30.000đ, một dòng 35.000đ?
7. **Danh mục hàng**: "xôi gà" (06/09) và "xôi gà xé" (10/09) có phải cùng một món không?
8. **Đơn vị tính**: bánh bao ghi "chiếc" hay "cái" — chọn một để thống nhất.
9. **13/09**: dòng này thuộc tuần báo cáo này hay tuần sau?
10. **Năm của các ngày** trong sổ.

## Kết quả nghiệm thu quy trình

| Loại lỗi cài vào | Số dòng cài | Số dòng phát hiện | Kết quả |
|---|---|---|---|
| 1 – Khuyết trường | 3 | 3 | Đạt |
| 2 – Mâu thuẫn số học | 1 | 1 | Đạt |
| 3 – Đơn gộp không tách được | 1 | 1 | Đạt |
| 4 – Không nhất quán | 4 dạng | 4 dạng | Đạt |
| 5 – Ngày ngoài kỳ | 1 | 1 | Đạt (bổ sung sau lần chạy này) |

Cân đối: 1.150.000 + 340.000 + 140.000 = 1.630.000đ, khớp tổng sổ. Số dòng bảng 19 = số dòng sổ gốc 19.
