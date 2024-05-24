#!/bin/bash

THIS_SCRIPT=$(readlink -f $0)
THIS_DIR=$(dirname $THIS_SCRIPT)

REPO=$1
BRANCH1=$2
BRANCH2=$3
SCRIPT=$4

bash $THIS_DIR/build_and_run.sh $REPO $BRANCH1 $SCRIPT
bash $THIS_DIR/build_and_run.sh $REPO $BRANCH2 $SCRIPT
