param([string]$Arch = "x64")

$MSRoots = @("C:\Program Files*\MSBuild", "C:\Program Files*\Microsoft Visual Studio")

$MSBuild = Get-ChildItem -Recurse -Path $MSRoots -Include MSBuild.exe -ErrorAction Ignore |
    ForEach-Object { (Get-Command $_).FileVersionInfo } |
    Sort-Object -Unique -Property FileVersion |
    ForEach-Object { $_.FileName} |
    Select-Object -Last 1

if (-not $MSBuild) {
    Write-Host "ERROR: MSBuild not found"
    exit 1
}

& $MSBuild "$PSScriptRoot\test.sln" /nologo /maxcpucount /property:Configuration=Release /property:Platform=$Arch
