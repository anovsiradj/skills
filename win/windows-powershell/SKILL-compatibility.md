# windows-powershell — Compatibility Notes

## Environment
- **Target environment**: Windows 11 with PowerShell 7+.
- **Cmdlet availability**: Most cmdlets used here are available in PowerShell 7. `Compress-Archive` and `Expand-Archive` are available since PowerShell 5 and safe to use in PS7.

## Agent-specific Notes
- **Claude**: often biased toward Unix-style commands; enforce PowerShell cmdlets strictly.
- **Copilot**: more Windows-aware but still validate outputs against checklist.
- **Cursor / Codeium**: may fallback to bash-like suggestions; always translate to PowerShell equivalents.

## Known Issues and Behavior Changes
- **Aliases**: Aliases like `ls` exist in PS7 but should not be used in scripts; prefer full cmdlet names.
- **Invoke-WebRequest**: returns richer objects in PS7; scripts that parsed raw HTML in PS5 may need adjustment.
- **ForEach-Object -Parallel**: available in PS7; ensure scriptblocks are self-contained and avoid relying on outer-scope variables without `using:`.
- **Encoding defaults**: In PowerShell 5, `Get-Content` defaults to ANSI. In PowerShell 7, it defaults to UTF8. Scripts that rely on specific encoding should explicitly set `-Encoding`.
- **Cross-platform note**: PowerShell 7 is cross-platform, but this skill is strictly intended for Windows 11 environments. Do not assume Linux/macOS compatibility.

## Version matrix (summary)
- **PowerShell 5**: supports core cmdlets used here, but lacks `ForEach-Object -Parallel`.
- **PowerShell 7**: recommended target; supports parallelism, improved performance, UTF8 default encoding, and cross-platform fixes.
