#!/bin/bash
#TD 2 Langage scripts - Matthieu LANDUZE
#Adminsys 2025-2026

#  _____ ___    _  _   _   ___ 
# |_   _|   \  | \| | /.\ |_  )
#   | | | |) | | .` | \_/  / / 
#   |_| |___/  |_|\_|     /___|
                              

#---------- Exercice 1  ------

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

#---------- Exercice 2 - 1ère partie  ------

#On récupère le 10ème caractère de chaque ligne avec cut, puis on filtre et compte le nombre d'occurences de "t" ou "T"
ls -l $1 | cut -c 10 | grep -i -c "t"

#---------- Exercice 2 - 2ème partie  ------

#Read, vérifiction et stockage des valeurs pour chaque droit de chaque type d'utilisateur :

#PROPRIETAIRE
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

 #GROUPE
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

#AUTRES
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

#-----Ligne ci-dessous à modifier pour rendre l'uMask permanent :-----
#echo "umask ${ownr}${grpr}${othr}" >> ~/.bashrc

echo "Vérification de l'uMask après modification, pour le shell actuel :"
umask
echo "Pour le rendre permanent, retirez le # devant la ligne 119 de ce script et relancez le."

#---------- Exercice 3  ------

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

#---------- Exercice 4  ------

#Copie de passwd dans le répertoire courant de l'utilisateur
cp /etc/passwd ~/passwd.txt
#Modification des droits
chmod 666 ~/passwd.txt 
#Tri par ordre alphabétique décroissant
sort -r ~/passwd.txt

#---------- Exercice 5  ------

#On vérifie si $1 est un fichier ou un dossier dans des boucles if :
if [ -f "$1" ]; then
cat $1
elif [ -d "$1" ]; then
ls $1
else
echo "Erreur : veuillez entrer un argument valide (fichier ou répertoire)"
fi

#---------- Exercice 6  ------

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

#---------- Exercice 7  ------

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

#---------- Exercice 8  ------

#On vérifie le nombre de groupes dont le GID est inférieur à 1000 (systèmes) et ceux dont le GID est supérieur à 1000 (utilisateurs)
nbsys=$(cut -d':' -f3 /etc/group | grep -E '^[0-9]+$' | awk '$1 < 1000' | wc -l)
nbuser=$(cut -d':' -f3 /etc/group | grep -E '^[0-9]+$' | awk '$1 >= 1000' | wc -l)

echo "Nombre de groupes système : $nbsys"
echo "Nombre de groupes utilisateur : $nbuser"

#Parcourir tous les groupes du fichier /etc/group
while IFS=':' read nomgroupe motdepasse gid membres; do
    #Vérifier que le GID est un nombre valide
        #Tester si le GID est inférieur à 1000
        if [ $gid -lt 1000 ]; then
            echo "Le groupe $nomgroupe est un groupe système"
        else
            echo "Le groupe $nomgroupe est un groupe utilisateur"
        fi

done < /etc/group

#---------- Exercice 9  ------

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

#---------- Exercice 10 ------

#-----QUESTION 1
echo "Fichiers contenant 'bash' dans le répertoire personnel :"
find ~ -name "*bash*"
echo -----

#-----QUESTION 2
echo "Fichiers modifiés il y a 30 minutes :"
find ~ -mmin -30
echo -----

#-----QUESTION 3
echo "Fichiers de plus de 2 Mo dans /usr :"
find /usr -type f -size +2M 2>/dev/null
echo -----

#-----QUESTION 4
echo "Répertoires dans /usr/share/bug :"
find /usr/share/bug -type d -ls 2>/dev/null
echo -----

#-----QUESTION 5
echo "Fichiers > 100 Ko appartenant à root dans /etc :"
find /etc -type f -size +100k -user root 2>/dev/null
echo -----

#-----QUESTION 6
echo "Répertoires modifiés il y a 10 jours et < 100 Ko dans /etc :"
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
echo "Tri par adresse IP :"
#On trie en utilisant le point comme séparateur et on trie les 4 premiers champs numériquement
sort -t. -k1,1n -k2,2n -k3,3n -k4,4n adresses
echo -----

#-----QUESTION 8
echo "Tri par nom de domaine :"
#Le nom de domaine commence au 5ème champ après le 4ème point
sort -t. -k5 adresses
echo -----

#-----QUESTION 9
echo "Tri par IP et port en ordre inverse :"
#On trie d'abord par IP puis par port en ordre décroissant (r = reverse)
sort -t. -k1,1n -k2,2n -k3,3n -k4,4n -k7,7nr adresses
echo -----

#-----QUESTION 10
echo "Création du fichier trié :"
sort -t. -k1,1n -k2,2n -k3,3n -k4,4n -k5 -k7,7n adresses > adresses_triees
echo "Fichier adresses_triees créé"
cat adresses_triees
echo -----

#-----QUESTION 11
echo "Filtrage type et nom :"
#cut -c 1 : récupère le 1er caractère (type)
#cut -c 59- : récupère à partir du 59ème caractère (nom du fichier)
ls -l /etc | cut -c 1,59- | sort > filtre_ls
echo "Résultat dans filtre_ls"
echo -----

#-----QUESTION 12
#cut -c 1-10 : droits (10 caractères)
#cut -c 17-24 : utilisateur
#cut -c 26-32 : groupe
#cut -c 59- : nom du fichier
#>> pour ajouter sans écraser
echo "Filtrage droits, user, groupe, nom"
ls -l /etc | cut -c 1-10,17-24,26-32,59- | sort >> filtre_ls
echo "Résultat ajouté dans filtre_ls"

#---------- Exercice 11 ------

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