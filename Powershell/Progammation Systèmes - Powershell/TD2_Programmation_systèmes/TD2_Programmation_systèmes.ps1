#Affichage des utilisateurs
#1
Get-LocalUser
#2
Get-Localuser -Name "Matthieu" | Select-Object *
#3
Get-Localuser -Name "Matthieu" | Select-Object PasswordLastSet

#Ajout et modification d'utilisateurs
#1
New-LocalUser -Description Admisys
#2
Set-LocalUser Admisys -PasswordNeverExpires $false
#3
Set-LocalUser Admisys -PasswordNeverExpires $true
#4
Set-LocalUser -Name Adminsys -Description Admisys2025
#5
Remove-LocalUser -Name Adminsys