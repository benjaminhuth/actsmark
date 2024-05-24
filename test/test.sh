#!/bin/bash

export TMPDIR=/tmp
export ACTSMARK_DRYRUN=1
bash ../scripts/run_comparison.sh https://github.com/acts-project/acts main main $PWD/run.sh
