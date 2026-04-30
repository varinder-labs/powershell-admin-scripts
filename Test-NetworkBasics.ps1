Write-Host "Network Basics Check" -ForegroundColor Cyan
Write-Host ""

Write-Host "Local IPv4 addresses:"
Get-NetIPAddress -AddressFamily IPv4 |
Where-Object { $_.IPAddress -notlike "127.*" } |
Select-Object InterfaceAlias, IPAddress |
Format-Table -AutoSize

Write-Host ""
Write-Host "Default gateway test:"
Test-Connection 8.8.8.8 -Count 2

Write-Host ""
Write-Host "DNS test:"
Resolve-DnsName google.com

Write-Host ""
Write-Host "Network adapters:"
Get-NetAdapter |
Select-Object Name, Status, LinkSpeed |
Format-Table -AutoSize
