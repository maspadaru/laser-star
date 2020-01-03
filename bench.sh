#!/bin/bash

# input streams generated using:
# scripts/all_gen.sh

# ============================================================================
./star.sh b
# ============================================================================

# 1 Laser - Laser++ Window Size 
./star.sh r O extra/problem_w08.star ../data/stream_1k_1k_2_2.txt 
./star.sh r O extra/problem_w16.star ../data/stream_1k_1k_2_2.txt 
./star.sh r O extra/problem_w32.star ../data/stream_1k_1k_2_2.txt
./star.sh r O extra/problem_w64.star ../data/stream_1k_1k_2_2.txt

