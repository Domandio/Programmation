print("Liste des n premiers carrés")

#Saisie utilisateur (nombre entier)
n=int(input("Entrez le nombre n voulu :\n"))

#Variables : i = compteur | List = liste vide dans laquelle vont être ajoutés les n premiers carrés
i = 1
List = []
print("---------")

while i <= n :
    List.append(i*i)        #Ajout valeur en dernière place de la liste(i²)
    print(f"{List[i-1]}")   #Affichage valeur entrée dans la liste (i-1 car début liste = 0)
    i = i + 1               #Incrémentation compteur

print("---------")
print(f"Voici le tableau des n premiers carrés demandé : {List}") #Affichage liste finale