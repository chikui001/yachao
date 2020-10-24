#!/bin/sh
cd "$(dirname $0)/../" || exit 1
WORK_DIR=$(pwd)

# startup
sh "$WORK_DIR"/bin/internal/startup.sh test