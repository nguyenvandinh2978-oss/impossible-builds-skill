# QC Checklist — Báo cáo Tuần

Đi qua từng mục trước khi xuất. Mục nào sai thì sửa rồi kiểm lại.

## Toàn vẹn dữ liệu
- [ ] Số dòng bảng bằng đúng số dòng sổ gốc. Đã đếm lại, không ước lượng.
- [ ] Thứ tự dòng giữ nguyên theo thời gian của sổ gốc.
- [ ] Không dòng nào bị gộp, tách thêm hay bỏ qua.
- [ ] Mọi con số trong bảng đều truy được về sổ gốc. Không có số nào do em tự tạo.

## Chuẩn hóa
- [ ] Đúng 6 cột, đúng thứ tự: Ngày, Sản phẩm, Số lượng, Đơn giá, Doanh thu, Ghi chú.
- [ ] Tiền viết đủ hàng nghìn kèm "đ". `30k` đã thành `30.000đ`.
- [ ] Số lượng có đơn vị. Cột Sản phẩm không còn lẫn mô tả khách hàng.
- [ ] Ngày giữ đúng dạng sổ gốc, không tự thêm năm.

## Năm loại lỗi
- [ ] Loại 1: mọi ô khuyết đều để trống và có nhãn **THIẾU DỮ LIỆU** kèm câu giải thích.
- [ ] Loại 2: đã chạy script đối soát `SL × ĐG = Doanh thu` cho mọi dòng đủ ba trường. Không nhẩm tay.
- [ ] Loại 2: dòng lệch giữ nguyên ba số gốc, nhãn **SAI LỆCH** có nêu số đúng và mức chênh.
- [ ] Loại 3: đơn gộp giữ một dòng, Đơn giá trống, Doanh thu ghi đủ tổng thu của đơn.
- [ ] Loại 4: đã soi tên hàng lệch nhau, đơn vị lẫn lộn, trường khuyết đồng loạt, cùng hàng hai giá.
- [ ] Loại 5: đã soi ngày không tồn tại, ngày ngoài kỳ, ngày phi lý, ngày bị đảo dd/mm.
- [ ] Loại 5: không tự sửa ngày sai, không bỏ dòng ngoài kỳ ra khỏi bảng.
- [ ] Có dòng ngoài kỳ thì bảng tổng hợp có chỉ tiêu phụ "Trong đó: dòng ngoài kỳ".
- [ ] Trường khuyết đồng loạt nêu một lần ở Lưu ý chung, không lặp nhãn ở từng dòng.

## Tổng hợp
- [ ] Đủ 6 chỉ tiêu, đúng tên và thứ tự.
- [ ] Tổng ba nhóm có tiền = Tổng thu ghi trong sổ. Đã cộng lại bằng máy.
- [ ] Dòng sai lệch không bị trộn vào nhóm kiểm chứng đúng.
- [ ] Con số phương án hai (nếu có) ghi rõ **chưa được xác nhận**.

## Danh sách hỏi lại
- [ ] Mỗi nhãn trong bảng có đúng một mục tương ứng. Không thừa, không thiếu.
- [ ] Mỗi câu hỏi là câu đóng, nêu rõ ngày và mặt hàng.

## Tệp và bàn giao
- [ ] Tên tệp đúng `yyyy-mm-dd-bao-cao-tuan-<chu-de>-v<n>.md` và `.csv`, ngày lập báo cáo.
- [ ] Không ghi đè bản v trước.
- [ ] CSV không dấu, tiền dạng số trần, ô thiếu để rỗng.
- [ ] Trả lời trong phiên theo cấu trúc 7 mục của CLAUDE.md, có dán bảng vào phần "Dữ liệu đã có".
- [ ] Chưa tạo Pull Request và chưa gửi ra ngoài khi chưa được Giám đốc duyệt.
