#!/bin/sh

# Depending on the OS.
if which md5sum 1> /dev/null ;  then
    command='md5sum'
else
    command='md5 -r'
fi

# File name depending on $PWD.
RAWPWDHASH=`$command <<EOF
$PWD
EOF`
PWDHASH="${RAWPWDHASH%% *}"

# Tags file path.
TAGSFILE=~/.vim/tags/$PWDHASH

echo $TAGSFILE
