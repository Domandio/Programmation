#!/bin/bash
date "+%H:%M:%S %D"
echo "$#"
printf '%s\n' "$@" | sort
echo "${!#}"
