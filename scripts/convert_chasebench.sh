#!/bin/bash

mkdir -p ../../laser-chasebench/deep/100/data/
mkdir -p ../../laser-chasebench/deep/100/dependencies/
python cbparse.py D 5 ../../chasebench/scenarios/deep/100/data/ > ../../laser-chasebench/deep/100/data/deep.stream
python cbparse.py T 3 20 20 ../../chasebench/scenarios/deep/100/dependencies/ > ../../laser-chasebench/deep/100/dependencies/deep_100.star

