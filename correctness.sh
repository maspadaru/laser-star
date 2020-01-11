#!/bin/bash

# ============================================================================
./star.sh b
# ============================================================================

mkdir -p ../out/correctness

./star.sh r S ../cbscenarios-star/correctness/tgds/dependencies/program.star ../cbscenarios-star/correctness/tgds/data/input.stream ../out/correctness/tgds_s.txt 
./star.sh r R ../cbscenarios-star/correctness/tgds/dependencies/program.star ../cbscenarios-star/correctness/tgds/data/input.stream ../out/correctness/tgds_r.txt 

./star.sh r S ../cbscenarios-star/correctness/tgds5/dependencies/program.star ../cbscenarios-star/correctness/tgds5/data/input.stream ../out/correctness/tgds5_s.txt 
./star.sh r R ../cbscenarios-star/correctness/tgds5/dependencies/program.star ../cbscenarios-star/correctness/tgds5/data/input.stream ../out/correctness/tgds5_r.txt 

./star.sh r S ../cbscenarios-star/correctness/weak/dependencies/program.star ../cbscenarios-star/correctness/weak/data/input.stream ../out/correctness/weak_s.txt 
./star.sh r R ../cbscenarios-star/correctness/weak/dependencies/program.star ../cbscenarios-star/correctness/weak/data/input.stream ../out/correctness/weak_r.txt 
