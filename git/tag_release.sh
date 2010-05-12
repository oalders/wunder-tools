#!/bin/sh

# It's totally lame, but for some reason I have trouble remembering 
# the correct git tagging syntax, and using a script means I don't screw
# it up or have to look it up somewhere.

if [ $# -ne 1 ]
then
echo "
$0 : Usage: sh tag_release.sh [v0.08|v0.09|etc]
"
exit 1
fi

git tag -am "$1" $1
git push --tags
