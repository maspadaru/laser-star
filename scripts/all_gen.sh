#!/bin/bash

mkdir -p ../../data 

pypy gen.py 1000 100000 1 2 > ../../data/stream_1k_100k_1_2.txt
pypy gen.py 1000 1000 1 2 > ../../data/stream_1k_1k_1_2.txt
pypy gen.py 1000 10000 1 1 > ../../data/stream_1k_10k_1_1.txt
pypy gen.py 1000 10000 1 2 > ../../data/stream_1k_10k_1_2.txt
pypy gen.py 1000 10000 1 4 > ../../data/stream_1k_10k_1_4.txt
pypy gen.py 1000 10000 1 8 > ../../data/stream_1k_10k_1_8.txt
pypy gen.py 1000 1000 2 2 > ../../data/stream_1k_1k_2_2.txt
pypy gen.py 1000 1000 3 1 > ../../data/stream_1k_1k_3_1.txt
pypy gen.py 1000 1000 3 2 > ../../data/stream_1k_1k_3_2.txt
pypy gen.py 1000 1000 4 2 > ../../data/stream_1k_1k_4_2.txt
pypy gen.py 1000 1000 8 2 > ../../data/stream_1k_1k_8_2.txt
pypy gen.py 1000 1000 2 1 > ../../data/stream_1k_1k_2_1.txt
pypy gen.py 1000 1000 2 4 > ../../data/stream_1k_1k_2_4.txt
pypy gen.py 1000 1000 2 8 > ../../data/stream_1k_1k_2_8.txt
pypy gen.py 1000 100 2 2 > ../../data/stream_1k_100_2_2.txt
pypy gen.py 1000 10000 2 2 > ../../data/stream_1k_10k_2_2.txt
pypy gen.py 1000 100000 2 2 > ../../data/stream_1k_100k_2_2.txt
pypy gen.py 10000 1000 2 2 > ../../data/stream_10k_1k_2_2.txt
pypy gen.py 100000 1000 2 2 > ../../data/stream_100k_1k_2_2.txt
