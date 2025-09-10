# Afficher les Services
Get-Help use*
Get-Service

#Afficher les services avec des contraintes de nom :
Get-Service -DisplayName "win*"
Get-Service -Name "win*" -Exclude "*Defend*"
Get-Service -Name "win*" -DisplayName -Exclude "*Service de*"
Get-Service -Name "win*" | Where-Object {$_.DisplayName -notlike "*Service de*"}

#Afficher les services avec une contrainte de statut :
Get-Service -Name "win*" | Where-Object {$_.Status -eq "Stopped"}

#Processus
Get-Process

Start-Process Firefox
Stop-Process -name Firefox