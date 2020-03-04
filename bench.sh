#!/bin/bash

# input streams generated using:
# scripts/all_gen_bench.sh

# ============================================================================
./star.sh b
echo ""
echo "STAR - Semantic Time-Aware Reasoner powered by LASER++ "
echo ""
# ============================================================================

echo "============= 1. LARS - formulas ============="
./star.sh r O extra/atom.star ../data/stream_1k_1k_1_2.txt
./star.sh r O extra/box_w32.star ../data/stream_1k_1k_1_2.txt
./star.sh r O extra/diamond_w32.star ../data/stream_1k_1k_1_2.txt
./star.sh r O extra/conjunction.star ../data/stream_1k_1k_2_2.txt

echo "============= 2. LARS - Math ============="
./star.sh r O extra/condition.star ../data/stream_100_100_1_2.txt

 
#echo "============= 3. LARS - Laser++ Window Size ============="
#./star.sh r O extra/problem_w08.star ../data/stream_1k_1k_2_2.txt 
#./star.sh r O extra/problem_w16.star ../data/stream_1k_1k_2_2.txt 
#./star.sh r O extra/problem_w32.star ../data/stream_1k_1k_2_2.txt
#./star.sh r O extra/problem_w64.star ../data/stream_1k_1k_2_2.txt

#echo "============= 4. LARS - Flow Rate ============="
#./star.sh r O extra/problem_w32.star ../data/stream_10_100_2_2.txt
#./star.sh r O extra/problem_w32.star ../data/stream_10_1k_2_2.txt
#./star.sh r O extra/problem_w32.star ../data/stream_10_10k_2_2.txt
#./star.sh r O extra/problem_w32.star ../data/stream_10_100k_2_2.txt

# ============================================================================

echo "============= XX. Types of programs ============="
./star.sh r O extra/problem_w64.star ../data/stream_1k_1k_2_2.txt
./star.sh r O extra/traffic_w64.star ../data/stream_1k_1k_2_2.txt
./star.sh r O extra/snow_w64.star ../data/stream_1k_1k_2_2.txt

#./star.sh r O extra/problem_w64.star ../data/stream_100_1k_2_2.txt
#./star.sh r O extra/traffic_w64.star ../data/stream_100_1k_2_2.txt
#./star.sh r O extra/snow_w64.star ../data/stream_100_1k_2_2.txt
#./star.sh r O extra/diamond_w64.star ../data/stream_100_1k_2_2.txt

# XX. Misc 
#./star.sh r O extra/algebra.star ../data/stream_1k_1k_1_2.txt

# Correctness check
#./star.sh r O extra/algebra.star ../data/stream_3_6_1_2.txt out.txt
#cat out.txt
#./star.sh r O extra/condition.star ../data/stream_3_6_1_2.txt out.txt
#cat out.txt
#./star.sh r O extra/problem_w64.star ../data/stream_3_6_2_2.txt out.txt
#cat out.txt
#./star.sh r O extra/snow_w64.star ../data/stream_3_6_2_2.txt out.txt
#cat out.txt
#./star.sh r O extra/traffic_w64.star ../data/stream_3_6_2_2.txt out.txt
#cat out.txt

