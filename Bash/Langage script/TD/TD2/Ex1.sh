#!/bin/bash

echo "Entrez une adresse IP au format '255.255.255.255'"
IFS='.' read oct1 oct2 oct3 oct4

for ((i=1 ; i<=4 ; i++)); do
    var="oct$i"
        if [ ${!var} -gt 255 ] || [ ${!var} -lt 0 ]; then
            echo "Erreur sur l'octet n°$i (${!var}): entrez une valeur entre 0 et 255"
            test=false
        fi
done

if [ "$test" != "false" ]; then
    echo "Vous avez rentré l'IP : $oct1.$oct2.$oct3.$oct4"
    ping "$oct1.$oct2.$oct3.$oct4"
fi