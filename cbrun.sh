#!/bin/bash

# ============================================================================
./star.sh b
# ============================================================================

#./star.sh r S ../cbscenarios-star/deep/100/dependencies/program.star ../cbscenarios-star/deep/100/data/input.stream 
#./star.sh r S ../cbscenarios-star/deep/200/dependencies/program.star ../cbscenarios-star/deep/200/data/input.stream 
#./star.sh r S ../cbscenarios-star/deep/300/dependencies/program.star ../cbscenarios-star/deep/300/data/input.stream 
#./star.sh r R ../cbscenarios-star/deep/100/dependencies/program.star ../cbscenarios-star/deep/100/data/input.stream 
#./star.sh r R ../cbscenarios-star/deep/200/dependencies/program.star ../cbscenarios-star/deep/200/data/input.stream 
#./star.sh r R ../cbscenarios-star/deep/300/dependencies/program.star ../cbscenarios-star/deep/300/data/input.stream 


#./star.sh r S ../cbscenarios-star/LUBM/dependencies/program.star ../cbscenarios-star/LUBM/data/001/input.stream 
#./star.sh r R ../cbscenarios-star/LUBM/dependencies/program.star ../cbscenarios-star/LUBM/data/001/input.stream 

#./star.sh r S ../cbscenarios-star/LUBM/dependencies/program.star ../cbscenarios-star/LUBM/data/010/input.stream 
#./star.sh r R ../cbscenarios-star/LUBM/dependencies/program.star ../cbscenarios-star/LUBM/data/010/input.stream 


#./star.sh r R ../cbscenarios-star/LUBM/dependencies/program.star ../cbscenarios-star/LUBM/data/100/input.stream 

# ============================================================================

cd scripts
./cbconvert.sh 20 4 50 50 0
cd ..
echo "STAR --- 20 4 50 50 0"
./star.sh r R ../cbscenarios-star/deep/100/dependencies/program.star ../cbscenarios-star/deep/100/data/input.stream 

cd scripts
./cbconvert.sh 20 4 50 50 100
cd ..
echo "STAR --- 20 4 50 50 100"
./star.sh r R ../cbscenarios-star/deep/100/dependencies/program.star ../cbscenarios-star/deep/100/data/input.stream 

cd scripts
./cbconvert.sh 20 4 100 0 50
cd ..
echo "STAR --- 20 4 100 0 50"
./star.sh r R ../cbscenarios-star/deep/100/dependencies/program.star ../cbscenarios-star/deep/100/data/input.stream 

cd scripts
./cbconvert.sh 20 4 0 100 50
cd ..
echo "STAR --- 20 4 0 100 50"
./star.sh r R ../cbscenarios-star/deep/100/dependencies/program.star ../cbscenarios-star/deep/100/data/input.stream 

