#!/bin/bash
#TD 1 Langage scripts - Matthieu LANDUZE
#Adminsys 2025-2026
#  _____ ___    _  _   _   _ 
# |_   _|   \  | \| | /.\ / |
#   | | | |) | | .` | \_/ | |
#   |_| |___/  |_|\_|     |_|
                            
#---------- Exercice 1 ------

date "+%H:%M:%S %D"

#---------- Exercice 2 ------

#Créer des variables pour enregistrer les groupes les uns après les autres
g1=$(groups | cut -d ' ' -f1)
g2=$(groups | cut -d ' ' -f2)
g3=$(groups | cut -d ' ' -f3)

#Afficher les groupes ainsi que le formatage
echo "$g1;$g2;$g3."

#---------- Exercice 3 ------

#printf permet de sortir une liste des arguments, puis sort permet de les trier
liste_triee=$(printf '%s\n' "$@" | sort)
#Afficher la variable pour obtenir les arguments par odre alphabétique
echo $liste_triee

#---------- Exercice 4 ------

echo "J'ai été appelé avec $# arguments"

#---------- Exercice 5 ------

#Lister les fichiers en appelant le premier paramètre
ls $1

#---------- Exercice 6 ------

#Compter le nombre de fichiers de chaque répertoire en redirigeant la sortie de ls dans wc
a=$(ls $1 | wc -l)
b=$(ls $2 | wc -l)
#Comparer les deux valeurs et afficher le bon répertoire en fonction du résultat
if [ $a -gt $b ]
then echo "Le répertoire contenant le plus de références est : $1"
else echo "Le répertoire contenant le plus de références est : $2"
fi

#---------- Exercice 7 ------

#On récupère l'argument avec $1 et on utilise une boucle for pour afficher tous les chiffres
for ((i=1; i<=$1; i++)); do
echo $i
done

#---------- Exercice 8 ------

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

#---------- Exercice 9 ------

#!/bin/bash
#Récupérer le nombre de "/" dans le répertoire courant
cpath=$(pwd)
nbs=$(echo "$cpath" | grep -o "/" | wc -l)

#Boucle s'arrêtant au dernier dossier
for ((i=2; i<=$nbs+1; i++)); do
#Récupérer uniquement le dossier voulu a chaque itération
#"cut ... f1" : avant le prermier "/" donc inutile
rep1=$(echo "$cpath" | cut -d '/' -f$i)
#Reconstruire le chemin petit a petit a chaque itération pour pouvoir utiliser "ls"
rep2="$rep2"/"$rep1"
echo "Le répertoire $rep2 contient les éléments suivants :"
ls "$rep2"
echo -----
done

#---------- Exercice 10 ------

#Stocker le nombre d'arguments et afficher le nième argument
nb=$#
echo ${!nb}