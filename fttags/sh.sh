#!/bin/sh

##
# The output filename comes as $1
#
# Redirects the usual warnings and errors to /dev/null
# and avoid all kind of verbosity
##

ctags \
-f $1 \
-R \
--languages=sh \
--exclude=.git \
--totals=no \
--verbose=no \
--tag-relative=yes \
--sh-kinds=+f \
`pwd` 2> /dev/null
