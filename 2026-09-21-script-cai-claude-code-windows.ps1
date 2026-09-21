# ============================================================
# Claude Code - cai dat tu dong tren Windows
# Dung cho: Eroca Thanh
# Cach dung: mo PowerShell 64-bit, dan TOAN BO tep nay vao roi nhan Enter.
# Khong can quyen Administrator.
# Script chi lam 4 viec: kiem tra 64-bit, chay bo cai chinh thuc,
# them duong dan vao PATH, kiem tra ket qua. Khong xoa gi.
# ============================================================

& {
    $ErrorActionPreference = 'Stop'

    # --- 1. Kiem tra PowerShell 64-bit ---
    if (-not [Environment]::Is64BitProcess) {
        if ([Environment]::Is64BitOperatingSystem) {
            Write-Host "DUNG LAI: cua so PowerShell nay dang chay 32-bit (x86)." -ForegroundColor Red
            Write-Host "Nhan Windows + R, dan duong dan duoi day, nhan Enter, roi chay lai script:" -ForegroundColor Yellow
            Write-Host '%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe' -ForegroundColor Cyan
        } else {
            Write-Host "DUNG LAI: Windows dang la ban 32-bit. Claude Code can Windows 64-bit (x64 hoac ARM64)." -ForegroundColor Red
        }
        return
    }
    Write-Host "[1/4] PowerShell 64-bit: OK" -ForegroundColor Green

    $claudeBin = "$env:USERPROFILE\.local\bin"
    $claudeExe = Join-Path $claudeBin 'claude.exe'

    # --- 2. Chay bo cai chinh thuc ---
    if (Test-Path $claudeExe) {
        Write-Host "[2/4] Da co claude.exe san, bo qua buoc cai dat." -ForegroundColor Green
    } else {
        Write-Host "[2/4] Dang tai va chay bo cai chinh thuc (co the mat vai phut)..." -ForegroundColor Cyan
        try {
            Invoke-Expression (Invoke-RestMethod 'https://claude.ai/install.ps1')
        } catch {
            Write-Host "Bo cai chinh thuc khong chay duoc: $($_.Exception.Message)" -ForegroundColor Red
            Write-Host "Hay thu cach thay the roi chay lai script nay:" -ForegroundColor Yellow
            Write-Host "    winget install Anthropic.ClaudeCode" -ForegroundColor Cyan
            return
        }
    }

    # --- 3. Them Claude vao PATH (chi them khi chua co) ---
    if (Test-Path $claudeExe) {
        $userPath = [Environment]::GetEnvironmentVariable('PATH', 'User')
        if (($userPath -split ';') -notcontains $claudeBin) {
            [Environment]::SetEnvironmentVariable('PATH', "$userPath;$claudeBin", 'User')
            Write-Host "[3/4] Da them $claudeBin vao PATH cua nguoi dung." -ForegroundColor Green
        } else {
            Write-Host "[3/4] PATH da co san duong dan Claude." -ForegroundColor Green
        }
        if (($env:PATH -split ';') -notcontains $claudeBin) {
            $env:PATH += ";$claudeBin"
        }
    } else {
        Write-Host "[3/4] Khong tim thay claude.exe tai $claudeExe." -ForegroundColor Yellow
        Write-Host "     Neu vua cai bang WinGet thi duong dan nam cho khac - van chay tiep buoc kiem tra." -ForegroundColor Yellow
    }

    # --- 4. Kiem tra ket qua ---
    $cmd = Get-Command claude -ErrorAction SilentlyContinue
    if (-not $cmd) {
        Write-Host "[4/4] Chua goi duoc lenh 'claude'." -ForegroundColor Red
        Write-Host "     Hay dong PowerShell, mo lai mot cua so PowerShell 64-bit moi va chay lai script nay." -ForegroundColor Yellow
        return
    }

    Write-Host "[4/4] Kiem tra cai dat:" -ForegroundColor Cyan
    claude --version
    claude doctor

    Write-Host ""
    Write-Host "HOAN TAT PHAN CAI DAT." -ForegroundColor Green
    Write-Host "Buoc tiep theo lam bang tay (xem Buoc 6 trong file huong dan):" -ForegroundColor Cyan
    Write-Host "  1. Mo trinh duyet, dang nhap claude.ai bang tai khoan co goi Pro/Max/Team/Enterprise." -ForegroundColor White
    Write-Host "  2. Quay lai PowerShell, di toi thu muc du an, go: claude" -ForegroundColor White
    Write-Host "  3. Chon giao dien, roi chon muc 1. Claude account with subscription." -ForegroundColor White
}
