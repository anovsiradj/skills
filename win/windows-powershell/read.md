# Membaca file di PowerShell — panduan (read.md)

Panduan praktis untuk membaca file: `Get-Content`, head/tail, follow, encoding, streaming, dan utilities berguna.

## Agent Best Practices
- Selalu gunakan full path untuk menghindari ambiguitas.
- Hindari `Invoke-Expression` jika memungkinkan (keamanan).
- Gunakan `-ErrorAction Stop` jika ingin gagal dengan cepat.
- Gunakan `Get-Item` atau `Get-ChildItem` untuk verifikasi keberadaan file sebelum membaca.
- Selalu pertimbangkan performa pada file besar (gunakan `-ReadCount` atau .NET class).

## Dasar — Membaca File

```powershell
# Membaca seluruh isi file
Get-Content -Path "C:\temp\file.txt"

# Memverifikasi keberadaan file sebelum membaca
Test-Path -Path "C:\temp\file.txt"

# Mendapatkan lokasi direktori saat ini
Get-Location
```

## Head / Tail / Follow

```powershell
# Mengambil 10 baris pertama (head)
Get-Content -Path "C:\path\to\file.txt" -TotalCount 10

# Mengambil 10 baris terakhir (tail)
Get-Content -Path "C:\path\to\file.txt" -Tail 10

# Mengikuti isi file secara real-time (tail -f)
Get-Content -Path "C:\path\to\file.txt" -Tail 10 -Wait

# Hanya ikuti baris baru yang masuk (tail -f dengan skip isi saat ini)
Get-Content -Path "C:\path\to\file.txt" -Tail 0 -Wait
```

## Utilities & Teknik Tambahan

### Pencarian Teks (Select-String / Grep-equivalent)
```powershell
# Mencari kata "ERROR" dengan konteks 3 baris sebelum dan sesudah
Select-String -Path file.log -Pattern "ERROR" -Context 3,3

# Tampilkan path file unik yang mengandung kata "TODO" secara rekursif
Select-String -Path "C:\Projects\**\*.ps1" -Pattern "TODO" -List | Select-Object -Unique Path
```

### Hitung Baris & Statistik
```powershell
# Menghitung jumlah baris dalam file
(Get-Content file.txt | Measure-Object -Line).Lines

# Menghitung kata dan karakter
Get-Content file.txt | Measure-Object -Word -Character
```

### Streaming & Batch (Efisiensi File Besar)
```powershell
# Baca dalam batch 100 baris untuk menghemat memori
Get-Content file.txt -ReadCount 100 | ForEach-Object {
	$_ | ForEach-Object {
		# Proses setiap baris di sini
	}
}
```

### Lazy Iteration (.NET Class)
```powershell
# Efisien untuk file raksasa tanpa memuat seluruh konten ke RAM sekaligus
[System.IO.File]::ReadLines('C:\path\to\file.txt') | ForEach-Object { $_ }
```

### Menampilkan Nomor Baris
```powershell
$i = 0
Get-Content file.txt | ForEach-Object {
	$i++
	"{0}: {1}" -f $i, $_
}
```

### Sampling / Skip / Take
```powershell
# Ambil 20 baris pertama (head)
Get-Content file.txt | Select-Object -First 20

# Ambil 20 baris terakhir (tail)
Get-Content file.txt | Select-Object -Last 20

# Ambil range baris (skip 100 baris pertama, lalu ambil 20 baris berikutnya)
Get-Content file.txt | Select-Object -Skip 100 -First 20
```

### Membaca & Memproses Format Terstruktur
```powershell
# Parse file JSON menjadi objek PowerShell
Get-Content data.json -Raw | ConvertFrom-Json

# Import file CSV langsung menjadi kumpulan objek
Import-Csv data.csv
```

### Penanganan Encoding & BOM
```powershell
# Membaca dengan encoding spesifik
Get-Content file.txt -Encoding UTF8
Get-Content file.txt -Raw -Encoding UTF8
```

### Membaca File yang Sedang Dikunci (Locked File / FileShare)
```powershell
# Membaca file log yang sedang ditulis oleh proses lain secara aman
$fs = [System.IO.File]::Open('C:\path\to\file.log', [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read, [System.IO.FileShare]::ReadWrite)
$sr = New-Object System.IO.StreamReader($fs)
while (-not $sr.EndOfStream) {
	$line = $sr.ReadLine()
	Write-Output $line
}
$sr.Close()
$fs.Close()
```

### Tee-Object (Tampilkan & Simpan Sekaligus)
```powershell
# Mengambil 50 baris terakhir, simpan ke file baru, dan cari kata "ERROR"
Get-Content file.log -Tail 50 | Tee-Object -FilePath recent.log | Select-String "ERROR"
```

## Contoh Pipeline Singkat
```powershell
# Mengambil 500 baris terakhir, mencari kata "Exception", mengaktifkan konteks, dan mengukurnya
Get-Content file.log -Tail 500 | Select-String "Exception" -Context 2,2 | Measure-Object
```

## Catatan Singkat
- Gunakan `-Tail` untuk efisiensi ketika mengambil baris akhir.
- Untuk file sangat besar, lebih baik menggunakan `[System.IO.File]::ReadLines` atau `-ReadCount` agar tidak menghabiskan memori.
- Gunakan `Import-Csv` atau `ConvertFrom-Json` untuk memparsing data terstruktur dengan mudah.

---
(SKRIP ini dibuat untuk membantu agen memberikan saran PowerShell-native saat membaca file di Windows.)
