#!/bin/bash -e
# Author: Bean Nguyen

TARGET=$1
shift
cmd="$@"

if [ "$TARGET" == "" ]; then
    >&2 echo "$TARGET mount is missing!"
    exit 1
fi

IS_MOUNTED=""
while [[ ($IS_MOUNTED != "TRUE") ]]; do
  IS_MOUNTED=$(grep -qs "$TARGET" /proc/mounts && echo TRUE || echo FALSE)
  >&2 echo "waiting for $TARGET to be available"
  sleep 1
done

exec $cmd