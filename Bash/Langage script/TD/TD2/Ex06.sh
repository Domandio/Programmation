#!/bin/bash

#Initalisation de variables avec les arguments entrés :
rep1="$1"
rep2="$2"
i=0
#Double boucle for pour parcourir tous les éléments des dossiers, l'un par rapport à l'autre :
for fichier1 in "$rep1"/*; do
    temp1=$(basename "$fichier1")
    for fichier2 in "$rep2"/*; do
        temp2=$(basename "$fichier2")
#Comparaison des fichiers a chaque itération
        if [ "$temp1" = "$temp2" ]; then
            echo "$temp1"
            ((i++))
        fi
    done
done
echo "Les deux répertoires contiennent $i éléments portant le même nom."