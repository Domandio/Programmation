#!/bin/bash

#Lister les fichiers en appelant le premier paramètre
ls $1
ls -l $1 | cut -c 10 | grep -i -c "t"