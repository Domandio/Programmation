print("Entrez deux nombres pour savoir si le résultat de leur multiplication est positive ou négative")

#Saisie utilisateur (nombre décimaux)
Nb1 = float(input("Premier nombre :\n"))
Nb2 = float(input("Second nombre :\n"))

#Tests + affichage
#(Résultat négatif uniquement si un seul des deux nombres est négatif)
if Nb1>0 and Nb2>0 :
    print("Le résultat est positif")
else :
    if Nb1<0 and Nb2<0 :
        print("Le résultat est positif")
    else : print("Le résultat est négatif")