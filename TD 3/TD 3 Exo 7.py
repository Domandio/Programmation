print("Factorielle multiplicative")

#Saisie utilisateur (nombre décimal)
x=float(input(f"Entrez votre nombre\n"))

#Variables : y = Total de la factorielle | i = Compteur pour boucle while
y=1
i=1
print("---------")

#Affichage première valeur (forcément 1)
print("1\nx")

#Boucle while : multiplication de y par i + affichage de i à chaque itération
while i<=x :
    y = y*i
    i = i+1
    if i<x :
        print(f"{i}\nx")

#Formatage visuel pour ne pas terminer la boucle par un "x" sans valeur derrière
    else : 
        if i==x :
            print(f"{i}")

print("---------")
print(f"La valeur finale de votre factorielle multiplicative est : {y}")