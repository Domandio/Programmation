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
tab = [0] * nbnotes

#Boucle test + saisie tableau
for i in range(nbnotes):
    while True:
        try:
            note = float(input(f"Saisissez la note n°{i+1} :\n"))
            if 0 <= note <= notation:
                break
            else:
                print(f"Erreur : entrez une note comprise entre 0 et {notation}.")
        except ValueError:
            print("Erreur : saisissez un nombre valide.")
    tab[i] = note
    somme += note

#Calcul moyenne
moy = somme / nbnotes
i = 0

for i in range(nbnotes):
    if tab[i] > moy :
        notesup += 1

#Affichage final
print(f"{tab}")
print("----------")
print(f"Le nombre de notes supérieures à la moyenne de la classe est : {notesup}")