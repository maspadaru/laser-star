#!/bin/bash

# ============================================================================
cd ..
cd scripts

mkdir -p ../../data 

pypy gen_bench.py 10 200000 2 4 > ../../data/stream_10_200k_2_4.txt
pypy gen_bench.py 10 300000 3 4 > ../../data/stream_10_300k_3_4.txt
pypy gen_bench.py 10 400000 4 4 > ../../data/stream_10_400k_4_4.txt

pypy gen_bench.py 1000 2000 2 2 > ../../data/stream_1k_2k_2_2.txt
pypy gen_bench.py 1000 3000 3 2 > ../../data/stream_1k_3k_3_2.txt
pypy gen_bench.py 1000 4000 4 2 > ../../data/stream_1k_4k_4_2.txt

pypy gen_bench.py 10 2000 2 4 > ../../data/stream_10_2k_2_4.txt
pypy gen_bench.py 10 4000 4 4 > ../../data/stream_10_4k_4_4.txt
pypy gen_bench.py 10 400 4 4 > ../../data/stream_10_400_4_4.txt

cd ..

# ============================================================================
./star.sh b
# ============================================================================

./star.sh r O extra/conjunction_2.star ../data/stream_10_200k_2_4.txt
./star.sh r O extra/conjunction_3.star ../data/stream_10_300k_3_4.txt
./star.sh r O extra/conjunction_4.star ../data/stream_10_400k_4_4.txt

./star.sh r O extra/conjunction_2_d_w32.star ../data/stream_1k_2k_2_2.txt
./star.sh r O extra/conjunction_3_d_w32.star ../data/stream_1k_3k_3_2.txt
./star.sh r O extra/conjunction_4_d_w32.star ../data/stream_1k_4k_4_2.txt

./star.sh r O extra/conjunction_2n.star ../data/stream_10_2k_2_4.txt
# this test will oom 
#./star.sh r O extra/conjunction_4n.star ../data/stream_10_4k_4_4.txt
./star.sh r O extra/conjunction_4n.star ../data/stream_10_400_4_4.txt

# ============================================================================

PROGRAM="../cbscenarios-star/deep/100/dependencies/program.star"
INPUT="../cbscenarios-star/deep/100/data/input.stream"

PARAM="40 5 50 50 0"
echo "STAR --- $PARAM"
scripts/cbconvert.sh $PARAM
./star.sh r R $PROGRAM $INPUT

PARAM="40 5 50 50 100"
echo "STAR --- $PARAM"
scripts/cbconvert.sh $PARAM
./star.sh r R $PROGRAM $INPUT

# ============================================================================

