#!/bin/bash
#Récupération du nom d'utilisateur en paramètre + menu d'actions
username="$1"

echo "Gestion de l'utilisateur $username"
echo "1 - Créer l'utilisateur"
echo "2 - Modifier l'utilisateur"
echo "3 - Supprimer l'utilisateur"
read -p "Votre choix : " choix

case "$choix" in
1)

#Lecture des informations au clavier
read -p "UID : " uid
read -p "GID : " gid
read -p "Shell : " shell
read -p "Groupes secondaires (séparés par des virgules) : " groupes
read -p "Répertoire personnel : " homedir
    
#Création de l'utilisateur avec les paramètres fournis
useradd -u "$uid" -g "$gid" -s "$shell" -G "$groupes" -d "$homedir" -m "$username"
    
;;
    
2)

#Lecture des nouvelles informations
read -p "Nouvel UID : " uid
read -p "Nouveau GID : " gid
read -p "Nouveau Shell : " shell
read -p "Nouveaux groupes secondaires : " groupes
read -p "Nouveau répertoire personnel : " homedir
    
#Modification de l'UID
usermod -u "$uid" "$username"
    
#Modification du GID
usermod -g "$gid" "$username"

#Modification du Shell
usermod -s "$shell" "$username"

#Modification des groupes secondaires
usermod -G "$groupes" "$username"
    
#Modification du répertoire personnel
usermod -d "$homedir" -m "$username"

echo "L'utilisateur $username a été modifié"
id "$username"
;;
    
3)
#Confirmation de suppression
read -p "Voulez-vous supprimer le répertoire personnel ? (o/n) : " supphome
    
case "$supphome" in
    o)
    userdel -r "$username"
    ;;
    n)
    userdel "$username"
    ;;
    *)
    echo "Choix invalide, annulation"
    exit 1
    ;;
esac

    echo "L'utilisateur $username a été supprimé"
    ;;
    
    *)
    echo "Choix invalide : entrez 1, 2 ou 3"
    exit 1
    ;;
esac