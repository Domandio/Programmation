#!/bin/bash

nbtotal=$(ls -1 | wc -l)

nbdossier=$(ls -l | cut -c 1 | grep -c "d")
nbfichiers=$(ls -l | cut -c 1 | grep -c "-")

nbfichierscaches=$(ls -a | grep -c "^\.")

echo "Nombre total d'éléments : $nbtotal" 
echo "Nombre total de dossiers : $nbdossier"
echo "Nombre total de fichiers ordinaires : $nbfichiers"
echo "Nombre total de fichiers cachés : $nbfichierscaches"