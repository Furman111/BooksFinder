#!/bin/bash
set -e
echo "*******************************"
echo   "Running git pre-commit hook"
echo "*******************************"

git stash -q --keep-index

./gradlew lintDebug


RESULT=$?

git stash pop -q

# return 1 exit code if running checks fails
[ $RESULT -ne 0 ] && exit 1
exit 0