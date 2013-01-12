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
--languages=LANGUAGENAME \
--exclude=.git \
--totals=no \
--verbose=no \
--tag-relative=yes \
--LANGUAGENAME-kinds=+cfi-v \
--regex-LANGUAGENAME='/read_ctags_docs/' \
--regex-LANGUAGENAME='/or_use_google_or_github/' \
`pwd` 2> /dev/null
