#!/bin/bash

find . | grep -i $1 | nl
find . | grep -i $1 | xargs -I file cp -v -r --parents file --target-directory=$2

echo ricerca finita.
exit 1;