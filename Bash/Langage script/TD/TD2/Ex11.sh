#!/bin/bash
#Fonction 1 : Copie du fichier /etc/passwd vers /mypasswd
copier_passwd() {
    cp /etc/passwd /mypasswd
    echo "Le fichier /etc/passwd a été copié vers /mypasswd"
}

#Fonction 2 : Retourne le nombre de lignes du fichier mypasswd
compter_lignes() {
    nblignes=$(wc -l < /mypasswd)
    echo "$nblignes"
}

#Fonction 3 : Retourne la taille du fichier mypasswd en ko
taille_fichier() {
    #On récupère la taille en octets puis on convertit en ko
    taille=$(ls -l /mypasswd | cut -d' ' -f5)
    tailleko=$((taille / 1024))
    echo "$tailleko"
}

#-----SCRIPT PRINCIPAL-----

#Appel de la fonction de copie
copier_passwd

#Appel de la fonction de comptage et stockage du résultat
nblignes=$(compter_lignes)
echo "Le fichier /mypasswd contient $nblignes lignes"

#Appel de la fonction de calcul de taille et stockage du résultat
taille=$(taille_fichier)
echo "La taille du fichier /mypasswd est de $taille ko"