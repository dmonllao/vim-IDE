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
--languages=FILETYPENAME \
--exclude=.git \
--totals=no \
--verbose=no \
--tag-relative=yes \
--FILETYPENAME-kinds=+cfi-v \
--regex-FILETYPENAME='/read_ctags_docs/' \
--regex-FILETYPENAME='/or_use_google_or_github/' \
`pwd` 2> /dev/null
