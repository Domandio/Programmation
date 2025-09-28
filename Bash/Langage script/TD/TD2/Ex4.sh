#!/bin/bash
#Copie de passwd dans le répertoire courant de l'utilisateur
cp /etc/passwd ~/passwd.txt
#Modification des droits
chmod 666 ~/passwd.txt 
 #Tri par ordre alphabétique décroissant
 sort -r ~/passwd.txt