#!/bin/bash

#Récupérer le chemin réel du répertoire home de l'utilisateur courant
a=$(eval echo ~$USER)

#read -t : timeout de la saisie utilisateur en secondes
echo 'Vous avez 5 secondes pour entrer le chemin de votre répertoire home !'
read -t 5 chemin
error=$?

#Vu sur "read --help" : si read timeout, renvoie un code d'erreur supérieur à 128
if [ $error -gt 128 ]; then
echo "Trop tard ! Le chemin de votre répertoire home est $a !"

#Test pour vérifier la saisie de l'utilisateur
elif [ "$a" != "$chemin" ]; then
echo "Faux ! Le chemin de votre répertoire home est $a !"
elif [ "$a" == "$chemin" ]; then 
echo "Bien joué ! Le chemin de votre répertoire home est bien $a !"
fi