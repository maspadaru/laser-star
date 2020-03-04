#!/bin/bash

mkdir -p ../../data 

pypy gen_bench.py 1000 1000 1 2 > ../../data/stream_1k_1k_1_2.txt
pypy gen_bench.py 100 100 1 2 > ../../data/stream_100_100_1_2.txt
pypy gen_bench.py 100 1000 1 2 > ../../data/stream_100_1k_1_2.txt
pypy gen_bench.py 1000 1000 2 2 > ../../data/stream_1k_1k_2_2.txt
pypy gen_bench.py 10 100 2 2 > ../../data/stream_10_100_2_2.txt
pypy gen_bench.py 10 1000 2 2 > ../../data/stream_10_1k_2_2.txt
pypy gen_bench.py 10 10000 2 2 > ../../data/stream_10_10k_2_2.txt
pypy gen_bench.py 10 100000 2 2 > ../../data/stream_10_100k_2_2.txt
pypy gen_bench.py 100 1000 2 2 > ../../data/stream_100_1k_2_2.txt
pypy gen_bench.py 3 6 1 2 > ../../data/stream_3_6_1_2.txt
pypy gen_bench.py 3 6 2 2 > ../../data/stream_3_6_2_2.txt
