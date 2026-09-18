# Bài tập 1 — Tự động hóa việc lặp đi lặp lại hằng tuần (Claude Master)

Người làm: Nguyễn Văn Định
Ngày soạn: 2026-09-18
Nguồn đề bài: `bai-tap-1-viec-lap-lai-hoc-vien-doc.pdf`
Dữ liệu mẫu: `so-ban-hang-mau.txt`

> **Lưu ý về cách dùng tệp này.** Đề bài bắt buộc toàn bộ bài tập phải thực hiện trực tiếp
> trên Claude Chat ở trình duyệt web, và phải nộp **ảnh chụp màn hình**. Tệp này KHÔNG thay
> được ảnh chụp màn hình. Nó là bản chuẩn bị: Giám đốc chốt phần 1, rồi dán các câu lệnh ở
> phần 3 và phần 4 vào Claude Chat, chụp màn hình kết quả để nộp. Bảng đáp án ở phần 3 là
> bản đối chiếu để Giám đốc biết Claude trả đúng hay sai.

---

## 1. Bốn ô cốt lõi — BẢN ĐỀ XUẤT, CẦN GIÁM ĐỐC CHỐT

Đề bài yêu cầu mô tả **một công việc lặp đi lặp lại hằng tuần có thật** của chính người học.
Em chưa có dữ liệu thật về quy trình tuần ở Xí nghiệp Cây xanh – Công viên, nên em **không
tự điền thay**. Dưới đây là hai phương án phác từ vị trí công việc của Giám đốc. Xin Giám đốc
chọn một phương án, sửa lại số liệu và tên đầu mối cho đúng thực tế, rồi mới nộp.

### Phương án A — Tổng hợp nhật ký công tác tuần của các tổ cây xanh

| Ô | Nội dung đề xuất |
|---|---|
| ① VIỆC GÌ | Tổng hợp nhật ký công tác trong tuần của các tổ cây xanh thành một bảng khối lượng duy nhất để làm căn cứ nghiệm thu. |
| ② DỮ LIỆU VÀO | Ảnh chụp sổ ghi tay của tổ trưởng, tin nhắn Zalo báo việc cuối ngày, phiếu giao việc viết tay, ảnh hiện trường. |
| ③ KẾT QUẢ RA | Một bảng sạch gồm các cột: Ngày, Tổ/Đội, Tuyến hoặc Công viên, Loại công việc, Khối lượng, Đơn vị tính, Nhân công, Ghi chú. |
| ④ CHỖ HAY SAI | *(cần ít nhất một điều cấm cụ thể, kiểm tra được — xem gợi ý bên dưới)* |

Gợi ý nội dung ô ④ cho phương án A:
- Thiếu khối lượng hoặc thiếu đơn vị tính thì ghi rõ `THIẾU DỮ LIỆU`, tuyệt đối không tự ước lượng.
- Một tuyến đường xuất hiện hai lần trong cùng một ngày với cùng loại công việc thì phải ghi `NGHI TRÙNG`, không được tự cộng dồn.
- Khối lượng cắt tỉa vượt quá định mức tuyến đã duyệt thì ghi `VƯỢT ĐỊNH MỨC`, không được tự làm tròn xuống.

### Phương án B — Tổng hợp báo cáo vật tư và nhiên liệu tuần

| Ô | Nội dung đề xuất |
|---|---|
| ① VIỆC GÌ | Tổng hợp lượng vật tư và nhiên liệu các tổ đã lĩnh trong tuần thành một bảng đối chiếu với kế hoạch. |
| ② DỮ LIỆU VÀO | Phiếu lĩnh vật tư viết tay, tin nhắn Zalo báo đổ dầu máy cắt cỏ, sổ kho của thủ kho. |
| ③ KẾT QUẢ RA | Bảng sạch gồm các cột: Ngày, Tổ/Đội, Tên vật tư, Số lượng, Đơn vị tính, Đơn giá, Thành tiền, Ghi chú. |
| ④ CHỖ HAY SAI | *(cần ít nhất một điều cấm cụ thể, kiểm tra được — xem gợi ý bên dưới)* |

Gợi ý nội dung ô ④ cho phương án B:
- Thiếu đơn giá hoặc thiếu số lượng thì ghi `THIẾU DỮ LIỆU`, tuyệt đối không suy ra từ thành tiền.
- Thành tiền phải bằng Số lượng nhân Đơn giá; lệch thì ghi `SAI LỆCH` kèm số đúng, không tự sửa đè lên sổ.
- Một phiếu lĩnh gộp nhiều loại vật tư vào một dòng thì phải tách dòng, không được để nguyên.

**Tiêu chí ĐẠT của đề bài với ô ④:** phải có ít nhất một điều cấm **cụ thể, dễ kiểm tra**.
Viết chung chung kiểu "làm cẩn thận", "giữ chuyên nghiệp" là không đạt. Cả ba gợi ý ở mỗi
phương án trên đều thuộc loại kiểm tra được.

---

## 2. Câu lệnh dọn dẹp — dán nguyên văn vào Claude Chat

Mở một phiên trò chuyện mới trên Claude Chat web, dán toàn bộ nội dung
`so-ban-hang-mau.txt`, rồi gửi câu lệnh sau:

```
Dọn dẹp đống sổ sách lộn xộn này thành một bảng dữ liệu sạch sẽ, rõ ràng với các cột:
Ngày, Sản phẩm, Số lượng, Đơn giá, Doanh thu, Ghi chú. Hãy áp dụng luật gắt gao này:
Chỗ nào dữ liệu bị thiếu hoặc mâu thuẫn, hãy ghi rõ chữ THIẾU DỮ LIỆU hoặc SAI LỆCH ở
cột Ghi chú, tuyệt đối không được tự ý điền vào hoặc tự đoán mò số liệu.
```

Chụp màn hình bảng kết quả kèm danh sách lỗi để nộp.

---

## 3. Bảng đáp án đối chiếu — em đã tự kiểm tra từng dòng

Đây là kết quả em tự tính lại từ 18 dòng trong `so-ban-hang-mau.txt`. Giám đốc dùng bảng này
để đối chiếu xem Claude Chat có trả đúng không.

| Ngày | Sản phẩm | Số lượng | Đơn giá | Doanh thu | Ghi chú |
|---|---|---|---|---|---|
| 28/08 | Bánh mì heo quay | 3 ổ | 30.000đ | 90.000đ | Khớp |
| 28/08 | Xôi gà xé | 2 hộp | 35.000đ | 70.000đ | Khớp |
| 29/08 | Bánh mì pate chả | 5 ổ | 25.000đ | 125.000đ | Khớp |
| 29/08 | Xôi xá xíu | 1 hộp | 35.000đ | 35.000đ | Khớp |
| 30/08 | Bánh bao trứng muối | THIẾU DỮ LIỆU | 25.000đ | THIẾU DỮ LIỆU | **Lỗi 1** — sổ chỉ ghi đơn giá, không có số lượng nên không có căn cứ tính doanh thu |
| 30/08 | Bánh mì ốp la | 4 ổ | 20.000đ | 80.000đ | Khớp |
| 31/08 | Bánh mì gà nướng xé | 3 ổ | 30.000đ | 90.000đ | Khớp — giao chị Hoa |
| 31/08 | Xôi thịt kho trứng | 2 hộp | 40.000đ | 80.000đ | Khớp |
| 01/09 | Xôi xá xíu lạp xưởng | 3 hộp | THIẾU DỮ LIỆU | 96.000đ | **Lỗi 2** — sổ không ghi đơn giá. Không được tự suy ra 32.000đ từ phép chia, vì chưa rõ có giảm giá hay không |
| 01/09 | Bánh mì pate chả | 2 ổ | 25.000đ | 50.000đ | Khớp |
| 02/09 | Bánh bao chay | 10 cái | 15.000đ | 150.000đ | Khớp — đơn sỉ nhỏ |
| 02/09 | Xôi gà | 2 hộp | 35.000đ | 70.000đ | Khớp |
| 03/09 | Bánh mì xá xíu | 4 ổ | THIẾU DỮ LIỆU | THIẾU DỮ LIỆU | **Lỗi 3** — dòng gộp đơn, đã tách ra. Cả đơn thu chung 170.000đ, không tách được cho từng món |
| 03/09 | Cà phê đen đá | 2 ly | THIẾU DỮ LIỆU | THIẾU DỮ LIỆU | **Lỗi 3** — phần còn lại của dòng gộp ngày 03/09 |
| 03/09 | Xôi mặn đặc biệt | 2 hộp | 45.000đ | 90.000đ | Khớp |
| 04/09 | Bánh mì xíu mại | 4 ổ | 28.000đ | 122.000đ (sổ ghi) | **Lỗi 4 — SAI LỆCH.** 4 × 28.000 = 112.000đ, sổ ghi thừa 10.000đ |
| 04/09 | Cà phê sữa đá | 2 ly | 22.000đ | 44.000đ | Khớp |
| 05/09 | Bánh mì thịt nguội | 1 ổ | 30.000đ | 30.000đ | Khớp |
| 05/09 | Bánh bao kim sa | 3 cái | 20.000đ | 60.000đ | Khớp — khách sỉ nhỏ |

### Bốn lỗi gợn — đúng như đề bài cài sẵn

| # | Loại lỗi | Ngày | Mô tả |
|---|---|---|---|
| 1 | Thiếu số lượng | 30/08 | Bánh bao trứng muối chỉ ghi đơn giá 25.000đ, không có số lượng và không có tiền thu |
| 2 | Thiếu đơn giá | 01/09 | 3 xôi xá xíu lạp xưởng thu 96.000đ nhưng sổ không ghi đơn giá |
| 3 | Gộp đơn | 03/09 | Một dòng gộp 4 bánh mì xá xíu và 2 cà phê đen đá, chỉ có tổng thu 170.000đ |
| 4 | Sai số liệu | 04/09 | Bánh mì xíu mại 4 ổ × 28.000đ phải là 112.000đ, sổ ghi 122.000đ |

### Đối chiếu tổng tiền

- Tổng doanh thu theo đúng con số ghi trong sổ: **1.452.000đ**
- Sau khi sửa lỗi 4 về đúng phép tính (112.000đ thay cho 122.000đ): **1.442.000đ**
- Hai con số trên **chưa bao gồm** dòng 30/08 (lỗi 1), vì dòng đó không có căn cứ để tính.

Vì vậy chênh lệch do lỗi ghi chép của riêng tuần này là **10.000đ**, chưa kể phần doanh thu
chưa xác định được của ngày 30/08.

---

## 4. Câu lệnh huấn luyện quy trình — dán nguyên văn vào Claude Chat

Vẫn ở đúng phiên trò chuyện đó, gửi tiếp câu lệnh sau:

```
Hãy lưu lại toàn bộ định dạng bảng này và các quy tắc rà soát lỗi trên để đặt tên cho quy
trình là BÁO CÁO TUẦN. Lần sau, khi tôi nói 'Chạy Báo cáo Tuần' và gửi dữ liệu thô mới,
hãy tự động dọn dẹp đúng theo các cột này và tự động phát hiện bốn loại lỗi bất thường
như đã làm.
```

Chờ Claude xác nhận đã hiểu và lưu quy trình `BÁO CÁO TUẦN`, rồi chụp màn hình đoạn xác nhận
đó để nộp.

---

## 5. Checklist tiêu chí ĐẠT

| # | Tiêu chí | Trạng thái |
|---|---|---|
| 1 | Bản mô tả có đủ bốn ô cốt lõi, viết bằng ngôn ngữ đời thường | ⬜ Chờ Giám đốc chốt phương án ở phần 1 |
| 2 | Ô CHỖ HAY SAI có ít nhất một điều cấm cụ thể, dễ kiểm tra | ⬜ Chờ Giám đốc chốt |
| 3 | Claude dọn được bảng đủ 6 cột: Ngày, Sản phẩm, Số lượng, Đơn giá, Doanh thu, Ghi chú | ⬜ Chờ chạy trên Claude Chat và chụp màn hình |
| 4 | Claude phát hiện đúng bốn lỗi gợn (30/08, 01/09, 03/09, 04/09) | ⬜ Chờ chạy trên Claude Chat và chụp màn hình |
| 5 | Có ảnh chụp Claude xác nhận đã lưu quy trình BÁO CÁO TUẦN | ⬜ Chờ chạy trên Claude Chat và chụp màn hình |
| 6 | Toàn bộ làm trên Claude Chat web, không cài công cụ lập trình | ⬜ Chờ Giám đốc thực hiện |

---

## 6. Dặn dò của đề bài cho bài tập kế tiếp

Đề bài nhắc rõ: **lưu lại bốn ô cốt lõi thật kỹ**. Bài tập 2 sẽ dùng lại đúng bốn ô này để
đóng gói thành tệp quy tắc cố định, giúp Claude nhớ quy trình mà không phải nhắc lại ở mỗi
phiên mới. Sau khi Giám đốc chốt phương án ở phần 1, em sẽ cập nhật lại tệp này thành bản
v2 để dùng tiếp cho Bài tập 2.
