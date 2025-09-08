#Saisie utilisateur
nbnotes = int(input("Entrez le nombre de notes que vous voulez saisir :\n"))
notation = int(input("Entrez la note maximale possible :\n"))
print("----------")

#Variables
note = 0
somme = 0
moy = 0
notesup = 0
i = 0
tab = []


#Boucle For : Saisie des notes dans la liste
for i in range(nbnotes):
    note = float(input(f"Saisissez la note n°{i+1}\n"))
    while note < notation :
    if note > notation : 
        note = float(input(f"Saisissez une note comprise entre 0 et {notation} !\n"))
    else : 
        tab.append(note)
        somme += tab[i]

#Calcul moyenne
moy = somme / nbnotes

for i in range(nbnotes):
    if tab[i] > moy :
        notesup += 1

#Affichage final
print("----------")
print(f"Le nombre de notes supérieures à la moyenne de la classe est : {notesup}")