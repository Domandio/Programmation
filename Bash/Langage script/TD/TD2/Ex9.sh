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
    #Vérifier si l'utilisateur existe déjà
    id "$username" 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "Erreur : l'utilisateur $username existe déjà"
        exit 1
    fi
    
    #Lecture des informations au clavier
    read -p "UID : " uid
    read -p "GID : " gid
    read -p "Shell : " shell
    read -p "Groupes secondaires (séparés par des virgules) : " groupes
    read -p "Répertoire personnel : " homedir
    
    #Création de l'utilisateur avec les paramètres fournis
    useradd -u "$uid" -g "$gid" -s "$shell" -G "$groupes" -d "$homedir" -m "$username"
    
    if [ $? -eq 0 ]; then
        echo "L'utilisateur $username a été créé avec succès"
        id "$username"
    else
        echo "Erreur lors de la création de l'utilisateur"
    fi
    ;;
    
    2)
    #Vérifier si l'utilisateur existe
    id "$username" 2>/dev/null
    if [ $? -ne 0 ]; then
        echo "Erreur : l'utilisateur $username n'existe pas"
        exit 1
    fi
    
    #Lecture des nouvelles informations
    read -p "Nouvel UID (laisser vide pour ne pas modifier) : " uid
    read -p "Nouveau GID (laisser vide pour ne pas modifier) : " gid
    read -p "Nouveau Shell (laisser vide pour ne pas modifier) : " shell
    read -p "Nouveaux groupes secondaires (laisser vide pour ne pas modifier) : " groupes
    read -p "Nouveau répertoire personnel (laisser vide pour ne pas modifier) : " homedir
    
    #Modification de l'UID
    if [ -n "$uid" ]; then
        usermod -u "$uid" "$username"
    fi
    
    #Modification du GID
    if [ -n "$gid" ]; then
        usermod -g "$gid" "$username"
    fi
    
    #Modification du Shell
    if [ -n "$shell" ]; then
        usermod -s "$shell" "$username"
    fi
    
    #Modification des groupes secondaires
    if [ -n "$groupes" ]; then
        usermod -G "$groupes" "$username"
    fi
    
    #Modification du répertoire personnel
    if [ -n "$homedir" ]; then
        usermod -d "$homedir" -m "$username"
    fi
    
    echo "L'utilisateur $username a été modifié"
    id "$username"
    ;;
    
    3)
    #Vérifier si l'utilisateur existe
    id "$username" 2>/dev/null
    if [ $? -ne 0 ]; then
        echo "Erreur : l'utilisateur $username n'existe pas"
        exit 1
    fi
    
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
    
    if [ $? -eq 0 ]; then
        echo "L'utilisateur $username a été supprimé"
    else
        echo "Erreur lors de la suppression de l'utilisateur"
    fi
    ;;
    
    *)
    echo "Choix invalide : entrez 1, 2 ou 3"
    exit 1
    ;;
esac