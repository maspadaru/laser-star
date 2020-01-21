#!/bin/bash

# ============================================================================
./star.sh b
# ============================================================================

PROGRAM="../cbscenarios-star/deep/100/dependencies/program.star"
INPUT="../cbscenarios-star/deep/100/data/input.stream"

echo " "
echo " "
echo " ===================== VS VLog ========================= "
echo " "
echo " "

PARAM="3 3 50 50 0"
echo "STAR --- $PARAM"
scripts/cbconvert.sh $PARAM
./star.sh r R $PROGRAM $INPUT

PARAM="3 3 50 50 50"
echo "STAR --- $PARAM"
scripts/cbconvert.sh $PARAM
./star.sh r R $PROGRAM $INPUT

#PARAM="7 3 50 50 50"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r R $PROGRAM $INPUT

#PARAM="7 5 50 50 50"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r R $PROGRAM $INPUT

#echo " "
#echo " "
#echo " ===================== SKOLEM ========================= "
#echo " "
#echo " "

#PARAM="20 1 50 50 0"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r S $PROGRAM $INPUT

#PARAM="20 3 50 50 0"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r S $PROGRAM $INPUT

#PARAM="20 5 50 50 0"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r S $PROGRAM $INPUT

#PARAM="20 10 50 50 0"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r S $PROGRAM $INPUT

#PARAM="20 1 50 50 50"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r S $PROGRAM $INPUT

#PARAM="20 3 50 50 50"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r S $PROGRAM $INPUT

#PARAM="20 5 50 50 50"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r S $PROGRAM $INPUT

#PARAM="20 10 50 50 50"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r S $PROGRAM $INPUT

#PARAM="20 1 50 50 100"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r S $PROGRAM $INPUT

#PARAM="20 3 50 50 100"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r S $PROGRAM $INPUT

#PARAM="20 5 50 50 100"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r S $PROGRAM $INPUT

#PARAM="20 10 50 50 100"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r S $PROGRAM $INPUT


#echo " "
#echo " "
#echo " ===================== RESTRICTED ========================= "
#echo " "
#echo " "

#PARAM="20 1 50 50 0"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r R $PROGRAM $INPUT

#PARAM="20 3 50 50 0"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r R $PROGRAM $INPUT

#PARAM="20 5 50 50 0"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r R $PROGRAM $INPUT

#PARAM="20 10 50 50 0"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r R $PROGRAM $INPUT

#PARAM="20 1 50 50 50"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r R $PROGRAM $INPUT

#PARAM="20 3 50 50 50"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r R $PROGRAM $INPUT

#PARAM="20 5 50 50 50"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r R $PROGRAM $INPUT

#PARAM="20 10 50 50 50"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r R $PROGRAM $INPUT

#PARAM="20 1 50 50 100"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r R $PROGRAM $INPUT

#PARAM="20 3 50 50 100"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r R $PROGRAM $INPUT

#PARAM="20 5 50 50 100"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r R $PROGRAM $INPUT

#PARAM="20 10 50 50 100"
#echo "STAR --- $PARAM"
#scripts/cbconvert.sh $PARAM
#./star.sh r R $PROGRAM $INPUT
