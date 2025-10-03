#!/bin/bash
#-----QUESTION 1 :
echo "Fichiers contenant 'bash' dans le répertoire personnel"
find ~ -name "*bash*"
echo -----

#-----QUESTION 2
echo "Fichiers modifiés il y a 30 minutes"
find ~ -mmin -30
echo -----

#-----QUESTION 3
echo "Fichiers de plus de 2 Mo dans /usr"
find /usr -type f -size +2M 2>/dev/null
echo -----

#-----QUESTION 4
echo "Répertoires dans /usr/share/bug"
find /usr/share/bug -type d -ls 2>/dev/null
echo -----

#-----QUESTION 5
echo "Fichiers > 100 Ko appartenant à root dans /etc"
find /etc -type f -size +100k -user root 2>/dev/null
echo -----

#-----QUESTION 6
echo "Répertoires modifiés il y a 10 jours et < 100 Ko dans /etc"
find /etc -type d -mtime 10 -size -100k 2>/dev/null
echo -----

#Création du fichier adresses
echo "192.168.1.245.www.test.com.80" > adresses
echo "192.168.1.17.www.test.net.8012" >> adresses
echo "192.168.2.5.www.test.org.8001" >> adresses
echo "192.168.3.1.www.test.ma.8098" >> adresses
echo "192.168.2.15.www.test.to.8080" >> adresses

echo -----

#-----QUESTION 7
echo "Tri par adresse IP"
#"-t." permet de délimiter des champs séparés par des points. Ensuite tri par champ :"-k1,1" = champ de 1 à 1. "n" pour un tri numérique
sort -t. -k1,1n -k2,2n -k3,3n -k4,4n adresses
echo -----

#-----QUESTION 8
echo "Tri par nom de domaine"
sort -t. -k6,6 adresses
echo -----

#-----QUESTION 9
echo "Tri par adresse IP et numéro de port (ordre inverse)"
sort -t. -k1,1n -k2,2n -k3,3n -k4,4n -k7,7nr adresses
echo -----

#-----QUESTION 10
echo "Création du fichier trié"
sort -t. -k1,1n -k2,2n -k3,3n -k4,4n -k6,6 -k7,7n adresses > adresses_triees
echo "Fichier adresses_triees créé"
cat adresses_triees
echo -----

#-----QUESTION 11
echo "Filtrage type et nom, tri par type"
ls -l /etc | cut -c 1,59- | sort -k1,1 > filtre_ls
echo "Résultat dans filtre_ls :"
cat filtre_ls
echo -----

#-----QUESTION 12
echo "Filtrage droits, utilisateur, groupe, nom - tri par droits et utilisateur"
ls -l /etc | grep '^-' | cut -c 1-10,17-24,26-32,59- | sort -k1,1 -k2,2 >> filtre_ls
echo "Résultat ajouté dans filtre_ls"
echo -----