$ErrorActionPreference = 'Stop'
$versionLine = Select-String -LiteralPath (Join-Path $PSScriptRoot 'RetailThanks.toc') -Pattern '^## Version: (.+)$'
$version = $versionLine.Matches[0].Groups[1].Value.Trim()
$dist = Join-Path $PSScriptRoot 'dist'
New-Item -ItemType Directory -Path $dist -Force | Out-Null
$zipPath = Join-Path $dist "RetailThanks-$version.zip"
if (Test-Path -LiteralPath $zipPath) { throw "Package already exists: $zipPath" }
Add-Type -AssemblyName System.IO.Compression.FileSystem
$zip = [System.IO.Compression.ZipFile]::Open($zipPath, 'Create')
try {
    foreach ($name in @('RetailThanks.toc', 'RetailThanks.lua', 'README.md', 'CHANGELOG.md', 'icon.png')) {
        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, (Join-Path $PSScriptRoot $name), "RetailThanks/$name") | Out-Null
    }
} finally { $zip.Dispose() }
Get-Item -LiteralPath $zipPath
