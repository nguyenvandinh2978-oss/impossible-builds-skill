# Định dạng bảng — cố định, không đổi giữa các tuần

## Cấu trúc tệp kết quả

Theo đúng thứ tự này, không thêm bớt mục:

1. Tiêu đề: `# Bảng dữ liệu bán hàng – <Tên tiệm> (<từ ngày> – <đến ngày>)`
2. Ba dòng đầu đề: nguồn dữ liệu; nguyên tắc xử lý; lưu ý chung về trường khuyết đồng loạt.
3. `## Bảng dữ liệu` — bảng 6 cột.
4. `## Tổng hợp` — bảng 6 chỉ tiêu.
5. `## Danh sách việc cần hỏi lại <người ghi sổ>` — đánh số.

## Sáu cột, thứ tự cố định

| Cột | Nội dung | Quy tắc viết |
|---|---|---|
| Ngày | Ngày phát sinh | Giữ đúng dạng sổ gốc, ví dụ `28/08`. Không tự thêm năm. |
| Sản phẩm | Tên mặt hàng | Viết đủ, có dấu. Bỏ mô tả khách hàng ra khỏi cột này. Đơn gộp ghi `Đơn gộp: A + B`. |
| Số lượng | Số kèm đơn vị | `3 ổ`, `2 hộp`, `10 cái`, `2 ly`. Đơn gộp ghi `4 ổ + 2 ly`. Thiếu thì để trống. |
| Đơn giá | Giá một đơn vị | `30.000đ`. Chuẩn hóa `30k` → `30.000đ`. Thiếu thì để trống. |
| Doanh thu | Số tiền thực thu theo sổ | `90.000đ`. Luôn chép số sổ ghi, kể cả khi lệch phép tính. Thiếu thì để trống. |
| Ghi chú | Nhãn lỗi + thông tin khách + kết quả đối soát | Nhãn in hoa đứng đầu nếu có. Dòng sạch ghi `<Loại khách>. Khớp (3 × 30.000).` |

## Bảng tổng hợp

Sáu chỉ tiêu, giữ nguyên tên và thứ tự:

| Chỉ tiêu | Cách tính |
|---|---|
| Số dòng ghi nhận | Bằng số dòng sổ gốc. Ghi chú nếu có dòng gộp. |
| Dòng kiểm chứng đúng (SL × ĐG = Doanh thu) | Số dòng và tổng tiền. Đây là phần số sạch dùng được ngay. |
| Dòng có thu nhưng không kiểm chứng được | Dòng thiếu đơn giá và dòng đơn gộp. Số dòng và tổng tiền. |
| Dòng sai lệch | Số dòng, ghi số theo sổ, nêu số đúng theo phép tính ở cột ghi chú. |
| Dòng thiếu hoàn toàn doanh thu | Số dòng. Không có tiền để cộng. |
| **Tổng thu ghi trong sổ** | Tổng ba nhóm có tiền ở trên. Phải cân, nếu không cân là sót dòng. |

Dưới bảng, nếu có dòng sai lệch, thêm một câu nêu tổng thu phương án hai và ghi rõ **chưa được xác nhận**.

## Danh sách việc cần hỏi lại

Đánh số, mỗi dòng một câu hỏi đóng, trả lời được bằng một con số hoặc một chữ có/không. Nêu rõ ngày và mặt hàng để người ghi sổ tra lại được. Xếp theo thứ tự: lỗi loại 1, loại 2, loại 3, rồi loại 4.

## Quy tắc đặt tên tệp

Theo CLAUDE.md: chữ thường, không dấu, gạch ngang.

- `yyyy-mm-dd-bao-cao-tuan-<chu-de>-v1.md`
- `yyyy-mm-dd-bao-cao-tuan-<chu-de>-v1.csv`

`yyyy-mm-dd` là ngày lập báo cáo. Bản sửa sau khi có xác nhận số liệu đánh `v2`, `v3`; không ghi đè, không dùng `final`, `new`, `latest`.

## Quy tắc tệp CSV

Cùng 6 cột, cùng thứ tự dòng. Viết **không dấu** để mở bằng Excel không lỗi phông. Tiền ghi dạng số trần `30000` để Excel tính được. Ô thiếu để rỗng. Nhãn viết `THIEU DU LIEU` và `SAI LECH`.
