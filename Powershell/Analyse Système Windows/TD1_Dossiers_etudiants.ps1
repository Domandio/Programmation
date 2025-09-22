#Création dossiers dans le répertoire courant
New-Item -Name "Projet" -ItemType "Directory"
New-Item "Projet\Sources" -ItemType "Directory"
New-Item "Projet\Archives" -ItemType "Directory"

#Création fichiers dans sources
New-Item "Projet\Sources\code1.txt"
New-Item "Projet\Sources\code2.txt"
New-Item "Projet\Sources\code3.txt"

#Copie fichiers
Copy-Item "Projet\Sources\code1.txt" "Projet\Archives\code1.txt"
Copy-Item "Projet\Sources\code2.txt" "Projet\Archives\code2.txt"
Copy-Item "Projet\Sources\code3.txt" "Projet\Archives\code3.txt"

#Modification et suppression fichiers
Rename-Item "Projet\Archives\code1.txt" "main.txt"
Remove-Item "Projet\Archives\code3.txt"