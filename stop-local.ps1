$ErrorActionPreference = 'SilentlyContinue'
foreach ($port in 5173, 8080, 27017) {
  Get-NetTCPConnection -LocalPort $port -State Listen | Select-Object -ExpandProperty OwningProcess -Unique | ForEach-Object {
    Stop-Process -Id $_ -Force
  }
}
Write-Output 'Local Campus Recruitment services stopped.'
