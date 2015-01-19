#!/bin/sh

##
# Expects the filename as $1
##

# Lists project tags.
# Redirects the usual warnings and errors to /dev/null
ctags \
-f $1 \
-R \
--languages=php \
--exclude=.git \
--totals=no \
--verbose=no \
--tag-relative=yes \
--PHP-kinds=+cfi-v \
--regex-PHP='/abstract\s+class\s+([^ ]+)/\1/c/' \
--regex-PHP='/interface\s+([^ ]+)/\1/i/' \
--regex-PHP='/(public |static |abstract |protected |private )+\s+function\s+([^ (]*)/\2/f/' `pwd` 2> /dev/null
