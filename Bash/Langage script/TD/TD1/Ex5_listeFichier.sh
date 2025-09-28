#!/bin/bash
nbfichier=$(ls -l $1 | cut -c 1 | grep -i -c "-")
rep=($(ls "$1"))

for ((i=1; i<=nbfichier; i++)); do
    ls | sed -n "${i}p"
done
