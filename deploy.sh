#!/bin/bash

APP_NAME="app"
DEPLOY_BASE=~/prod
VERSION1="$DEPLOY_BASE-v1"
VERSION2="$DEPLOY_BASE-v2"
CURRENT_LINK=~/prod

# Determine which version is active
if [ -L "$CURRENT_LINK" ] && [ "$(readlink $CURRENT_LINK)" = "$VERSION1" ]; then
    TARGET="$VERSION2"
else
    TARGET="$VERSION1"
fi

# Create/clear target dir
rm -rf "$TARGET"
mkdir -p "$TARGET"
cp -r /mnt/c/Users/kakha/Desktop/Devops\ Midterm\ Project/app "$TARGET/"

# Point symlink to new version
rm -f "$CURRENT_LINK"
ln -s "$TARGET" "$CURRENT_LINK"

echo "✅ Deployed to: $TARGET"
