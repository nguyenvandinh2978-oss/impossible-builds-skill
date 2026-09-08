# Prompt Skeleton — Khung một prompt 8 giây

Điền khung này thành **một đoạn văn liên tục tiếng Anh**. Các nhãn trong ngoặc vuông là chỗ điền, không giữ lại nhãn trong đầu ra. Thứ tự thành phần giữ nguyên để người dựng dễ đọc.

```
[N]. [STORY PURPOSE: một câu nói cảnh này đẩy câu chuyện đi đâu]. Inherited state: [trạng thái kế thừa, khớp nguyên văn với end state của cảnh N-1]. Camera A: fixed drone at [80–120] m, [55–70]° downward, [24–35] mm equivalent, deep focus, locked exposure and horizon, no movement of any kind. High-speed time-lapse. 0–1 s: [kế thừa và bắt đầu]. 1–3 s: [kết quả đầu tiên]. 3–6 s: [biến đổi lớn hơn]. 6–8 s: [hoàn thành và chuyển giao]. Represents about [X] hours/days of work compressed roughly [1,000–1,600]× through continuous time-lapse. Lighting and weather: [thời điểm trong ngày, mây, gió, chuyển tiếp hợp lý từ cảnh trước]. Diegetic sound only: [tiếng máy, nước, kim loại, gió] with no music, no voice. Continuity anchors: [máy móc tên + màu, số cấu kiện, mốc địa hình cố định]. End state: [trạng thái kết thúc, sẽ là inherited state của cảnh N+1]. Continuity lock: same site geometry, same crew, same machines, cumulative progress only. Safety lock: [công nhân ở đâu, đứng trên bề mặt gì, có lan can gì; hoặc "no workers in frame, machine-driven operation only"]. Natural physics for every person, machine, material, and environmental element. [NEGATIVE PROMPT ĐẦY ĐỦ từ negative-prompt-master.md]
```

## Ghi chú khi điền

- **Story purpose** viết như một đạo diễn nói với người dựng: "Reveal that the visible pier is only the top of a rock socket" hay hơn "Show the pier".
- **Inherited state** và **End state** là cặp khóa quan trọng nhất. Copy nguyên câu end state của cảnh trước vào inherited state của cảnh sau, rồi mới viết tiếp.
- **Nhịp 0–1/1–3/3–6/6–8** mỗi mốc phải có một chuyển biến khác nhau. Nếu hai mốc mô tả cùng một việc, cảnh này chưa đủ tiến độ.
- **Hệ số nén** ghi bằng chữ "compressed roughly 1,300×", không ghi fps.
- **Camera B/C** thay dòng Camera A bằng mô tả đã khai báo trong Continuity Bible, và thêm "match-cut back to Camera A framing at the end of the shot" nếu là cảnh chuyển.
- **Safety lock** khi có đổ bê tông: nói rõ công nhân đứng trên bệ khô có lan can, điều khiển bơm hoặc tremie từ mép ổn định.
- Cảnh hook (cảnh 1) thêm nhịp 0–1 / 1–2 / 2–3 giây theo Hook Lock trước khi vào nhịp 8 giây bình thường.
