# Cài Codex CLI (OpenAI) trên Windows

Từng bước một. Mỗi bước chỉ làm một việc: đọc, sao chép lệnh, dán vào PowerShell, nhấn Enter.

- PowerShell 64-bit
- Không dùng bản x86
- Không cần quyền quản trị (Run as administrator)

> Codex CLI là công cụ của **OpenAI**, khác với Claude Code của Anthropic. Hai công cụ cài song song được, không ảnh hưởng nhau. Hướng dẫn cài Claude Code nằm ở `2026-09-21-huong-dan-cai-claude-cli-eroca-thanh.md`.

## Trước khi bắt đầu — ba điều kiện

1. **Máy**: Windows 10/11 64-bit (x64 hoặc ARM64), có Internet.
2. **Tài khoản**: một trong hai:
   - Tài khoản **ChatGPT có gói trả phí** (Plus, Pro, Business, Edu hoặc Enterprise) — cách đơn giản nhất.
   - Hoặc **khóa API OpenAI** (tính tiền theo lượng dùng).
3. **Thời gian**: khoảng 10 phút.

---

## Cách nhanh (tuỳ chọn) — dán một khối duy nhất

Mở **PowerShell 64-bit** (Bước 1), mở tệp `2026-09-23-script-cai-codex-cli-windows-v1.ps1`, sao chép **toàn bộ nội dung**, dán vào PowerShell và nhấn Enter.

Khối đó tự làm Bước 2 → 5: kiểm tra 64-bit → cài Node.js (nếu chưa có) → cài Codex CLI → kiểm tra phiên bản. Nó chỉ thêm, không xoá gì; máy đã có sẵn thì bỏ qua.

**Bước 6 (đăng nhập) vẫn làm bằng tay**, vì cần trình duyệt.

Nếu khối tự động dừng hoặc hiện dòng đỏ: làm tuần tự từ Bước 1 để biết hỏng ở đâu.

---

## Bước 1. Mở PowerShell đúng loại

Menu Start → gõ `po` → chọn **Windows PowerShell** hoặc **PowerShell 7**. Không chọn mục có chữ **(x86)**.

## Bước 2. Kiểm tra 64-bit

```powershell
[Environment]::Is64BitProcess
```

- **True**: sang Bước 3.
- **False**: đang mở nhầm bản x86. Làm theo Bước 2 mục A–C trong hướng dẫn cài Claude Code (cùng cách xử lý).

## Bước 3. Cài Node.js (bản LTS)

Codex CLI cài qua `npm`, nên cần Node.js. Kiểm tra máy đã có chưa:

```powershell
node --version
```

- Hiện số phiên bản (ví dụ `v22.x.x`): sang Bước 4.
- Báo lỗi "not recognized": cài Node bằng lệnh sau:

```powershell
winget install --id OpenJS.NodeJS.LTS -e
```

Cài xong **đóng PowerShell, mở cửa sổ mới**, chạy lại `node --version` để chắc chắn.

Nếu máy không có `winget`: tải bản **LTS** tại https://nodejs.org, bấm Next đến hết.

## Bước 4. Cài Codex CLI

```powershell
npm.cmd install -g @openai/codex
```

Dùng `npm.cmd` (có đuôi `.cmd`) để không bị PowerShell chặn script. Chờ đến khi hiện dòng dạng `added 2 packages`.

## Bước 5. Kiểm tra cài đặt

```powershell
codex --version
```

- Hiện `codex-cli 0.xxx.x`: xong phần cài.
- Báo lỗi **"running scripts is disabled on this system"**: PowerShell đang chặn script. Chọn một trong hai:
  - Luôn gõ `codex.cmd` thay cho `codex`, hoặc
  - Cho phép một lần cho riêng tài khoản của mình:
    ```powershell
    Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
    ```
    Gõ `Y` khi được hỏi.
- Báo lỗi **"not recognized"**: đóng PowerShell, mở cửa sổ mới rồi thử lại.

## Bước 6. Đăng nhập (làm bằng tay)

**Cách A — tài khoản ChatGPT (khuyên dùng):**

```powershell
codex login
```

Trình duyệt mở ra → đăng nhập ChatGPT → bấm cho phép. Quay lại PowerShell, kiểm tra:

```powershell
codex login status
```

Nếu trình duyệt không tự mở (máy từ xa, máy chủ): dùng `codex login --device-auth` và nhập mã hiện trên màn hình.

**Cách B — khóa API:**

```powershell
$env:OPENAI_API_KEY | codex login --with-api-key
```

(đặt biến `OPENAI_API_KEY` trước). **Không bao giờ** dán khóa API vào tệp trong kho mã.

## Bước 7. Dùng Codex trong kho này

```powershell
cd <đường-dẫn>\impossible-builds-skill
codex
```

Codex tự đọc `AGENTS.md` ở gốc kho, từ đó đọc tiếp `CLAUDE.md` và `SKILL.md` — không cần cấu hình thêm.

### An toàn khi dùng Codex

Hook chặn lệnh nguy hiểm `.claude/hooks/chan-lenh-nguy-hiem.py` **chỉ chạy với Claude Code, không chạy với Codex**. Vì vậy:

- Để Codex ở chế độ mặc định (hỏi trước khi chạy lệnh, chỉ ghi trong thư mục kho). Có thể chỉ định rõ:
  ```powershell
  codex --sandbox workspace-write --ask-for-approval on-request
  ```
- Muốn Codex chỉ đọc, không sửa gì: `codex --sandbox read-only`.
- **Không dùng** `--dangerously-bypass-approvals-and-sandbox` trên máy thật.
- Đọc kỹ từng lệnh Codex xin chạy, nhất là lệnh xóa, đổi tên, `git push`.

## Lệnh hay dùng

| Việc | Lệnh |
|---|---|
| Mở phiên làm việc | `codex` |
| Giao một việc, chạy không tương tác | `codex exec "tóm tắt README.md"` |
| Tiếp tục phiên gần nhất | `codex resume --last` |
| Chẩn đoán lỗi cài đặt, đăng nhập, mạng | `codex doctor` |
| Cập nhật lên bản mới | `npm.cmd install -g @openai/codex@latest` |
| Đăng xuất | `codex logout` |

---

## Ghi chú kiểm chứng

- Lệnh cài `npm install -g @openai/codex` đã chạy thử thành công trong môi trường Linux ngày 2026-09-23, bản `codex-cli 0.156.1`. Gói npm có sẵn bản dựng cho `win32-x64` và `win32-arm64`.
- Các cờ `login`, `--device-auth`, `--with-api-key`, `--sandbox`, `--ask-for-approval`, `exec`, `resume`, `doctor` đối chiếu từ `codex --help` của bản 0.156.1.
- **Chưa chạy thử trên máy Windows thật.** Danh sách gói ChatGPT được hỗ trợ có thể thay đổi — xem trang chính thức https://github.com/openai/codex khi cần.
