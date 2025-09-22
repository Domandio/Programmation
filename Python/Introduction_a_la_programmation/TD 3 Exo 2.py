print("Calcul du prix total TTC d'une commande\n----------")

#Saisie de nombres décimaux pour les 3 valeurs nécessaires au calcul
P=float(input("Entrez le prix hors taxe unitaire\n")) 
N=float(input("Entrez le nombre d'articles\n"))
T=float(input("Entrez le taux de TVA\n"))
print("----------")

#Calcul du résultat R et affichage
R=(P+(P*T/100))*N
print(f"Prix total TTC de votre commande : {R} €")