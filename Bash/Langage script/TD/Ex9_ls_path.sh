#!/bin/bash

#Récupérer le nombre de "/" dans le répertoire courant
cpath=$(pwd)
nbs=$(echo "$cpath" | grep -o "/" | wc -l)

#Boucle s'arrêtant au dernier dossier
for ((i=2; i<=$nbs+1; i++)); do
#Récupérer uniquement le dossier voulu a chaque itération
#"cut ... f1" : avant le prermier "/" donc inutile
rep1=$(echo "$cpath" | cut -d '/' -f$i)
#Reconstruire le chemin petit a petit a chaque itération pour pouvoir utiliser "ls"
rep2="$rep2"/"$rep1"
echo "Le répertoire $rep2 contient les éléments suivants :"
ls $rep2
echo -----
done