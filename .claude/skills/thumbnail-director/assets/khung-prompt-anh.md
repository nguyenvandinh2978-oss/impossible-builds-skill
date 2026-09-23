# Khung prompt ảnh thumbnail

Điền theo thứ tự thành **một đoạn văn tiếng Anh liên tục**. Không gạch đầu dòng trong prompt thật. Thứ tự này đưa thông tin quan trọng nhất lên đầu vì phần lớn công cụ tạo ảnh ưu tiên phần đầu prompt.

```
[1. Format]      Cinematic YouTube thumbnail, 16:9, movie key-art composition,
[2. Hero]        <chủ thể chính: ai/cái gì, tuổi, vẻ ngoài, trang phục, biểu cảm, hướng mắt> placed in the <left/right> third, sharp focus,
[3. Counterpart] <chủ thể phụ: quy mô, chất liệu, biểu cảm hoặc trạng thái> filling the <upper/right> frame, cropped by the frame edge to feel enormous,
[4. Tension]     <chi tiết tạo khoảng trống tò mò: nước mắt, vết nứt, vật lạc chỗ, khoảnh khắc sắp xảy ra>,
[5. Setting]     <bối cảnh tối giản + khí quyển: snowfall, spray, dust, fog>,
[6. Light]       <key light hướng nào, rim light, bóng đổ>, 
[7. Color]       <hai tông nền> palette with <màu nhấn> accents only on <điểm tò mò>,
[8. Texture]     hyper-detailed photoreal textures, <da, vảy, bê tông, kim loại>, shallow depth of field,
[9. Text space]  clean negative space in the <lower right/left> for a title overlay, keep the bottom-right corner free of key details,
[10. Negatives]  no text, no letters, no watermark, no logo, no real person likeness, no celebrity, no extra limbs, no deformed hands, no duplicated subjects, no gore.
```

## Biến thể theo công cụ

| Công cụ | Điều chỉnh |
|---|---|
| Midjourney | Thêm `--ar 16:9 --style raw` ở cuối; chuyển mục 10 thành `--no text, logo, watermark, gore`. |
| Google Flow / Imagen | Giữ nguyên câu văn; chọn tỷ lệ 16:9 trong giao diện. |
| Ideogram | Nếu muốn vẽ chữ trong ảnh, bỏ "no text" và thêm: `bold cinematic title text "<CHỮ>" in <font style> in the lower right`. |
| DALL·E / GPT Image | Giữ câu văn; nói rõ "wide 16:9 landscape image". |
| Leonardo / Flux | Thêm negative prompt vào ô riêng. |

## Chữ overlay (điền riêng, không nằm trong prompt ảnh)

```
Text: "<1–4 WORDS>"
Font style: <cinematic serif / heavy sans>
Material/effect: <cracked stone, rusted steel, ice, clean white with dark stroke>
Color: <màu chính> with <màu nhấn>
Position: <vị trí>, height ≈ 1/6–1/4 of frame
```
