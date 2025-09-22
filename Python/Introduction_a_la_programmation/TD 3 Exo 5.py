#Saisie utilisateur initiale (nombre décimal)
x=float(input("Veuillez entrer un nombre entre 10 et 20 :\n"))

#Boucle while + if pour redemander un nombre si les conditions ne sont pas remplies
while x<10 or x>20 :
    if x<10 :
        x=float(input(f"Le nombre {x} est inférieur à 10, veuillez entre un nombre plus grand :\n"))
    else :
        if x>20 :
            x=float(input(f"Le nombre {x} est supérieur à 20, veuillez entrer un nombre plus petit :\n"))

#Affichage en cas de sortie de boucle while (donc valeur saisie correcte)
print(f"Félicitations, le nombre {x} est bien compris entre 10 et 20 !")