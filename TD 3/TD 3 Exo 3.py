print("Entrez deux nombres pour savoir si le résultat de leur multiplication est positive ou négative")
Nb1 = float(input("Premier nombre :\n"))
Nb2 = float(input("Second nombre :\n"))
if Nb1>0 and Nb2>0 :
    print("Le résultat est positif")
else :
    if Nb1<0 and Nb2<0 :
        print("Le résultat est positif")
    else : print("Le résultat est négatif")