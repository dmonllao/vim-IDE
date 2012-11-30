#!/bin/sh

# Tmp path to store the .php files list.
CSCOPELIST=/tmp/cscope_`date +%s`

# Lists all the PHP files of the project scope.
find $PWD/* -name '*.php' > $CSCOPELIST

# File name depending on $PWD.
PWDHASH=`md5sum <<EOF
$PWD
EOF`
CSCOPEOUT="${PWDHASH%% *}"

# Path to store the cscope references file.
# The name of the var is set as expected by cscope to load it.
CSCOPE_DB=~/.vim/cscope_databases/$CSCOPEOUT

# Creates cscope.out with the references list.
cscope -b -f $CSCOPE_DB $CSCOPELIST

# Delete tmp file.
rm $CSCOPELIST

echo $CSCOPE_DB
