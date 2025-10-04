#!/bin/bash

#On récupère l'argument avec $1 et on utilise une boucle for pour afficher tous les chiffres
for ((i=1; i<=$1; i++)); do
echo $i
done