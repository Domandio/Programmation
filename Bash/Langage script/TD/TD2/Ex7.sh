#!/bin/bash

echo "Entrez le login de l'utilisateur :"
read login
#On exécute la commande "id" afin de récupérer son code d'erreur avec $?. Si ce code est à 0 l'utilisateur n'existe pas.
id "$login"
if [ $? -ne 0 ]; then
echo "Erreur : l'utilisateur $login n'existe pas"
exit
fi
#On utilise la commande "id" à nouveau. -G : Affiche les identifiants de groupes -n : Affiche les noms plutôt que des nombres
echo "Groupes secondaires de $login :"
id -Gn "$login" | cut -d' ' -f2-