#!/bin/bash
nbfichier=$(ls -l $1 | cut -c 1 | grep -i -c "-")
echo $nbfichier

for fichier in "$1"/*; do
    if [ -f "$fichier" ]; then
        echo "$fichier"
    fi
done
