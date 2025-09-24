#!/bin/bash

#Compter le nombre de fichiers de chaque répertoire en redirigeant la sortie de ls dans wc
a=$(ls $1 | wc -l)
b=$(ls $2 | wc -l)

#Comparer les deux valeurs et afficher le bon répertoire en fonction du résultat
if [ $a -gt $b ]
then echo "Le répertoire contenant le plus de références est : $1"
else echo "Le répertoire contenant le plus de références est : $2"
fi