# Luật rà soát lỗi — năm loại bất thường

Chạy đủ năm loại trên toàn bảng, theo thứ tự. Một dòng có thể dính nhiều loại; ghi hết, không chọn một.

Chỉ dùng hai nhãn in hoa trong cột Ghi chú: **THIẾU DỮ LIỆU** và **SAI LỆCH**. Nhãn đặt đầu ô Ghi chú, theo sau là dấu hai chấm và một câu nói rõ thiếu gì hoặc lệch bao nhiêu.

## Loại 1 — THIẾU DỮ LIỆU: khuyết trường bắt buộc

Dòng thiếu một trong ba trường Số lượng, Đơn giá, Doanh thu.

- Để **trống** ô thiếu. Không gạch ngang, không số 0, không dấu hỏi.
- Ghi chú: `THIẾU DỮ LIỆU: <nói rõ sổ có gì và thiếu gì>.`
- Cấm tuyệt đối việc bù trường thiếu bằng phép tính từ hai trường còn lại. Doanh thu 96.000đ cho 3 hộp **không** cho phép kết luận đơn giá 32.000đ, vì có thể có khuyến mại, bớt giá hoặc ghi nhầm.
- Cũng cấm lấy đơn giá của dòng khác cùng tên hàng để bù, kể cả trong cùng một tuần.

*Ví dụ:* `30/08 – Bánh bao trứng muối – khách quen lấy – đơn giá 25.000đ` → trống Số lượng, trống Doanh thu, ghi chú `THIẾU DỮ LIỆU: sổ chỉ ghi đơn giá 25.000đ, không ghi số lượng và số tiền thu. Không tự điền.`

## Loại 2 — SAI LỆCH: mâu thuẫn số học

Dòng có đủ ba trường nhưng `Số lượng × Đơn giá ≠ Doanh thu`.

- **Giữ nguyên cả ba số gốc.** Không sửa số nào cho khớp, vì chưa biết sổ sai ở đâu.
- Ghi chú: `SAI LỆCH: <phép tính đúng> = <kết quả>, sổ ghi thu <số gốc>, lệch <chênh>đ.` kèm câu chờ xác nhận sai ở đơn giá, số lượng hay số tiền thu.
- Trong bảng tổng hợp, tách dòng này thành nhóm riêng, không trộn vào nhóm kiểm chứng đúng.
- Nếu chênh lệch có thể đổi kết luận tổng thu, nêu cả hai con số trong phần tổng hợp và ghi rõ con số thứ hai **chưa được xác nhận**.

*Ví dụ:* `04/09 – Bánh mì xíu mại – 4 ổ – 28.000đ – thu 122.000đ` → `SAI LỆCH: 4 × 28.000 = 112.000đ, sổ ghi thu 122.000đ, lệch 10.000đ.`

## Loại 3 — Đơn gộp không tách được

Một khoản thu duy nhất ghi cho nhiều mặt hàng khác nhau, không có đơn giá từng món.

- Giữ **một dòng** cho cả đơn. Cột Sản phẩm ghi `Đơn gộp: <mặt hàng A> + <mặt hàng B>`; cột Số lượng ghi `<SL A> + <SL B>`.
- Cột Đơn giá để trống. Cột Doanh thu ghi đúng tổng thu của cả đơn, để tổng sổ không bị hụt.
- Nhãn dùng là **THIẾU DỮ LIỆU** (thiếu đơn giá từng món), kèm câu nói rõ vì sao không tách được.
- Không tự chia đều tổng thu cho các mặt hàng. Không mượn giá mặt hàng đó ở dòng khác để tách.
- Dòng này xếp vào nhóm "có thu nhưng không kiểm chứng được" trong bảng tổng hợp.

*Ví dụ:* `03/09 – Đơn gộp Khách Zalo: 4 Bánh mì xá xíu và 2 cà phê đen đá – thu 170.000đ` → một dòng, Đơn giá trống, Doanh thu 170.000đ, ghi chú `THIẾU DỮ LIỆU: sổ ghi gộp một khoản thu cho cả hai mặt hàng, không ghi đơn giá từng món nên không tách được doanh thu.`

## Loại 4 — Không nhất quán trong cách ghi

Dữ liệu không khuyết và không lệch, nhưng cách ghi không thống nhất nên sẽ làm sai thống kê nếu để nguyên.

Các dạng phải soi:
- **Tên hàng lệch nhau**: "xôi gà xé" (28/08) và "xôi gà" (02/09) — cùng món hay hai món?
- **Đơn vị lẫn lộn**: ổ / cái / hộp / ly cho cùng một loại hàng.
- **Trường bị khuyết đồng loạt ở mọi dòng**: ví dụ sổ không ghi năm cho bất kỳ ngày nào.
- **Cùng một mặt hàng, cùng tuần, hai mức giá khác nhau** mà sổ không ghi lý do.

Cách xử lý:
- Dữ liệu của dòng vẫn giữ nguyên, **không** gắn nhãn in hoa vào các ô số, vì bản thân số không sai.
- Ghi một câu nhắc trong cột Ghi chú của dòng liên quan, ví dụ: `Tên hàng khác với "xôi gà xé" ngày 28/08 – cần thống nhất danh mục.`
- Nếu khuyết đồng loạt ở mọi dòng (như thiếu năm), **không** lặp nhãn 18 lần. Nêu một lần ở phần Lưu ý chung ngay trên bảng, dùng chữ THIẾU DỮ LIỆU ở đó.
- Mọi điểm loại 4 đều phải xuất hiện trong danh sách việc cần hỏi lại.

## Loại 5 — Ngày không hợp lệ hoặc ngoài kỳ

Ngày của dòng không dùng được như sổ ghi. Soi ba dạng:

**5a. Ngày không tồn tại.** `31/09`, `30/02`, `32/08`, tháng 13. Sổ chắc chắn ghi sai, nhưng ngày đúng thì chưa biết.
- Giữ nguyên ngày sai trong cột Ngày, **không tự sửa** thành 30/09 hay 01/10.
- Nhãn **THIẾU DỮ LIỆU** kèm câu: `THIẾU DỮ LIỆU: ngày <dd/mm> không tồn tại, chưa xác định được ngày đúng.`
- Số tiền của dòng vẫn cộng vào tổng bình thường, vì tiền không sai, chỉ ngày sai.

**5b. Ngày nằm ngoài kỳ báo cáo.** Dòng ghi ngày trước hoặc sau khoảng thời gian của kỳ đang dọn.
- Bản thân số liệu không sai, nên **không gắn nhãn in hoa** vào các ô số.
- Ghi chú trong dòng: `Ngày này nằm ngoài kỳ <từ ngày>–<đến ngày> – cần xác nhận thuộc kỳ báo cáo nào.`
- Trong bảng tổng hợp thêm một chỉ tiêu phụ **"Trong đó: dòng ngoài kỳ"** (số dòng và số tiền), và nêu thêm một câu tổng thu của riêng kỳ nếu loại dòng đó ra, ghi rõ **chưa được xác nhận**.
- Không tự ý bỏ dòng ra khỏi bảng. Bỏ dòng là làm mất dữ liệu của sổ gốc.

**5c. Ngày phi lý so với thời điểm lập báo cáo.** Ngày ở tương lai, hoặc lùi quá xa so với các dòng còn lại (ví dụ cả sổ là tháng 9 mà một dòng ghi tháng 3).
- Giữ nguyên, ghi chú nêu rõ điểm bất thường, đưa vào danh sách hỏi lại.
- Nếu nghi sổ ghi nhầm tháng, **không sửa**, chỉ nêu khả năng trong ghi chú.

**Bẫy thường gặp:** sổ viết tay hay đảo ngày và tháng (`05/09` và `09/05`). Nếu cả sổ dùng dd/mm mà một dòng có phần đầu lớn hơn 12, đó là dấu hiệu dòng đó bị đảo. Vẫn **không tự sửa**, chỉ nêu nghi vấn và hỏi lại.

*Ví dụ:* `13/09 - 2 bánh mì ốp la - đg 20k - thu 40.000đ` trong kỳ 06/09–12/09 → số liệu khớp, giữ nguyên, ghi chú `Ngày này nằm ngoài kỳ 06/09–12/09 – cần xác nhận thuộc kỳ báo cáo nào.`, thêm chỉ tiêu "Trong đó: dòng ngoài kỳ — 1 dòng, 40.000đ".

## Quy tắc chốt

Sau khi chạy đủ năm loại, kiểm tra chéo: mỗi nhãn trong bảng phải có đúng một mục tương ứng trong danh sách việc cần hỏi lại, và ngược lại. Lệch nhau nghĩa là còn sót.
