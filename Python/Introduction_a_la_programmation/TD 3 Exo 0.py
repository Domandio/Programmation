print("Echange des valeurs de deux variables")

#Saisie utilisateur
A=int(input("Entrez la valeur de la variable A\n"))
B=int(input("Entrez la valeur de la variable B\n"))

#Stockage valeur de B pour échange de A et B
C=B
B=A
A=C

print(f"La valeur de A est {A}, et la valeur de B est {B}.")