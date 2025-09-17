#!/bin/bash
#Saisie utilisateur

read -p "Entrez la note de létudiant, ou tapez q pour terminer : " note
tab=()
truc=0

while [[ "$note" -ge 0 && "$note" -ne q ]]; do
tab[truc]=&note
read -p "Entrez la note de l'étudiant, ou tapez "q" pour terminer : " note
truc=$((truc + 1))
done

echo ${tab[*]}

# #Boucle if pour les tests
# if [ $note -lt 10 ]; then
#     echo Insuffisant
#     else
#     if [ $note -lt 12 ]; then
#         echo Moyen
#         else
#         if [ $note -lt 14 ]; then
#             echo Assez bien
#             else
#             if [ $note -lt 16 ]; then
#                 echo Bien
#                 else
#                     echo Très bien
                    
#             fi  
#         fi
#     fi
# fi