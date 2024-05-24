#!/bin/bash

REPO=$1
BRANCH=$2
SCRIPT=$3

# 20 GB should be enough
cd $TMPDIR

ACTSMARK_DIR=actsmark$RANDOM
mkdir $ACTSMARK_DIR
cd $ACTSMARK_DIR

git clone $REPO src
cd src
git checkout $BRANCH

source CI/setup_cvmfs_lcg.sh

mkdir build
cd build

cmake .. \
	-G "Ninja" \
	-D CMAKE_BUILD_TYPE=Release \
	-D ACTS_BUILD_ODD=ON \
	-D ACTS_BUILD_FATRAS=ON \
	-D ACTS_BUILD_EXAMPLES_PYTHONBINDINGS=ON \
	-D ACTS_BUILD_EXAMPLES_GEANT4=ON \
	-D ACTS_BUILD_EXAMPLES_DD4HEP=ON \
	-D ACTS_BUILD_EXAMPLES_PYTHIA8=ON

if [ -n "ACTSMARK_DRYRUN" ]; then
    DRYRUN="-n"
fi

ninja -j2 $DRYRUN

source python/setup.sh

# Script doing what we want to test
# responsible to store output
bash $SCRIPT

rm -rf src
