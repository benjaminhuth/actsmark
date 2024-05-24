#!/bin/bash

THIS_SCRIPT=$(readlink -f $0)
THIS_DIR=$(dirname $THIS_DIR)

REPO=$1
BRANCH1=$2
BRANCH2=$3
SCRIPT=$4

$SCRIPT_DIR/build_and_run.sh $REPO $BRANCH1 $SCRIPT
$SCRIPT_DIR/build_and_run.sh $REPO $BRANCH2 $SCRIPT
