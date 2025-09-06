x=float(input("Veuillez entrer un nombre entre 10 et 20 :\n"))
while x<10 or x>20 :
    if x<10 :
        x=float(input(f"Le nombre {x} est inférieur à 10, veuillez entre un nombre plus grand :\n"))
    else :
        if x>20 :
            x=float(input(f"Le nombre {x} est supérieur à 20, veuillez entrer un nombre plus petit :\n"))
print(f"Félicitations, le nombre {x} est bien compris entre 10 et 20 !")