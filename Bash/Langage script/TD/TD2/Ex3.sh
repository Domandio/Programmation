#!/bin/bash

#On récupère le nombre total de fichiers puis on filtre ceux commençant par d ou -
nbtotal=$(ls $1 | wc -l)
nbdossier=$(ls -l $1 | cut -c 1 | grep -c "d")
nbfichiers=$(ls -l $1 | cut -c 1 | grep -c "-")
#ls -A : Afficher tous les éléments sauf "." et ".." qui ne sont pas des fichiers ni des dossiers
#grep -c : Compter les fichiers. ^\ : Début de ligne et échappement du caractère "."
nbfichierscaches=$(ls -A $1 | grep -c "^\.")

#Affichage du nombre des fichiers de chaque catégorie :
echo "Nombre total d'éléments : $nbtotal"
echo "Nombre total de dossiers : $nbdossier"
echo "Nombre total de fichiers ordinaires : $nbfichiers"
echo "Nombre total de fichiers cachés : $nbfichierscaches"
echo -----------

echo "Modification des droits sur les fichiers suivants :"
cd "$1"
#Liste contenant tous les fichiers du répertoire courant :
files=(*)

#Affichage des fichiers traités et modification des droits :
for ((i=0; i<${#files[@]}; i++)); do
    echo "${files[i]}"
#    chmod 500 "${files[i]}"
done

echo -----------
echo "Vérification des droits :"
ls -l