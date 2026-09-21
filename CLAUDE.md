# QUY TẮC LÀM VIỆC

## Phạm vi tệp này

Tệp này chỉ chứa **quy tắc làm việc dùng chung** cho kho mã. Kho ở chế độ công khai nên thông tin cá nhân của chủ sở hữu — họ tên, chức vụ, đơn vị công tác, cách xưng hô, định hướng riêng — **không đặt ở đây**.

Thông tin cá nhân đặt trong bộ nhớ cá nhân trên máy, nằm ngoài kho mã:

- Windows: `C:\Users\<tên-người-dùng>\.claude\CLAUDE.md`
- macOS / Linux: `~/.claude/CLAUDE.md`

Claude Code đọc cả hai tệp và ghép lại, nên cách xưng hô cùng bối cảnh riêng vẫn có hiệu lực đầy đủ trên máy, trong khi người ngoài chỉ thấy phần quy trình.

Kênh phục vụ: Impossible Builds TV, khán giả Mỹ.

## Quy tắc làm việc

1. Đọc CLAUDE.md và SKILL.md trước mọi nhiệm vụ.
2. Kiểm tra thực tế cây thư mục và các tệp liên quan trước khi trả lời.
3. Không suy đoán khi thiếu dữ liệu; phải nêu rõ điều chưa chắc chắn.
4. Không tự ý xóa, ghi đè hoặc đổi tên tệp quan trọng.
5. Khi bắt đầu, báo đã đọc và kiểm tra những tệp nào.
6. Khi kết thúc, báo tệp đã tạo, tệp đã sửa, kết quả QC và việc cần xác nhận.
7. Trả lời theo cấu trúc:
   - Về người yêu cầu
   - Về dự án
   - Dữ liệu đã có
   - Chưa rõ hoặc còn thiếu
   - Đã thực hiện
   - Đề xuất bước tiếp theo
8. Prompt sản xuất video viết bằng tiếng Anh Mỹ; phần giải thích viết bằng tiếng Việt.
9. Quy trình chuyên môn của Impossible Builds Video Director phải tuân theo SKILL.md.
10. Trước khi tạo Pull Request hoặc thực hiện hành động bên ngoài, phải xin xác nhận.
11. Khi Giám đốc nói "Chạy Báo cáo Tuần" và gửi dữ liệu thô, chạy skill `bao-cao-tuan`: dọn thành bảng 6 cột (Ngày, Sản phẩm, Số lượng, Đơn giá, Doanh thu, Ghi chú) và rà đủ năm loại lỗi theo `bao-cao-tuan/references/luat-ra-soat-loi.md`. Không tự điền, không suy đoán số liệu.

## Quy tắc đặt tên tệp

- Dùng chữ thường, không dấu, phân cách bằng dấu gạch ngang.
- Cấu trúc ưu tiên: yyyy-mm-dd-loai-chu-de.md
- Phiên bản dùng v1, v2, v3.
- Không dùng final, new hoặc latest.
- Phạm vi áp dụng: cấu trúc yyyy-mm-dd-loai-chu-de.md chỉ dành cho tài liệu làm việc phát sinh (kịch bản, ngân hàng tiêu đề, báo cáo). Không áp dụng cho các tệp cấu trúc cố định của Skill như CLAUDE.md, SKILL.md, README.md và các tệp trong references, assets, examples, vì chúng cần tên ổn định để duy trì liên kết.
