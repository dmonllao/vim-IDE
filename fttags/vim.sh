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
--languages=vim \
--exclude=.git \
--totals=no \
--verbose=no \
--tag-relative=yes \
--vim-kinds=+caf-v \
`pwd` 2> /dev/null
