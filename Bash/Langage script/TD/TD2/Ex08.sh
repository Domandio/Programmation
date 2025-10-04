#!/bin/bash
#On vérifie le nombre de groupes dont le GID est inférieur à 1000 (systèmes) et ceux dont le GID est supérieur à 1000 (utilisateurs)
nbsys=$(cut -d':' -f3 /etc/group | grep -E '^[0-9]+$' | awk '$1 < 1000' | wc -l)
nbuser=$(cut -d':' -f3 /etc/group | grep -E '^[0-9]+$' | awk '$1 >= 1000' | wc -l)

echo "Nombre de groupes système : $nbsys"
echo "Nombre de groupes utilisateur : $nbuser"

#Parcourir tous les groupes du fichier /etc/group
while IFS=':' read nomgroupe motdepasse gid membres; do
    #Vérifier que le GID est un nombre valide
        #Tester si le GID est inférieur à 1000
        if [ $gid -lt 1000 ]; then
            echo "Le groupe $nomgroupe est un groupe système"
        else
            echo "Le groupe $nomgroupe est un groupe utilisateur"
        fi

done < /etc/group