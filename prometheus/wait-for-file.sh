#!/bin/bash -e
# Author: Bean Nguyen

TARGET=$1
shift
cmd="$@"

if [ "$TARGET" == "" ]; then
    >&2 echo "Target file is missing!"
    exit 1
fi

while [ ! -f "$TARGET" ]
do
  >&2 echo "waiting for $TARGET to be available"
  sleep 1
done

exec $cmd