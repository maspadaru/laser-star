#!/bin/bash

# ============================================================================
./star.sh b
# ============================================================================

./star.sh r R ../cbscenarios-star/deep/100/dependencies/program.star ../cbscenarios-star/deep/100/data/input.stream 
./star.sh r R ../cbscenarios-star/deep/200/dependencies/program.star ../cbscenarios-star/deep/200/data/input.stream 
./star.sh r R ../cbscenarios-star/deep/300/dependencies/program.star ../cbscenarios-star/deep/300/data/input.stream 


./star.sh r R ../cbscenarios-star/LUBM/dependencies/program.star ../cbscenarios-star/LUBM/data/001/input.stream 
./star.sh r R ../cbscenarios-star/LUBM/dependencies/program.star ../cbscenarios-star/LUBM/data/010/input.stream 
./star.sh r R ../cbscenarios-star/LUBM/dependencies/program.star ../cbscenarios-star/LUBM/data/01k/input.stream 
./star.sh r R ../cbscenarios-star/LUBM/dependencies/program.star ../cbscenarios-star/LUBM/data/100/input.stream 


