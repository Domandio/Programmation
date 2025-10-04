#!/bin/bash

#On récupère le 10ème caractère de chaque ligne avec cut, puis on filtre et compte le nombre d'occurences de "t" ou "T"
ls -l $1 | cut -c 10 | grep -i -c "t"