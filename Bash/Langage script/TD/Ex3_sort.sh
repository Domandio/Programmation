#!/bin/bash

#printf permet de sortir une liste des arguments, puis sort permet de les trier
liste_triee=$(printf '%s\n' "$@" | sort)
#Afficher la variable pour obtenir les arguments par odre alphabétique
echo $liste_triee