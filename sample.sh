#!/bin/bash

################ Build ##########
./star.sh b

################ Run ###########
./star.sh r S samples/simple.star samples/simple.stream output.txt
cat output.txt

./star.sh r S samples/steam_generator.star samples/steam_generator.stream output.txt
cat output.txt

./star.sh r R samples/bicycle.star samples/bicycle.stream output.txt
cat output.txt

rm output.txt
