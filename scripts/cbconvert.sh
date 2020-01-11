#!/bin/bash

mkdir -p ../../cbscenarios-star/deep/100/data/
mkdir -p ../../cbscenarios-star/deep/100/dependencies/
python cbparse.py S 5 ../../chasebench/scenarios/deep/100/data/ > ../../cbscenarios-star/deep/100/data/input.stream
python cbparse.py T 3 20 20 ../../chasebench/scenarios/deep/100/dependencies/ > ../../cbscenarios-star/deep/100/dependencies/program.star

mkdir -p ../../cbscenarios-star/correctness/tgds5/data/
mkdir -p ../../cbscenarios-star/correctness/tgds5/dependencies/
python cbparse.py S 5 ../../chasebench/scenarios/correctness/tgds5/data/ > ../../cbscenarios-star/correctness/tgds5/data/input.stream
python cbparse.py T 3 20 20 ../../chasebench/scenarios/correctness/tgds5/dependencies/ > ../../cbscenarios-star/correctness/tgds5/dependencies/program.star

mkdir -p ../../cbscenarios-star/correctness/weak/data/
mkdir -p ../../cbscenarios-star/correctness/weak/dependencies/
python cbparse.py S 5 ../../chasebench/scenarios/correctness/weak/data/ > ../../cbscenarios-star/correctness/weak/data/input.stream
python cbparse.py T 3 20 20 ../../chasebench/scenarios/correctness/weak/dependencies/ > ../../cbscenarios-star/correctness/weak/dependencies/program.star

mkdir -p ../../cbscenarios-star/correctness/tgds/data/
mkdir -p ../../cbscenarios-star/correctness/tgds/dependencies/
python cbparse.py S 5 ../../chasebench/scenarios/correctness/tgds/data/ > ../../cbscenarios-star/correctness/tgds/data/input.stream
python cbparse.py T 3 20 20 ../../chasebench/scenarios/correctness/tgds/dependencies/ > ../../cbscenarios-star/correctness/tgds/dependencies/program.star




