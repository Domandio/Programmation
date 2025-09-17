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

#Rediriger la sortie de  la commande "history" vers un fichier
history > 'C:\Users\Default\Documents\TD1.txt'

#Ecrire la sortie d'une commande A LA FIN d'un fichier
history >> 'C:\Users\Default\Documents\TD1.txt'

#Afficher le contenu de TD1.txt
Get-Content 'C:\Users\Default\Documents\TD1.txt'

#Ecrire du texte, rediriger ce texte vers Out-File qui par défaut réécrit dans le fichier cible
"Salut les Admisys" | Out-File 'C:\Users\Default\Documents\TD1.txt'

#Working directory
Set-Location 'C:\'
Get-Location