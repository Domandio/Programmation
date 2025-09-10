print("Factorielle additive")

#Saisie utilisateur (nombre décimal)
x = float(input(f"Entrez votre nombre\n"))

#Variables : y = Total de la factorielle | i = Compteur pour boucle while
y = 0                                      
i = 0                                      
print("---------")

#Boucle while : ajout de la valeur de i à y + affichage de y à chaque itération
while i<=x :
    y = y+i
    i = i+1
    if i<x :
        print(f"{i}\n+")

#Formatage visuel pour ne pas terminer la boucle par un "+" sans valeur derrière
    else :
        if i==x :
            print(f"{i}")

print("---------")
print(f"La valeur finale de votre factorielle additive est : {y}")