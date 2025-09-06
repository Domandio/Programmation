print("Factorielle multiplicative")
x=float(input(f"Entrez votre nombre\n"))
y=1
i=1
print("---------")
print(f"{i}\nx")
while i<=x :
    y = y*i
    i = i+1
    if i<x :
        print(f"{i}\nx")
    else : 
        if i==x :
            print(f"{i}")
print("---------")
print(f"La valeur finale de votre factorielle multiplicative est : {y}")