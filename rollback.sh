#!/bin/bash

DEPLOY1=~/prod-v1
DEPLOY2=~/prod-v2
CURRENT=~/prod

if [ "$(readlink $CURRENT)" = "$DEPLOY1" ]; then
    ln -snf $DEPLOY2 $CURRENT
    echo "🔁 Rolled back to: $DEPLOY2"
else
    ln -snf $DEPLOY1 $CURRENT
    echo "🔁 Rolled back to: $DEPLOY1"
fi

