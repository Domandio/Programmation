#!/bin/bash

#Exercice 1  ------

#IFS='.' : on remplace le séparateur de base, l'espace, par un point. Chaque octet séparé par un point saisi par l'utilisateur sera donc bien enregistré dans une variable séparée.
echo "Entrez une adresse IP au format '255.255.255.255'"
IFS='.' read oct1 oct2 oct3 oct4

for ((i=1 ; i<=4 ; i++)); do
    #On stocke les caractères "oct1", "oct2"... tour à tour dans var
    var="oct$i"
        #On accède à la valeur des variables "oct1", "oct2"... grâce à l'indirection ${!var} qui est en fait "$oct1", "$oct2"...
        if [ ${!var} -gt 255 ] || [ ${!var} -lt 0 ]; then
            #Message d'erreur et variable d'erreur utile pour la fin du script
            echo "Erreur sur l'octet n°$i (${!var}): entrez une valeur entre 0 et 255"
            test=false
        fi
done

#Test final
if [ "$test" != "false" ]; then
    echo "Vous avez rentré l'IP : $oct1.$oct2.$oct3.$oct4"
    ping -c 4 "$oct1.$oct2.$oct3.$oct4"
fi

#Exercice 2 - 1ère partie  ------

#On récupère le 10ème caractère de chaque ligne avec cut, puis on filtre et compte le nombre d'occurences de "t" ou "T"
ls -l $1 | cut -c 10 | grep -i -c "t"

#Exercice 2 - 2ème partie  ------

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

#Exercice 3  ------

#On récupère le nombre total de fichiers puis on filtre ceux commençant par d ou -
nbtotal=$(ls $1 | wc -l)
nbdossier=$(ls -l $1 | cut -c 1 | grep -c "d")
nbfichiers=$(ls -l $1 | cut -c 1 | grep -c "-")
#ls -A : Afficher tous les éléments sauf "." et ".." qui ne sont pas des fichiers ni des dossiers
#grep -c : Compter les fichiers. ^\ : Début de ligne et échappement du caractère "."
nbfichierscaches=$(ls -A $1 | grep -c "^\.")

#Affichage du nombre des fichiers de chaque catégorie :
echo "Nombre total d'éléments : $nbtotal"
echo "Nombre total de dossiers : $nbdossier"
echo "Nombre total de fichiers ordinaires : $nbfichiers"
echo "Nombre total de fichiers cachés : $nbfichierscaches"
echo -----------

echo "Modification des droits sur les fichiers suivants :"
cd "$1"
#Liste contenant tous les fichiers du répertoire courant :
files=(*)

#Affichage des fichiers traités et modification des droits :
for ((i=0; i<${#files[@]}; i++)); do
    echo "${files[i]}"
#    chmod 500 "${files[i]}"
done

echo -----------
echo "Vérification des droits :"
ls -l

#Exercice 4  ------

#Copie de passwd dans le répertoire courant de l'utilisateur
cp /etc/passwd ~/passwd.txt
#Modification des droits
chmod 666 ~/passwd.txt 
#Tri par ordre alphabétique décroissant
sort -r ~/passwd.txt

#Exercice 5  ------

#On vérifie si $1 est un fichier ou un dossier dans des boucles if :
if [ -f "$1" ]; then
cat $1
elif [ -d "$1" ]; then
ls $1
else
echo "Erreur : veuillez entrer un argument valide (fichier ou répertoire)"
fi

#Exercice 6  ------

#Initalisation de variables avec les arguments entrés :
rep1="$1"
rep2="$2"
i=0
#Double boucle for pour parcourir tous les éléments des dossiers, l'un par rapport à l'autre :
for fichier1 in "$rep1"/*; do
    temp1=$(basename "$fichier1")
    for fichier2 in "$rep2"/*; do
        temp2=$(basename "$fichier2")
#Comparaison des fichiers a chaque itération
        if [ "$temp1" = "$temp2" ]; then
            echo "$temp1"
            ((i++))
        fi
    done
done
echo "Les deux répertoires contiennent $i éléments portant le même nom."

#Exercice 7  ------

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

#Exercice 8  ------



#Exercice 9  ------



#Exercice 10 ------
