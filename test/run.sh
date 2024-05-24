#!/bin/bash

THIS_SCRIPT=$(readlink -f $0)
THIS_DIR=$(dirname $THIS_SCRIPT)

python3 $THIS_DIR/../scripts/full_chain_perf.py --ttbar
