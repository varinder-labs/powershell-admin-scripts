Write-Host "=== System Information Report ===" -ForegroundColor Cyan
Write-Host ""

Write-Host "Computer Name:" -NoNewline
Write-Host " $env:COMPUTERNAME" -ForegroundColor Green

Write-Host "Logged In User:" -NoNewline
Write-Host " $env:USERNAME" -ForegroundColor Green

Write-Host "Operating System:" -NoNewline
Write-Host " $((Get-CimInstance Win32_OperatingSystem).Caption)" -ForegroundColor Green

Write-Host "IP Address(es):" -ForegroundColor Yellow
Get-NetIPAddress -AddressFamily IPv4 |
Where-Object {$_.IPAddress -notlike "127.*"} |
Select-Object InterfaceAlias,IPAddress |
Format-Table -AutoSize

Write-Host ""
Write-Host "Disk Usage:" -ForegroundColor Yellow
Get-PSDrive -PSProvider FileSystem |
Select-Object Name,
@{Name="Used(GB)";Expression={[math]::Round(($_.Used/1GB),2)}},
@{Name="Free(GB)";Expression={[math]::Round(($_.Free/1GB),2)}} |
Format-Table -AutoSize
