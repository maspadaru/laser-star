#!/bin/bash

TIME=$1
WINDOW=$2
BOX=$3
DIAMOND=$4
EVENT=$5


# === Deep ===

mkdir -p ../cbscenarios-star/deep/100/data/
mkdir -p ../cbscenarios-star/deep/100/dependencies/
python scripts/cbparse.py S $TIME ../chasebench/scenarios/deep/100/data/ > ../cbscenarios-star/deep/100/data/input.stream
python scripts/cbparse.py T $WINDOW $BOX $DIAMOND $EVENT ../chasebench/scenarios/deep/100/dependencies/ > ../cbscenarios-star/deep/100/dependencies/program.star


mkdir -p ../cbscenarios-star/deep/200/data/
mkdir -p ../cbscenarios-star/deep/200/dependencies/
python scripts/cbparse.py S $TIME ../chasebench/scenarios/deep/200/data/ > ../cbscenarios-star/deep/200/data/input.stream
python scripts/cbparse.py T $WINDOW $BOX $DIAMOND $EVENT ../chasebench/scenarios/deep/200/dependencies/ > ../cbscenarios-star/deep/200/dependencies/program.star



# === LUBM ==

#mkdir -p ../cbscenarios-star/LUBM/data/001/
#mkdir -p ../cbscenarios-star/LUBM/dependencies/
#python scripts/cbparse.py S $TIME ../chasebench/scenarios/LUBM/data/001/ > ../cbscenarios-star/LUBM/data/001/input.stream
#python cbparse.py T $WINDOW $BOX $DIAMOND $EVENT ../chasebench/scenarios/LUBM/dependencies/ > ../cbscenarios-star/LUBM/dependencies/program.star


# === Correctnes scenarios ===

#mkdir -p ../../cbscenarios-star/correctness/tgds5/data/
#mkdir -p ../../cbscenarios-star/correctness/tgds5/dependencies/
#python cbparse.py S $TIME ../../chasebench/scenarios/correctness/tgds5/data/ > ../../cbscenarios-star/correctness/tgds5/data/input.stream
#python cbparse.py T $WINDOW $BOX $DIAMOND $EVENT ../../chasebench/scenarios/correctness/tgds5/dependencies/ > ../../cbscenarios-star/correctness/tgds5/dependencies/program.star

#mkdir -p ../../cbscenarios-star/correctness/weak/data/
#mkdir -p ../../cbscenarios-star/correctness/weak/dependencies/
#python cbparse.py S $TIME ../../chasebench/scenarios/correctness/weak/data/ > ../../cbscenarios-star/correctness/weak/data/input.stream
#python cbparse.py T $WINDOW $BOX $DIAMOND $EVENT ../../chasebench/scenarios/correctness/weak/dependencies/ > ../../cbscenarios-star/correctness/weak/dependencies/program.star

#mkdir -p ../../cbscenarios-star/correctness/tgds/data/
#mkdir -p ../../cbscenarios-star/correctness/tgds/dependencies/
#python cbparse.py S $TIME ../../chasebench/scenarios/correctness/tgds/data/ > ../../cbscenarios-star/correctness/tgds/data/input.stream
#python cbparse.py T $WINDOW $BOX $DIAMOND $EVENT ../../chasebench/scenarios/correctness/tgds/dependencies/ > ../../cbscenarios-star/correctness/tgds/dependencies/program.star




