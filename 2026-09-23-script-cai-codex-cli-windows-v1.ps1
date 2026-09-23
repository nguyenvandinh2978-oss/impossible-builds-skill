# ============================================================
# Codex CLI (OpenAI) - cai dat tu dong tren Windows
# Cach dung: mo PowerShell 64-bit, dan TOAN BO tep nay vao roi nhan Enter.
# Khong can quyen Administrator.
# Script chi lam 4 viec: kiem tra 64-bit, cai Node.js LTS (neu chua co),
# cai Codex CLI qua npm, kiem tra ket qua. Khong xoa gi.
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
            Write-Host "DUNG LAI: Windows dang la ban 32-bit. Codex CLI can Windows 64-bit (x64 hoac ARM64)." -ForegroundColor Red
        }
        return
    }
    Write-Host "[1/4] PowerShell 64-bit: OK" -ForegroundColor Green

    # --- 2. Cai Node.js LTS (chi khi chua co) ---
    if (Get-Command node -ErrorAction SilentlyContinue) {
        Write-Host "[2/4] Da co Node.js $(node --version), bo qua buoc cai Node." -ForegroundColor Green
    } else {
        if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
            Write-Host "[2/4] May chua co Node.js va cung khong co winget." -ForegroundColor Red
            Write-Host "     Tai ban LTS tai https://nodejs.org, cai xong thi mo PowerShell moi va chay lai script." -ForegroundColor Yellow
            return
        }
        Write-Host "[2/4] Dang cai Node.js LTS bang winget (co the mat vai phut)..." -ForegroundColor Cyan
        winget install --id OpenJS.NodeJS.LTS -e --accept-source-agreements --accept-package-agreements
        # Nap lai PATH de cua so hien tai thay duoc node va npm vua cai
        $env:PATH = [Environment]::GetEnvironmentVariable('PATH', 'Machine') + ';' +
                    [Environment]::GetEnvironmentVariable('PATH', 'User')
        if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
            Write-Host "     Da cai Node nhung cua so nay chua nhan." -ForegroundColor Yellow
            Write-Host "     Hay dong PowerShell, mo cua so PowerShell 64-bit moi va chay lai script nay." -ForegroundColor Yellow
            return
        }
        Write-Host "     Node.js $(node --version): OK" -ForegroundColor Green
    }

    # --- 3. Cai Codex CLI ---
    # Goi npm.cmd thay vi npm de khong bi Execution Policy chan tep npm.ps1
    if (Get-Command codex.cmd -ErrorAction SilentlyContinue) {
        Write-Host "[3/4] Da co Codex CLI san, bo qua buoc cai. (Muon cap nhat: npm.cmd install -g @openai/codex@latest)" -ForegroundColor Green
    } else {
        Write-Host "[3/4] Dang cai Codex CLI qua npm..." -ForegroundColor Cyan
        npm.cmd install -g @openai/codex
        if ($LASTEXITCODE -ne 0) {
            Write-Host "     npm bao loi khi cai Codex. Chup man hinh dong do va gui lai." -ForegroundColor Red
            return
        }
        $npmBin = "$env:APPDATA\npm"
        if (($env:PATH -split ';') -notcontains $npmBin) { $env:PATH += ";$npmBin" }
    }

    # --- 4. Kiem tra ket qua ---
    if (-not (Get-Command codex.cmd -ErrorAction SilentlyContinue)) {
        Write-Host "[4/4] Chua goi duoc lenh 'codex'." -ForegroundColor Red
        Write-Host "     Hay dong PowerShell, mo cua so PowerShell 64-bit moi va chay lai script nay." -ForegroundColor Yellow
        return
    }

    Write-Host "[4/4] Kiem tra cai dat:" -ForegroundColor Cyan
    codex.cmd --version

    if ((Get-ExecutionPolicy) -in @('Restricted', 'AllSigned')) {
        Write-Host ""
        Write-Host "LUU Y: PowerShell dang chan chay script, nen go 'codex' co the bao loi do." -ForegroundColor Yellow
        Write-Host "     Cach 1: luon go 'codex.cmd' thay cho 'codex'." -ForegroundColor White
        Write-Host "     Cach 2: cho phep 1 lan cho rieng tai khoan nay:" -ForegroundColor White
        Write-Host "         Set-ExecutionPolicy -Scope CurrentUser RemoteSigned" -ForegroundColor Cyan
    }

    Write-Host ""
    Write-Host "HOAN TAT PHAN CAI DAT." -ForegroundColor Green
    Write-Host "Buoc tiep theo lam bang tay (xem Buoc 6 trong file huong dan):" -ForegroundColor Cyan
    Write-Host "  1. Go: codex login   -> trinh duyet mo ra, dang nhap tai khoan ChatGPT." -ForegroundColor White
    Write-Host "  2. Kiem tra: codex login status" -ForegroundColor White
    Write-Host "  3. Di toi thu muc du an, go: codex" -ForegroundColor White
}
