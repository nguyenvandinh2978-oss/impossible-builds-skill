#!/usr/bin/env python3
"""Hook PreToolUse: chặn cứng lệnh nguy hiểm và hỏi lại trước khi đụng tệp quan trọng.

Claude Code gửi JSON mô tả lệnh sắp chạy qua stdin. Hook trả về JSON:
- "deny": chặn hẳn, Claude nhận lý do và phải tìm cách khác.
- "ask":  dừng lại để người dùng bấm duyệt.
Không in gì và thoát 0 nghĩa là cho qua.

Hiện thực hóa quy tắc 4 của CLAUDE.md: không tự ý xóa, ghi đè hoặc đổi tên tệp quan trọng.
"""
import json
import os
import re
import shlex
import sys

# Tệp cấu trúc cố định: đổi tên hoặc ghi đè sẽ gãy liên kết của Skill.
TEN_TEP_QUAN_TRONG = {"CLAUDE.md", "AGENTS.md", "SKILL.md", "README.md"}
THU_MUC_QUAN_TRONG = ("references", "assets", "examples", ".claude/hooks", ".claude/rules")
TEP_CAU_HINH = (".claude/settings.json",)

# Đầu một lệnh: đầu chuỗi hoặc sau ; & | ( và tùy chọn sudo.
DAU = r"(?:^|[;&|(]\s*|\n\s*)(?:sudo\s+)?"

# Lệnh chặn cứng: (mẫu regex, lý do).
LENH_CAM = [
    (DAU + r"rm\s+(?:\S+\s+)*?(?:-[a-zA-Z]*[rR][a-zA-Z]*f|-[a-zA-Z]*f[a-zA-Z]*[rR]|--recursive\s+--force|--force\s+--recursive)\b",
     "rm -rf xóa hàng loạt không thể hoàn tác"),
    (DAU + r"rm\s+(?:\S+\s+)*?-[rR]\s+(?:\S+\s+)*?-f\b|" + DAU + r"rm\s+(?:\S+\s+)*?-f\s+(?:\S+\s+)*?-[rR]\b",
     "rm -r -f xóa hàng loạt không thể hoàn tác"),
    (DAU + r"git\s+push\b[^;&|\n]*(?:\s--force(?!-with-lease)\b|\s-f\b|\s\+\S)",
     "git push --force ghi đè lịch sử trên GitHub (chỉ cho phép --force-with-lease khi đã xác nhận)"),
    (DAU + r"git\s+push\b[^;&|\n]*\s(?:\S+:)?(?:main|master)\b",
     "không push thẳng lên main/master; làm trên nhánh riêng và mở Pull Request sau khi xác nhận"),
    (DAU + r"git\s+reset\b[^;&|\n]*--hard\b", "git reset --hard làm mất thay đổi chưa commit"),
    (DAU + r"git\s+clean\b[^;&|\n]*\s-[a-zA-Z]*f", "git clean -f xóa tệp chưa theo dõi"),
    (DAU + r"git\s+branch\b[^;&|\n]*\s-D\b", "git branch -D xóa nhánh chưa merge"),
    (DAU + r"git\s+(?:checkout|restore)\s+(?:--\s+)?\.(?:\s|$)", "bỏ toàn bộ thay đổi trong thư mục làm việc"),
    (DAU + r"find\b[^;&|\n]*\s-delete\b", "find -delete xóa hàng loạt"),
    (DAU + r"(?:mkfs\S*|dd\s+if=|shred)\b", "lệnh ghi đè ổ đĩa hoặc hủy dữ liệu"),
    (DAU + r"(?:curl|wget)\b[^|;\n]*\|\s*(?:sudo\s+)?(?:ba|z)?sh\b", "tải và chạy mã từ Internet không qua kiểm tra"),
    (DAU + r"chmod\s+-R\s+777\b", "mở toàn quyền cho cả cây thư mục"),
]

# Lệnh có thể xóa, đổi tên hoặc ghi đè tệp được nêu trong tham số.
LENH_DOI_TEP = {"rm", "mv", "unlink", "truncate", "shred", "cp"}
LENH_GIT_DOI_TEP = {"rm", "mv"}


def bo_heredoc(lenh):
    """Bỏ phần thân heredoc: đó là nội dung tệp, không phải lệnh sẽ chạy."""
    ket_qua, dong = [], lenh.split("\n")
    i = 0
    while i < len(dong):
        ket_qua.append(dong[i])
        dau = re.findall(r"<<-?\s*['\"]?(\w+)['\"]?", dong[i])
        i += 1
        for nhan in dau:
            while i < len(dong) and dong[i].strip() != nhan:
                i += 1
            i += 1  # bỏ dòng kết thúc heredoc
    return "\n".join(ket_qua)


def la_tep_quan_trong(duong_dan):
    p = duong_dan.replace("\\", "/")
    goc = os.environ.get("CLAUDE_PROJECT_DIR", "").replace("\\", "/").rstrip("/")
    if goc and p.startswith(goc + "/"):
        p = p[len(goc) + 1:]
    if os.path.basename(p) in TEN_TEP_QUAN_TRONG:
        return True
    if any(p == t or p.endswith("/" + t) for t in TEP_CAU_HINH):
        return True
    phan = p.split("/")
    for td in THU_MUC_QUAN_TRONG:
        td_phan = td.split("/")
        for i in range(len(phan) - len(td_phan)):
            if phan[i:i + len(td_phan)] == td_phan:
                return True
    return False


def tra_ve(quyet_dinh, ly_do):
    print(json.dumps({
        "hookSpecificOutput": {
            "hookEventName": "PreToolUse",
            "permissionDecision": quyet_dinh,
            "permissionDecisionReason": ly_do,
        }
    }, ensure_ascii=False))
    sys.exit(0)


def tep_bi_dong_toi(lenh):
    """Liệt kê các tệp mà lệnh shell có thể xóa, đổi tên hoặc ghi đè."""
    muc_tieu = []
    # Đích của chuyển hướng > hoặc >> (bỏ qua 2>&1).
    for m in re.finditer(r"(?<![<>&])[0-9]?>>?\s*([^\s;&|<>]+)", lenh):
        if not m.group(1).startswith("&"):
            muc_tieu.append(m.group(1))
    # Tham số của rm, mv, cp, git rm, git mv, sed -i trong từng đoạn lệnh.
    for doan in re.split(r"&&|\|\||[;|\n]", lenh):
        try:
            tu = shlex.split(doan)
        except ValueError:
            tu = doan.split()
        while tu and ("=" in tu[0] or tu[0] in ("sudo", "command")):
            tu = tu[1:]
        if not tu:
            continue
        ten = os.path.basename(tu[0])
        if ten in LENH_DOI_TEP:
            thamso = tu[1:]
            if ten == "cp":
                thamso = thamso[-1:]  # cp chỉ ghi đè tệp đích
            muc_tieu += thamso
        elif ten == "git" and len(tu) > 1 and tu[1] in LENH_GIT_DOI_TEP:
            muc_tieu += tu[2:]
        elif ten == "sed" and any(t.startswith("-i") or t == "--in-place" for t in tu[1:]):
            muc_tieu += tu[2:]
    return [t for t in muc_tieu if t and not t.startswith("-")]


def xet_bash(lenh):
    lenh = bo_heredoc(lenh)
    for mau, ly_do in LENH_CAM:
        if re.search(mau, lenh):
            tra_ve("deny", "Hook chặn: " + ly_do + ". Nếu thật sự cần, hãy xin người dùng tự chạy lệnh.")
    for tep in tep_bi_dong_toi(lenh):
        if la_tep_quan_trong(tep):
            tra_ve("ask", "Lệnh có thể xóa, đổi tên hoặc ghi đè tệp quan trọng: " + tep
                   + " (quy tắc 4 CLAUDE.md). Cần người dùng xác nhận.")


def xet_ghi_tep(du_lieu):
    ten_cong_cu = du_lieu.get("tool_name", "")
    dau_vao = du_lieu.get("tool_input", {}) or {}
    duong_dan = dau_vao.get("file_path") or dau_vao.get("notebook_path") or ""
    if not duong_dan or not la_tep_quan_trong(duong_dan):
        return
    # Tạo tệp mới thì không mất gì; chỉ hỏi khi sửa hoặc ghi đè tệp đã có.
    if ten_cong_cu == "Write" and not os.path.exists(duong_dan):
        return
    tra_ve("ask", "Sắp sửa hoặc ghi đè tệp quan trọng: " + duong_dan
           + " (quy tắc 4 CLAUDE.md). Cần người dùng xác nhận.")


def main():
    try:
        du_lieu = json.load(sys.stdin)
    except (json.JSONDecodeError, ValueError):
        return
    ten_cong_cu = du_lieu.get("tool_name", "")
    if ten_cong_cu == "Bash":
        xet_bash((du_lieu.get("tool_input") or {}).get("command", ""))
    elif ten_cong_cu in ("Write", "Edit", "MultiEdit", "NotebookEdit"):
        xet_ghi_tep(du_lieu)


if __name__ == "__main__":
    main()
