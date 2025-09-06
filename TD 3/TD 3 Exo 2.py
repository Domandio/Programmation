print("Calcul du prix total TTC d'une commande")
P=float(input("Entrez le prix hors taxe unitaire\n"))
N=float(input("Entrez le nombre d'articles\n"))
T=float(input("Entrez le taux de TVA\n"))
R=(P+(P*T/100))*N
print(f"Le prix total TTC de votre commande : {R} €")