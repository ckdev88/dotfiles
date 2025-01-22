#!/bin/bash

# load local LSPs & dev server for current rails project
commands=(
  "cd $PWD && bin/dev" 
  "cd $PWD && solargraph stdio"
  "cd $PWD && yard server --reload"
)

for ((i=0; i<${#commands[@]}; i++))
do
  gnome-terminal --tab -- bash -c "${commands[i]}; exec bash"
done
