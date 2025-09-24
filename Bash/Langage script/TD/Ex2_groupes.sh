#!/bin/bash

#Créer des variables pour enregistrer les groupes les uns après les autres
g1=$(groups | cut -d ' ' -f1)
g2=$(groups | cut -d ' ' -f2)
g3=$(groups | cut -d ' ' -f3)