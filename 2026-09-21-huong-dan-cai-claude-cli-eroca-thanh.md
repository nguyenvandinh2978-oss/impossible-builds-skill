# Cài Claude Code (claude-cli) trên Windows — hướng dẫn dành cho Eroca Thanh

Từng bước một. Không cần nhớ lệnh. Mỗi bước chỉ làm một việc: đọc, bấm sao chép, dán vào PowerShell, nhấn Enter.

- PowerShell 64-bit
- Không dùng bản x86
- Không cần quyền quản trị (Run as administrator)

## Trước khi bắt đầu — ba điều kiện

1. **Máy**: Windows 10 phiên bản 1809 trở lên (hoặc Windows Server 2019+), RAM từ 4 GB, bộ xử lý x64 hoặc ARM64, có kết nối Internet.
2. **Tài khoản**: Claude Code cần gói **Pro, Max, Team hoặc Enterprise**. Gói miễn phí của claude.ai không dùng được Claude Code. Nếu chưa có gói, đăng ký xong rồi mới quay lại bài này.
3. **Thời gian**: khoảng 10–15 phút, phần lớn là chờ bộ cài chạy.

---

## Bước 1. Mở PowerShell đúng loại

Mở menu Start, gõ `po`, chọn **Windows PowerShell** hoặc **PowerShell 7** trong mục "Best match".

- Không chọn mục có chữ **(x86)**.
- Không cần chọn "Run as administrator".

Nếu tiêu đề cửa sổ có chữ **Select**: nhấn `Esc` để thoát chế độ chọn văn bản rồi mới nhập lệnh.

---

## Bước 2. Kiểm tra PowerShell đang chạy 64-bit

Dán lệnh sau vào PowerShell rồi nhấn Enter.

```powershell
[Environment]::Is64BitProcess
```

- Hiện **True**: đúng cửa sổ cần dùng, sang Bước 3.
- Hiện **False**: **không chạy Bước 3**. Cửa sổ hiện tại là 32-bit. Làm lần lượt A → B → C.

**A. Kiểm tra Windows có phải bản 64-bit:**

```powershell
[Environment]::Is64BitOperatingSystem
```

- **True**: Windows đủ điều kiện, chỉ là mở nhầm PowerShell x86. Làm tiếp mục B.
- **False**: Windows đang là bản 32-bit. Dừng cài đặt — máy cần Windows 64-bit trên bộ xử lý x64 hoặc ARM64.

**B. Mở trực tiếp PowerShell 64-bit:** đóng cửa sổ hiện tại, nhấn `Windows + R`, dán đường dẫn sau vào hộp Run rồi nhấn `Enter`.

```
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe
```

Không chọn đường dẫn có `SysWOW64`, không mở mục có chữ (x86), không cần "Run as administrator".

**C. Kiểm tra lại:** trong cửa sổ mới, chạy lại `[Environment]::Is64BitProcess`. Chỉ khi kết quả là **True** mới sang Bước 3.

---

## Bước 3. Chạy bộ cài chính thức

Sau khi Bước 2 trả về True, dán lệnh sau rồi nhấn Enter.

```powershell
irm https://claude.ai/install.ps1 | iex
```

Chờ tới khi bộ cài hiện dòng **Claude Code successfully installed!**

Chưa chạy `claude --version` trong cửa sổ này. Sang Bước 4 để chuẩn bị PATH trước.

**Cách thay thế** nếu mạng hoặc tường lửa chặn bộ cài trên:

```powershell
winget install Anthropic.ClaudeCode
```

Lưu ý: bản cài bằng WinGet không tự cập nhật; thỉnh thoảng chạy `winget upgrade Anthropic.ClaudeCode`. Bản cài bằng `install.ps1` tự cập nhật nền.

---

## Bước 4. Chuẩn bị PATH an toàn

Không cần hiểu từng dòng. Sao chép **toàn bộ** khối dưới đây, dán vào PowerShell, nhấn Enter. Khối lệnh chỉ thêm thư mục Claude khi chưa có, đồng thời cập nhật luôn cửa sổ PowerShell hiện tại.

```powershell
$claudeBin = "$env:USERPROFILE\.local\bin"
$claudeExe = "$claudeBin\claude.exe"
if (Test-Path $claudeExe) {
    $userPath = [Environment]::GetEnvironmentVariable('PATH', 'User')
    if (($userPath -split ';') -notcontains $claudeBin) {
        [Environment]::SetEnvironmentVariable('PATH', "$userPath;$claudeBin", 'User')
    }
    if (($env:PATH -split ';') -notcontains $claudeBin) {
        $env:PATH += ";$claudeBin"
    }
    Write-Host "Claude Code da san sang." -ForegroundColor Green
} else {
    Write-Host "Chua tim thay claude.exe - hay chay lai Buoc 3." -ForegroundColor Yellow
}
```

- Thấy dòng **xanh** "Claude Code da san sang.": sang Bước 5.
- Thấy dòng **vàng**: quay lại Bước 3, bộ cài chưa tạo được `claude.exe`.

*(Nếu cài bằng WinGet ở Bước 3, WinGet tự đặt đường dẫn riêng; khối lệnh trên có thể báo dòng vàng. Khi đó mở lại một cửa sổ PowerShell mới và thử thẳng Bước 5.)*

---

## Bước 5. Xác minh cài đặt

Chỉ chạy hai lệnh này sau khi Bước 4 báo dòng xanh.

```powershell
claude --version
claude doctor
```

**Đạt khi**: dòng đầu hiện số phiên bản, ví dụ `2.1.211 (Claude Code)`; `claude doctor` không báo lỗi cài đặt nghiêm trọng.

---

## Bước 6. Khởi động và đăng nhập lần đầu

**1. Khởi động Claude Code:** đi tới thư mục dự án rồi chạy:

```powershell
claude
```

**2. Chọn giao diện:** lần đầu chạy, Claude Code có thể hỏi chọn Dark mode, Light mode hoặc kiểu màu khác. Đây chỉ là màu giao diện. Dùng phím `↑` / `↓` chọn kiểu dễ nhìn — khuyến nghị **Dark mode** — rồi nhấn `Enter`. Đổi lại sau trong `/config`.

**3. Dừng lại ở màn hình "Select login method":** chưa nhấn `Enter` vội.

**4. Đăng nhập web trước:** mở trình duyệt (khuyến nghị Google Chrome; Microsoft Edge cũng dùng được, không dùng Internet Explorer cũ), vào https://claude.ai, đăng nhập đúng tài khoản có gói Pro, Max, Team hoặc Enterprise. Kiểm tra góc trái dưới đã hiện **tên tài khoản · tên gói**. Giữ nguyên trình duyệt này rồi quay lại PowerShell.

**5. Chọn đúng phương thức đăng nhập:** quay lại màn hình "Select login method", giữ hoặc dùng `↑` / `↓` chọn mục **1. Claude account with subscription**, rồi nhấn `Enter`.

- Không chọn mục 2 nếu muốn dùng hạn mức của gói thuê bao — mục 2 tính phí theo API qua Claude Console.
- Mục 3 chỉ dành cho tổ chức đã được hướng dẫn dùng nền tảng đám mây riêng (Bedrock, Vertex, Foundry).

**6. Hoàn tất xác thực trong trình duyệt:** Claude Code mở trang xác thực; làm theo hướng dẫn và cho phép kết nối với Claude Code.

- Nếu trình duyệt không tự mở: nhấn `c` trong PowerShell để sao chép đường dẫn đăng nhập, dán vào Chrome.
- Nếu trình duyệt hiện một mã thay vì tự quay lại: sao chép mã đó, dán vào dòng `Paste code here if prompted` trong PowerShell.

PowerShell hiện `Login successful` là đã xong.

**7. Đọc ghi chú an toàn:** Claude Code nhắc rằng Claude có thể mắc lỗi và chỉ nên dùng với mã nguồn mình tin cậy. Đọc xong, nhấn `Enter` tại dòng `Press Enter to continue…` để vào Claude Code.

---

## Xử lý lỗi thường gặp: `claude is not recognized`

Đây **không phải** lỗi cài đặt. Bộ cài đã báo `successfully installed` và tệp nằm ở `%USERPROFILE%\.local\bin\claude.exe`; dòng đỏ xuất hiện vì PowerShell chưa tìm thấy thư mục đó trong PATH.

**1. Kiểm tra tệp Claude có tồn tại:**

```powershell
Test-Path "$env:USERPROFILE\.local\bin\claude.exe"
```

- **True**: chạy khối lệnh ở mục 2, không cần cài lại.
- **False**: tệp chưa có, quay lại Bước 3 chạy lại bộ cài chính thức.

**2. Thêm Claude vào User PATH và kiểm tra ngay:**

```powershell
$claudeBin = "$env:USERPROFILE\.local\bin"
$userPath = [Environment]::GetEnvironmentVariable('PATH', 'User')
if (($userPath -split ';') -notcontains $claudeBin) {
    [Environment]::SetEnvironmentVariable('PATH', "$userPath;$claudeBin", 'User')
}
if (($env:PATH -split ';') -notcontains $claudeBin) {
    $env:PATH += ";$claudeBin"
}
claude --version
claude doctor
```

Kết quả đúng: `claude --version` hiện số phiên bản. Sau đó đóng PowerShell, mở lại một cửa sổ PowerShell 64-bit bình thường và tiếp tục dùng `claude`.

---

## Vài lỗi khác hay gặp

| Hiện tượng | Nguyên nhân | Cách xử lý |
|---|---|---|
| `The token '&&' is not a valid statement separator` | Đang dán lệnh của CMD vào PowerShell | Dùng đúng lệnh `irm ... \| iex` cho PowerShell |
| `'irm' is not recognized...` | Đang ở CMD chứ không phải PowerShell | Dấu nhắc PowerShell bắt đầu bằng `PS C:\`; mở lại PowerShell |
| Đăng nhập báo tài khoản không có quyền | Đang dùng gói miễn phí | Nâng cấp lên Pro/Max/Team/Enterprise rồi đăng nhập lại |
| Cài xong nhưng thiếu công cụ Bash | Windows chưa có Git for Windows | Cài Git for Windows (tùy chọn); không có thì Claude Code dùng PowerShell thay thế |

---

## Phụ lục — nếu Eroca Thanh dùng macOS, Linux hoặc WSL

Bài này viết cho Windows. Nếu máy là macOS (13.0 trở lên), Linux (Ubuntu 20.04+, Debian 10+) hoặc WSL, thay Bước 1–4 bằng một lệnh trong Terminal:

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

Trên macOS có thể dùng Homebrew: `brew install --cask claude-code` (bản này không tự cập nhật, nâng cấp bằng `brew upgrade claude-code`).

Sau đó làm tiếp Bước 5 và Bước 6 y như trên.

---

## Nguồn đối chiếu

- Claude Code Setup: https://code.claude.com/docs/en/setup
- Troubleshoot installation: https://code.claude.com/docs/en/troubleshoot-install

*Tài liệu kiểm tra ngày 21/09/2026.*
