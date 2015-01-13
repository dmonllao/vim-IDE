#!/bin/sh

##
# The output filename comes as $1
#
# Redirects the usual warnings and errors to /dev/null
# and avoid all kind of verbosity
#
# REPLACE FILETYPENAME FOR YOUR FILETYPE.
#
# * Supported ctags filetypes @see ctags --list-languages
# * FILETYPENAME-kinds values depends on the language
#   @see ctags --list-kinds
# * FILETYPENAME-regex Is optional
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
