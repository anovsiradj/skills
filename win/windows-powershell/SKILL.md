---
name: windows-powershell
description: >
  Skill for coding agents working on Windows. Enforces native PowerShell usage
  (not bash) and provides patterns for CRUD on files/folders, search and filter,
  text search, pipelines and redirection, remote downloads, compression, and
  error handling.
compatibility:
  - claude-code
  - cursor
  - copilot
  - codeium
  - general-llm-agents
tags:
  - windows
  - powershell
  - file-system
  - scripting
  - dev-tools
version: 1.0.0
---

# windows-powershell

## Purpose

You are a coding agent running on **Windows**. The user uses **PowerShell**, not bash.  
Always generate **PowerShell-native** commands and scripts for any shell, filesystem, or automation task.

## Core Rules

1. **Never use bash/unix commands** for filesystem or shell operations:
   - Disallowed examples: `ls`, `rm`, `mkdir`, `touch`, `cat`, `cp`, `mv`, `pwd`, `rmdir`, `grep`, `find`, `curl`, `wget`, `zip`, `unzip`, `tar`, `gzip`.
   - Do not assume `bash`, WSL, or Linux; assume **Windows PowerShell** (or PowerShell 7) unless user clearly specifies otherwise.

2. **Always use PowerShell cmdlets** for:
   - Files and folders (CRUD, search, filter, compression).
   - Text search (grep-equivalent).
   - Remote operations and downloads (curl/wget-equivalent).
   - Pipelines and redirection.

3. Use **Windows-style paths**, e.g. `C:\Users\Name\Documents`.  
   - Forward slashes (`C:/Users/...`) are accepted by PowerShell but prefer backslashes in examples.

4. PowerShell pipelines pass **objects**, not raw text.
   - Prefer property-based filtering (`Where-Object { $_.Property -eq ... }`) to text-based parsing.
   - Only convert to text (`Out-String`) at the end of a pipeline if needed for display.

5. Always consider **error handling**:
   - Use `-ErrorAction Stop` when you intend to catch errors.
   - Use `try { ... } catch { ... } finally { ... }` patterns for non-trivial operations.

---

## Section 1 — CRUD: Files and Folders

### 1.1 Create

Use `New-Item` for both files and directories.

**Examples:**

```powershell
# Create a folder
New-Item -Path "C:\temp\NewFolder" -ItemType Directory

# Create nested folders (ensure parents exist)
New-Item -Path "C:\Parent\Child\GrandChild" -ItemType Directory -Force

# Create a file
New-Item -Path "C:\temp\file.txt" -ItemType File

# Create a file with initial content
New-Item -Path "C:\temp\file.txt" -ItemType File -Value "Hello World"
```

### 1.2 Read

Use `Get-ChildItem` for listing and `Get-Content` for file contents.

```powershell
# List files and folders in a directory
Get-ChildItem -Path "C:\temp"

# List with filter (by extension)
Get-ChildItem -Path "C:\temp" -Filter "*.txt"

# List recursively
Get-ChildItem -Path "C:\temp" -Recurse

# Read file content
Get-Content -Path "C:\temp\file.txt"

# Check if a path exists
Test-Path -Path "C:\temp\file.txt"

# Get current directory (like pwd)
Get-Location
```

### 1.3 Update

Use `Set-Content`, `Add-Content`, and `Rename-Item`, `Copy-Item`, `Move-Item`.

```powershell
# Overwrite file content
Set-Content -Path "C:\temp\file.txt" -Value "New content"

# Append to file
Add-Content -Path "C:\temp\file.txt" -Value "More text"

# Rename file or folder
Rename-Item -Path "C:\temp\old.txt" -NewName "new.txt"

# Copy file or folder
Copy-Item -Path "C:\temp\file.txt" -Destination "C:\backup\"

# Move file or folder
Move-Item -Path "C:\temp\file.txt" -Destination "C:\new\"
```

### 1.4 Delete

Use `Remove-Item`. Be explicit with `-Recurse` and `-Force`.

```powershell
# Delete a file
Remove-Item -Path "C:\temp\file.txt"

# Delete an empty folder
Remove-Item -Path "C:\temp\folder"

# Delete a folder and all contents
Remove-Item -Path "C:\temp\folder" -Recurse -Force
```

---

## Section 2 — Search & Filter Files/Folders

### 2.1 Basic Search with Get-ChildItem

```powershell
# Search by extension
Get-ChildItem -Path "C:\temp" -Filter "*.txt"

# Search by name pattern
Get-ChildItem -Path "C:\temp" -Include "*report*" -Recurse

# Exclude specific patterns
Get-ChildItem -Path "C:\temp" -Exclude "*.log"

# Files only
Get-ChildItem -Path "C:\temp" -File -Recurse

# Folders only
Get-ChildItem -Path "C:\temp" -Directory
```

### 2.2 Advanced Filtering with Where-Object

```powershell
# Files larger than 1 MB
Get-ChildItem -Path "C:\temp" -File |
    Where-Object { $_.Length -gt 1MB }

# Files modified in the last 7 days
Get-ChildItem -Path "C:\temp" -File |
    Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-7) }

# Multiple conditions
Get-ChildItem -Path "C:\temp" -Recurse -Include *.exe |
    Where-Object {
        ($_.LastWriteTime -gt '2025-01-01') -and
        ($_.Length -ge 1MB) -and
        ($_.Length -le 10MB)
    }

# Exclude specific parent folders
Get-ChildItem -Path "C:\" -Recurse -File -Include *.txt, *.csv |
    Where-Object { $_.PSParentPath -notlike "*Program Files*" -and $_.PSParentPath -notlike "*Windows*" }

# Top 10 largest files
Get-ChildItem -Path "C:\" -File -Recurse -ErrorAction SilentlyContinue |
    Sort-Object Length -Descending |
    Select-Object -First 10 Name, Length, FullName
```

---

## Section 3 — Search Text Inside Files (grep-equivalent)

Use `Select-String` to search within file contents.

### 3.1 Basic Text Search

```powershell
# Search a single file
Select-String -Path "C:\temp\file.txt" -Pattern "error"

# Search multiple files
Select-String -Path "C:\logs\*.log" -Pattern "ERROR"

# Recursive search
Get-ChildItem -Path "C:\logs" -Recurse -Filter "*.txt" |
    Select-String -Pattern "exception"
```

### 3.2 Advanced Text Search

```powershell
# Case-sensitive search
Select-String -Path "file.txt" -Pattern "Error" -CaseSensitive

# Simple (non-regex) match
Select-String -Path "file.txt" -Pattern "warning" -SimpleMatch

# Context lines (3 before and 3 after)
Select-String -Path "file.txt" -Pattern "error" -Context 3,3

# Count total matches across files
Get-ChildItem -Path "C:\logs" -Recurse -Filter "*.log" |
    Select-String -Pattern "ERROR" |
    Measure-Object

# Find files containing specific text (paths only)
Get-ChildItem -Path "C:\Projects" -Recurse -File |
    Select-String -Pattern "TODO" -List |
    Select-Object -Unique Path

# Regex example: find IP addresses
Select-String -Path "C:\logs\*.log" -Pattern "\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}"
```

---

## Section 4 — Pipelines & Redirection in PowerShell

### 4.1 Pipelines (Objects, not text)

Prefer property-based filtering and selection:

```powershell
# Filter objects by size
Get-ChildItem -Path "C:\temp" |
    Where-Object { $_.Length -gt 1MB }

# Select specific properties
Get-Process |
    Select-Object Name, CPU, WorkingSet

# Sort and take top N
Get-Process |
    Sort-Object CPU -Descending |
    Select-Object -First 5
```

Common aliases (use full names in scripts for clarity):
- `Where-Object` → `?`
- `ForEach-Object` → `%`
- `Select-Object` → `select`
- `Sort-Object` → `sort`

### 4.2 Redirection Operators and Streams

PowerShell streams:

- `1` — Success output
- `2` — Error
- `3` — Warning
- `4` — Verbose
- `5` — Debug
- `6` — Information

**Examples:**

```powershell
# Success output to file (overwrite)
Get-ChildItem > C:\files.txt

# Append success output
Get-ChildItem >> C:\files.txt

# Errors only
Get-ChildItem "C:\nonexistent" 2> C:\errors.txt

# Merge errors into success, then redirect
Get-ChildItem "C:\nonexistent" 2>&1 > C:\all_output.txt

# Redirect ALL streams
Get-ChildItem -Verbose *> C:\everything.txt

# Suppress all output
Remove-Item "C:\temp\*.tmp" -Force *> $null

# Display and save output
Get-Process |
    Tee-Object -FilePath C:\processes.txt |
    Where-Object CPU -gt 100
```

---

## Section 5 — Remote File Operations (curl/wget-equivalent)

Use `Invoke-WebRequest` and `Invoke-RestMethod`.

### 5.1 Downloads

```powershell
# Simple download (wget/curl equivalent)
Invoke-WebRequest -Uri "https://example.com/file.zip" -OutFile "C:\Downloads\file.zip"

# Download with progress
$ProgressPreference = 'Continue'
Invoke-WebRequest -Uri "https://example.com/large.zip" -OutFile "C:\Downloads\large.zip"

# Download with headers (e.g., auth)
$headers = @{ Authorization = "Bearer token" }
Invoke-WebRequest -Uri "https://api.example.com/data" -Headers $headers -OutFile "C:\data.json"

# Download multiple files
$urls = @(
    "https://example.com/file1.zip",
    "https://example.com/file2.zip"
)
foreach ($url in $urls) {
    $filename = Split-Path $url -Leaf
    Invoke-WebRequest -Uri $url -OutFile "C:\Downloads\$filename"
}
```

### 5.2 REST APIs

```powershell
# GET JSON
$data = Invoke-RestMethod -Uri "https://api.example.com/data"

# POST JSON
$body = @{ name = "John"; email = "john@example.com" } | ConvertTo-Json
Invoke-RestMethod -Uri "https://api.example.com/users" -Method Post -Body $body -ContentType "application/json"

# Authenticated GET
$headers = @{ Authorization = "Bearer token" }
Invoke-RestMethod -Uri "https://api.example.com/users/me" -Headers $headers
```

### 5.3 Download with Retry

```powershell
function Download-WithRetry {
    param(
        [string]$Uri,
        [string]$OutFile,
        [int]$MaxRetries = 3,
        [int]$RetrySeconds = 5
    )

    $attempt = 1
    while ($attempt -le $MaxRetries) {
        try {
            Write-Host "Attempt $attempt of $MaxRetries..."
            Invoke-WebRequest -Uri $Uri -OutFile $OutFile -ErrorAction Stop
            Write-Host "✓ Download successful"
            return
        }
        catch {
            Write-Warning "✗ Download failed: $($_.Exception.Message)"
            if ($attempt -lt $MaxRetries) {
                Write-Host "Retrying in $RetrySeconds seconds..."
                Start-Sleep -Seconds $RetrySeconds
            }
            $attempt++
        }
    }
    Write-Error "Download failed after $MaxRetries attempts"
}
```

---

## Section 6 — Compressed Files (ZIP)

Use `Compress-Archive` and `Expand-Archive`. [29][30][33][42]

### 6.1 Create and Extract ZIP

```powershell
# Create ZIP from folder
Compress-Archive -Path "C:\Logs" -DestinationPath "C:\Archives\logs.zip"

# Optimal compression
Compress-Archive -Path "C:\Data" -DestinationPath "C:\Archives\backup.zip" -CompressionLevel Optimal

# Update existing archive
Compress-Archive -Path "C:\newfile.txt" -DestinationPath "C:\archive.zip" -Update

# Extract archive
Expand-Archive -Path "C:\archive.zip" -DestinationPath "C:\Extracted"

# Extract with overwrite
Expand-Archive -Path "C:\archive.zip" -DestinationPath "C:\Extracted" -Force
```

---

## Section 7 — Error Handling Patterns

Use `try/catch/finally` with `-ErrorAction Stop`. [20][23][26][27]

```powershell
try {
    Remove-Item -Path "C:\temp\file.txt" -ErrorAction Stop
}
catch [System.IO.FileNotFoundException] {
    Write-Error "File not found"
}
catch [System.UnauthorizedAccessException] {
    Write-Error "Access denied"
}
catch {
    Write-Error "Unexpected error: $($_.Exception.Message)"
}
finally {
    Write-Host "Operation completed"
}
```

ErrorAction quick reference:

- `Stop` — throw terminating error (catchable)
- `Continue` — show error, continue (default)
- `SilentlyContinue` — suppress error
- `Ignore` — suppress error completely

---

## Section 8 — Bash → PowerShell Mapping

When the user or examples show bash commands, translate them:

```text
ls         → Get-ChildItem
cd         → Set-Location (or cd)
pwd        → Get-Location
mkdir      → New-Item -ItemType Directory
touch      → New-Item -ItemType File
cat        → Get-Content
rm         → Remove-Item
cp         → Copy-Item
mv         → Move-Item
grep       → Select-String
find       → Get-ChildItem -Recurse
curl/wget  → Invoke-WebRequest / Invoke-RestMethod
zip        → Compress-Archive
unzip      → Expand-Archive
echo > f   → Set-Content -Path f -Value "text"
echo >> f  → Add-Content -Path f -Value "text"
> /dev/null → > $null
2>&1       → 2>&1 (same syntax)
```

Always prefer the full PowerShell cmdlet names in scripts; aliases are acceptable in interactive sessions.

---

## Quick Agent Checklist

Before sending shell/code suggestions on Windows:

- [ ] Am I using PowerShell cmdlets, not bash?
- [ ] Are paths Windows-style (e.g. `C:\...`)?
- [ ] For file ops, did I use `New-Item`, `Get-ChildItem`, `Get-Content`, `Set-Content`, `Add-Content`, `Copy-Item`, `Move-Item`, `Remove-Item`?
- [ ] For text search, did I use `Select-String`, not `grep`?
- [ ] For downloads, did I use `Invoke-WebRequest` or `Invoke-RestMethod`, not `curl`/`wget`?
- [ ] For compression, did I use `Compress-Archive` / `Expand-Archive`?
- [ ] Did I handle errors where failure would matter (`-ErrorAction Stop`, `try/catch`)?

If any answer is “no”, revise the suggestion to follow this skill.
