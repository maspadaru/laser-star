#!/bin/bash

mkdir -p ../../cbscenarios-star/deep/100/data/
mkdir -p ../../cbscenarios-star/deep/100/dependencies/

python cbparse.py S 5 ../../chasebench/scenarios/deep/100/data/ > ../../cbscenarios-star/deep/100/data/deep.stream
python cbparse.py T 3 20 20 ../../chasebench/scenarios/deep/100/dependencies/ > ../../cbscenarios-star/deep/100/dependencies/deep_100.star
