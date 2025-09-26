#!/bin/bash

#Read, vérifiction et stockage des valeurs pour chaque droit de chaque type d'utilisateur :

#-----PROPRIETAIRE
echo "Quelles permissions souhaitez vous appliquer aux nouveaux fichiers et répertoires ? Pour vous :"
read -p "lecture o/n : " ownerread
case "$ownerread" in
    o)
    ownerread=4;;
    n)
    ownerread=0;;
    *)
    echo "Entrez "o" ou "n""
    exit 1 ;;
    esac

read -p "écriture o/n : " ownerwrite
case "$ownerwrite" in
    o)
    ownerwrite=2;;
    n)
    ownerwrite=0;;
    *)
    echo "Entrez "o" ou "n""
    exit 1 ;;
    esac

read -p "exécution o/n : " ownerexec
case "$ownerexec" in
    o)
    ownerexec=1;;
    n)
    ownerexec=0;;
    *)
    echo "Entrez "o" ou "n""
    exit 1 ;;
    esac

 #-----GROUPE
echo "Quelles permissions souhaitez vous appliquer aux nouveaux fichiers et répertoires ? Pour le groupe :"
read -p "lecture o/n : " groupread
case "$groupread" in
    o)
    groupread=4;;
    n)
    groupread=0;;
    *)
    echo "Entrez "o" ou "n""
    exit 1 ;;
    esac

read -p "écriture o/n : " groupwrite
case "$groupwrite" in
    o)
    groupwrite=2;;
    n)
    groupwrite=0;;
    *)
    echo "Entrez "o" ou "n""
    exit 1 ;;
    esac

read -p "exécution o/n : " groupexec
case "$groupexec" in
    o)
    groupexec=1;;
    n)
    groupexec=0;;
    *)
    echo "Entrez "o" ou "n""
    exit 1 ;;
    esac

#-----AUTRES
echo "Quelles permissions souhaitez vous appliquer aux nouveaux fichiers et répertoires ? Pour les autres utilisateurs :"
read -p "lecture o/n : " otherread
case "$otherread" in
    o)
    otherread=4;;
    n)
    otherread=0;;
    *)
    echo "Entrez "o" ou "n""
    exit 1 ;;
    esac

read -p "écriture o/n : " otherwrite
case "$otherwrite" in
    o)
    otherwrite=2;;
    n)
    otherwrite=0;;
    *)
    echo "Entrez "o" ou "n""
    exit 1 ;;
    esac

read -p "exécution o/n : " otherexec
case "$otherexec" in
    o)
    otherexec=1;;
    n)
    otherexec=0;;
    *)
    echo "Entrez "o" ou "n""
    exit 1 ;;
    esac

#Calculer les 3 chiffres pour notre uMask
ownr=$((7-$ownerexec-$ownerread-$ownerwrite))
grpr=$((7-$groupexec-$groupread-$groupwrite))
othr=$((7-$otherexec-$otherread-$otherwrite))

#Modification de l'uMask pour le shell actuel (temporaire)
umask "${ownr}${grpr}${othr}"

#-----Ligne ci-dessous à modifier pour rendre l'uMask permanent :
#echo "umask ${ownr}${grpr}${othr}" >> ~/.bashrc

echo "Vérification de l'uMask après modification, pour le shell actuel :"
umask
echo "Pour le rendre permanent, retirez le # devant la ligne 119 de ce script et relancez le."