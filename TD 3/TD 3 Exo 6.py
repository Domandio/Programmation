print("Factorielle additive")
x = float(input(f"Entrez votre nombre\n"))
y = 0
i = 0
print("---------")
while i<=x :
    y = y+i
    i = i+1
    if i<x :
        print(f"{i}\n+")
    else : 
        if i==x :
            print(f"{i}")
print("---------")
print(f"La valeur finale de votre factorielle additive est : {y}")