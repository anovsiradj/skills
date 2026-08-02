# windows-powershell — Advanced

## Advanced Pipelines
- **Calculated properties**
```powershell
Get-Process | Select-Object Name, @{Name="MemoryMB";Expression={($_.WorkingSet/1MB)}}
```

- **Grouping and aggregation**
```powershell
Get-ChildItem -Path "C:\Logs" -File | Group-Object Extension | Select-Object Name, Count
```

- **Custom objects**
```powershell
$items = Get-ChildItem -Path "C:\Data" -File | ForEach-Object {
    [PSCustomObject]@{
        Name     = $_.Name
        SizeMB   = [math]::Round($_.Length / 1MB, 2)
        Modified = $_.LastWriteTime
    }
}
$items | Sort-Object SizeMB -Descending
```

## Advanced Error Handling and Logging
- **Start transcript for session logs**
```powershell
Start-Transcript -Path "C:\Logs\session_$(Get-Date -Format yyyyMMdd_HHmmss).txt"
# ... script actions ...
Stop-Transcript
```

- **Write to event log (modern approach)**
```powershell
# Check event log availability with Get-WinEvent (PS7+)
if (-not (Get-WinEvent -LogName Application -ErrorAction SilentlyContinue)) {
    New-EventLog -LogName Application -Source "MyScript"
}
Write-EventLog -LogName Application -Source "MyScript" -EntryType Information -EventId 1000 -Message "Operation completed"
```

- **Structured exception handling**
```powershell
try {
    # risky operation
}
catch [System.Net.WebException] {
    # handle network errors
}
catch {
    # fallback
}
finally {
    # cleanup
}
```

## Advanced Remote Operations
- **Retry pattern (robust)**
```powershell
function Invoke-WithRetry {
    param($ScriptBlock, $MaxRetries = 3, $DelaySeconds = 5)
    $attempt = 0
    while ($attempt -lt $MaxRetries) {
        try {
            & $ScriptBlock
            return
        } catch {
            $attempt++
            if ($attempt -ge $MaxRetries) { throw }
            Start-Sleep -Seconds $DelaySeconds
        }
    }
}

# Example usage for downloads
Invoke-WithRetry {
    Invoke-WebRequest -Uri "https://example.com/file.zip" -OutFile "C:\Downloads\file.zip" -ErrorAction Stop
} -MaxRetries 5 -DelaySeconds 10
```

- **Parallel downloads (PowerShell 7)**
```powershell
$urls = @("https://example.com/file1.zip","https://example.com/file2.zip")
$urls | ForEach-Object -Parallel {
    param($u)
    $out = "C:\Downloads\$([IO.Path]::GetFileName($u))"
    Invoke-WebRequest -Uri $u -OutFile $out -ErrorAction Stop
} -ThrottleLimit 4
```

**Notes**
- Use `-ErrorAction Stop` inside parallel scriptblocks to ensure failures surface.
- Keep `ThrottleLimit` reasonable to avoid saturating network.
