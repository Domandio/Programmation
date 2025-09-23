#!/bin/bash

#Exercice 1 ------
date "+%H:%M:%S %D"

#Exercice 2 ------
#Créer des variables pour enregistrer les groupes les uns après les autres
g1=$(groups | cut -d ' ' -f1)
g2=$(groups | cut -d ' ' -f2)
g3=$(groups | cut -d ' ' -f3)

#Afficher les groupes ainsi que le formatage
echo "$g1;$g2;$g3."

#Exercice 3 ------
#printf permet de sortir une liste des arguments, puis sort permet de les trier
liste_triee=$(printf '%s\n' "$@" | sort)
#Afficher la variable pour obtenir les arguments par odre alphabétique
echo $liste_triee

#Exercice 4 ------
echo "J'ai été appelé avec $# arguments"

#Exercice 5 ------
#Lister les fichiers en appelant le premier paramètre
ls $1

#Exercice 6 ------
#Compter le nombre de fichiers de chaque répertoire en redirigeant la sortie de ls dans wc
a=$(ls $1 | wc -l)
b=$(ls $2 | wc -l)
#Comparer les deux valeurs et afficher le bon répertoire en fonction du résultat
if [ $a -gt $b ]
then echo "Le répertoire contenant le plus de références est : $1"
else echo "Le répertoire contenant le plus de références est : $2"
fi
