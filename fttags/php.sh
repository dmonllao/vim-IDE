#!/bin/sh

##
# Expects the filename as $1
##

# Lists project tags.
# Redirects the usual warnings and errors to /dev/null

# Better support using universal ctags, although ctags also work (no namespaced stuff).
ctags \
-f $1 \
-R \
--languages=php \
--exclude=.git \
--totals=no \
--verbose=no \
--tag-relative=yes \
--PHP-kinds=+cdfint-v \
--fields=+aimS \
`pwd` 2> /dev/null
