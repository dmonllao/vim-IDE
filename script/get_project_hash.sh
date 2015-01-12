#!/bin/sh

##
# Expects the language as $1 so each project has
# a hash per language.
##

# Depending on the OS.
if which md5sum 1> /dev/null ;  then
    command='md5sum'
else
    command='md5 -r'
fi

# File name depending on $PWD.
RAWPWDHASH=`$command <<EOF
"$1_$PWD"
EOF`
PWDHASH="${RAWPWDHASH%% *}"

# Tags file path.
TAGSFILE=~/.vim/tags/$PWDHASH

echo $TAGSFILE
