#!/bin/sh

# File name depending on $PWD.
RAWPWDHASH=`md5sum <<EOF
$PWD
EOF`
PWDHASH="${RAWPWDHASH%% *}"

# Tags file path.
TAGSFILE=~/.vim/tags/$PWDHASH

# Lists project tags.
ctags-exuberant \
-f $TAGSFILE \
-R \
--languages=php \
--exclude=.git \
--totals=no \
--verbose=no \
--tag-relative=yes \
--PHP-kinds=+cfi-v \
--regex-PHP='/abstract\s+class\s+([^ ]+)/\1/c/' \
--regex-PHP='/interface\s+([^ ]+)/\1/i/' \
--regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/'`pwd` \
 &> /dev/null

echo $TAGSFILE
