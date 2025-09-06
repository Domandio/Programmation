print("Calculateur de niveau en parachutisme")
x = int(input("Entrez l'âge "))
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
                    print("Vous n'êtes pas un peu trop vieux pour faire ce sport ?")
                