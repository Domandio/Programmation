#!/bin/bash

#IFS='.' : on remplace le séparateur de base, l'espace, par un point. Chaque octet séparé par un point saisi par l'utilisateur sera donc bien enregistré dans une variable séparée.
echo "Entrez une adresse IP au format '255.255.255.255'"
IFS='.' read oct1 oct2 oct3 oct4

for ((i=1 ; i<=4 ; i++)); do
    #On stocke les caractères "oct1", "oct2"... tour à tour dans var
    var="oct$i"
        #On accède à la valeur des variables "oct1", "oct2"... grâce à l'indirection ${!var} qui est en fait "$oct1", "$oct2"...
        if [ ${!var} -gt 255 ] || [ ${!var} -lt 0 ]; then
            #Message d'erreur et variable d'erreur utile pour la fin du script
            echo "Erreur sur l'octet n°$i (${!var}): entrez une valeur entre 0 et 255"
            test=false
        fi
done

#Test final
if [ "$test" != "false" ]; then
    echo "Vous avez rentré l'IP : $oct1.$oct2.$oct3.$oct4"
    ping -c 4 "$oct1.$oct2.$oct3.$oct4"
fi