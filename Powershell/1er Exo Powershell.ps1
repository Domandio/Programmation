#Services

Get-Help use*
Get-Service
Get-Service -DisplayName "win*"
Get-Service -Name "win*" -Exclude "*Defend*"
Get-Service -Name "win*" | Where-Object {$_.Status -eq "Stopped"}

#Processus
Get-Process

Start-Process Firefox
Stop-Process -name Firefox
