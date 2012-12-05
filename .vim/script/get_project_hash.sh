#!/bin/sh

# File name depending on $PWD.
RAWPWDHASH=`md5sum <<EOF
$PWD
EOF`
PWDHASH="${RAWPWDHASH%% *}"

# Tags file path.
TAGSFILE=~/.vim/tags/$PWDHASH

echo $TAGSFILE
