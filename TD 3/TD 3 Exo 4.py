print("Calculateur de niveau en parachutisme")

#Saisie utilisateur (nombre entier)
x = int(input("Entrez l'âge "))

#Tests par tranches inférieures
if x<6 :
    print("Trop jeune !")
else :
    if x<8 :
        print("Niveau Poussin")
    else :
        if x<10 :
            print("Niveau Pupille")
        else :
            if x<12 :
                print("Niveau Minime")
            else :
                if x<99 :
                    print("Niveau Cadet")
                else : 
                    print("Vous n'êtes pas un peu trop âgé pour faire des sports extrêmes ?")
                