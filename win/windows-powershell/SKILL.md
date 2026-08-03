---
name: windows-powershell
description: >
  Skill for coding agents working on Windows. Enforces native PowerShell usage
  (not bash) and provides patterns for CRUD on files/folders, search and filter,
  text search, pipelines and redirection, remote downloads, compression, and
  error handling.
license: Unlicense
metadata:
  version: 2026.08.03+15
  authors:
    - anovsiradj
    - https://www.perplexity.ai/
    - https://copilot.microsoft.com/
    - https://antigravity.google/
---

# windows-powershell

## Purpose
You are a coding agent running on **Windows 11** with **PowerShell 7+**.
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

## Section 1 — CRUD Files/Folders

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

See `./read.md` for detailed file-reading patterns (Get-Content, head/tail, follow, encoding, and streaming).

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

**Partial update of a text file (update lines 4 through 7)**

**Approach A — Read into array, modify slice, write back (simple, safe):**

```powershell
$path = 'C:\temp\file.txt'
# Backup first
Copy-Item -Path $path -Destination "$path.bak" -Force

# Read all lines
$lines = Get-Content -Path $path -Raw -ErrorAction Stop -Encoding UTF8
# Split into array of lines
$array = $lines -split "`r?`n"

# Replace lines 4..7 (1-based line numbers)
$start = 4 - 1
$end = 7 - 1
$newSegment = @(
    "Line 4 replacement"
    "Line 5 replacement"
    "Line 6 replacement"
    "Line 7 replacement"
)

# Build new array
$before = $array[0..($start-1)]
$after = $array[($end+1)..($array.Length-1)]
$newArray = @()
if ($before) { $newArray += $before }
$newArray += $newSegment
if ($after) { $newArray += $after }

# Write back atomically
$newArray -join "`r`n" | Set-Content -Path $path -Encoding UTF8 -Force
```

**Approach B — Stream processing for large files (memory efficient):**

```powershell
$path = 'C:\temp\largefile.txt'
$temp = "$path.tmp"
$startLine = 4
$endLine = 7
$current = 0

Get-Content -Path $path -ReadCount 1 | ForEach-Object {
    $current++
    if ($current -lt $startLine -or $current -gt $endLine) {
        $_ | Out-File -FilePath $temp -Append -Encoding UTF8
    }
    elseif ($current -eq $startLine) {
        # Insert replacement lines once
        "Line 4 replacement" | Out-File -FilePath $temp -Append -Encoding UTF8
        "Line 5 replacement" | Out-File -FilePath $temp -Append -Encoding UTF8
        "Line 6 replacement" | Out-File -FilePath $temp -Append -Encoding UTF8
        "Line 7 replacement" | Out-File -FilePath $temp -Append -Encoding UTF8
    }
}

# Replace original after success
Move-Item -Path $temp -Destination $path -Force
```

**Notes**
- Always create a backup before modifying critical files.
- Use `-Encoding` explicitly to avoid encoding surprises.

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

**Partial delete of a text file (delete lines 4 through 7)**

**Approach A — Array method (small files):**

```powershell
$path = 'C:\temp\file.txt'
Copy-Item -Path $path -Destination "$path.bak" -Force
$array = Get-Content -Path $path -ErrorAction Stop
$start = 4 - 1
$end = 7 - 1

$before = if ($start -gt 0) { $array[0..($start-1)] } else { @() }
$after = if ($end -lt ($array.Length - 1)) { $array[($end+1)..($array.Length-1)] } else { @() }

($before + $after) | Set-Content -Path $path -Encoding UTF8 -Force
```

**Approach B — Stream method for large files:**

```powershell
$path = 'C:\temp\largefile.txt'
$temp = "$path.tmp"
$startLine = 4
$endLine = 7
$current = 0

Get-Content -Path $path -ReadCount 1 | ForEach-Object {
    $current++
    if ($current -lt $startLine -or $current -gt $endLine) {
        $_ | Out-File -FilePath $temp -Append -Encoding UTF8
    }
}

Move-Item -Path $temp -Destination $path -Force
```

**Notes**
- For both update and delete, prefer stream approach for very large files to avoid high memory usage.
- Use `-ErrorAction Stop` and `try/catch` around operations that must not fail silently.

---

## Section 2 — Search & Filter Files/Folders

### 2.1 Basic Search with Get-ChildItem
```powershell
# Search by extension
Get-ChildItem -Path "C:\temp" -Filter "*.txt"

# Search by name pattern recursively with Depth control (PS7)
Get-ChildItem -Path "C:\temp" -Include "*report*" -Recurse -Depth 3

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

# Exclude parent folders by path
Get-ChildItem -Path "C:\" -Recurse -File -Include *.txt, *.csv -ErrorAction SilentlyContinue |
    Where-Object { $_.FullName -notmatch '\\Program Files\\' -and $_.FullName -notmatch '\\Windows\\' }

# Top 10 largest files
Get-ChildItem -Path "C:\" -File -Recurse -ErrorAction SilentlyContinue |
    Sort-Object Length -Descending |
    Select-Object -First 10 Name, Length, FullName
```

**Notes**
- Use `-Depth` in PS7 to limit recursion and improve performance.
- Prefer `Where-Object` property checks over text parsing.

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

## Section 4 — Pipelines & Redirection (basic)

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

## Section 5 — Remote File Operations (basic, curl/wget-equivalent)

Use `Invoke-WebRequest` and `Invoke-RestMethod` for downloads and APIs. (Advanced retry and parallel patterns are in SKILL-advanced.md.)

```powershell
# Simple download
Invoke-WebRequest -Uri "https://example.com/file.zip" -OutFile "C:\Downloads\file.zip"

# Download with headers
$headers = @{ Authorization = "Bearer token" }
Invoke-WebRequest -Uri "https://api.example.com/data" -Headers $headers -OutFile "C:\data.json"

# GET JSON via REST
$data = Invoke-RestMethod -Uri "https://api.example.com/data"

# POST JSON
$body = @{ name = "John"; email = "john@example.com" } | ConvertTo-Json
Invoke-RestMethod -Uri "https://api.example.com/users" -Method Post -Body $body -ContentType "application/json"
```

---

## Section 6 — Compression

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

## Section 7 — Error Handling (basic)

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

**Notes**
- Use `-ErrorAction Stop` to make non-terminating errors catchable.
- Advanced logging and transcripts are in SKILL-advanced.md.

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

---

## Section 9 — Quick Agent Checklist

Before sending shell/code suggestions on Windows:

- [ ] Am I using PowerShell cmdlets, not bash?
- [ ] Are paths Windows-style (e.g. `C:\...`)?
- [ ] For file ops, did I use `New-Item`, `Get-ChildItem`, `Get-Content`, `Set-Content`, `Add-Content`, `Copy-Item`, `Move-Item`, `Remove-Item`?
- [ ] For text search, did I use `Select-String`, not `grep`?
- [ ] For downloads, did I use `Invoke-WebRequest` or `Invoke-RestMethod`, not `curl`/`wget`?
- [ ] For compression, did I use `Compress-Archive` / `Expand-Archive`?
- [ ] Did I handle errors where failure would matter (`-ErrorAction Stop`, `try/catch`)?

If any answer is “no”, revise the suggestion to follow this skill.
