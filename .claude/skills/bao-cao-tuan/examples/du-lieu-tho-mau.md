# Dữ liệu thô mẫu — dùng để chạy thử skill `bao-cao-tuan`

> **CẢNH BÁO: TOÀN BỘ SỐ LIỆU DƯỚI ĐÂY LÀ GIẢ LẬP.**
> Claude dựng bộ dữ liệu này theo yêu cầu của Giám đốc để nghiệm thu quy trình Báo cáo Tuần.
> Đây **không phải** sổ sách thật của Tiệm Cô Ba. Tuyệt đối không dùng cho kế toán,
> báo cáo doanh thu hay bất kỳ quyết định kinh doanh nào.

Bộ dữ liệu cố ý cài đủ bốn loại lỗi để kiểm tra khả năng phát hiện:

| Loại lỗi | Dòng cài | Mục đích kiểm tra |
|---|---|---|
| 1 – Khuyết trường | 07/09 xôi xá xíu (thiếu đơn giá); 08/09 bánh mì gà nướng xé (thiếu số lượng); 12/09 xôi mặn đặc biệt (thiếu doanh thu) | Ba vị trí khuyết khác nhau, xem có bị tự điền không |
| 2 – Mâu thuẫn số học | 09/09 bánh bao chay (10 × 15.000 = 150.000 nhưng ghi thu 140.000) | Lệch **thiếu** thay vì lệch thừa như tuần trước |
| 3 – Đơn gộp | 09/09 đơn gộp Zalo 174.000đ cho 3 bánh mì xíu mại + 2 xôi mặn đặc biệt | Cả hai món đều có giá ở dòng khác — bẫy mượn giá để tách |
| 4 – Không nhất quán | "xôi gà" (06/09) vs "xôi gà xé" (10/09); đơn vị "chiếc" vs "cái"; bánh mì heo quay 30k (06/09) và 35k (11/09); sổ không ghi năm; dòng 13/09 nằm ngoài tuần 06–12/09 | Năm dạng không nhất quán cùng lúc |

## Nhật ký bán hàng tuần này - Tiệm Cô Ba

```
06/09: 4 bánh mì heo quay - khách quen - dg 30k - thu 120.000đ
06/09 - 2 xôi gà - khách Zalo - đg 35k/hộp - thu 70.000đ
06/09: bánh bao kim sa - khách vãng lai - 3 chiếc - đg 20k - thu 60.000đ
07/09 - Bánh mì pate chả - 6 ổ - đơn giá 25k - thu 150.000đ
07/09: 2 ly cà phê sữa đá - đg 22k - thu 44.000đ
07/09 - Xôi xá xíu - khách quen - 2 hộp - thu 76.000đ
08/09 - Bánh mì ốp la - 5 ổ - đg 20.000 - thu 100.000đ
08/09: bánh mì gà nướng xé - giao chị Hoa - đg 30k - thu 90.000đ
09/09 - Đơn gộp Khách Zalo: 3 bánh mì xíu mại và 2 xôi mặn đặc biệt - thu 174.000đ
09/09: 10 bánh bao chay - đơn sỉ - đg 15k - thu 140.000đ
10/09 - Xôi gà xé - 2 hộp - đg 35.000 - thu 70.000đ
10/09: 3 bánh mì thịt nguội - khách quen - đg 32k - thu 96.000đ
11/09 - Bánh mì heo quay - 2 ổ - đg 35k - thu 70.000đ
11/09: xôi thịt kho trứng - 3 hộp - giá 40k - tổng thu 120.000đ
11/09 - bánh bao trứng muối - 4 cái - đg 25.000đ - thu 100.000đ
12/09: 2 bánh mì xá xíu - khách qua lấy - đg 28k - thu 56.000đ
12/09 - cà phê đen đá - 3 ly - đg 18k - thu 54.000đ
12/09: xôi mặn đặc biệt - 1 hộp - đg 45.000đ
13/09 - 2 bánh mì ốp la - khách vãng lai - đg 20k - thu 40.000đ
```

Tổng: 19 dòng. Kết quả chạy quy trình trên bộ này xem `vi-du-mau-thu-nghiem.md`.
