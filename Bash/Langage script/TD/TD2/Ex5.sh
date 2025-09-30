#!/bin/bash
#On vérifie si $1 est un fichier ou un dossier dans des boucles if :
if [ -f "$1" ]; then
cat $1
elif [ -d "$1" ]; then
ls $1
else
echo "Erreur : veuillez entrer un argument valide (fichier ou répertoire)"
fi