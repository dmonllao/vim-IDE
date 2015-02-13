#!/bin/sh

##
# The output filename comes as $1
##

ctags \
-f $1 \
-R \
--languages=javascript \
--exclude=.git \
--exclude=*min.js \
--exclude=*debug.js  \
--totals=no \
--verbose=no \
--tag-relative=yes \
--javascript-kinds=+cfm-pv \
--regex-javascript="/(,|(;|^)[ \t]*(var|let|([A-Za-z_$][A-Za-z0-9_$.]+\.)*))[ \t]*([A-Za-z0-9_$]+)[ \t]*=[ \t]*\{/\5/,object/" \
--regex-javascript="/(,|(;|^)[ \t]*(var|let|([A-Za-z_$][A-Za-z0-9_$.]+\.)*))[ \t]*([A-Za-z0-9_$]+)[ \t]*=[ \t]*function[ \t]*\(/\5/,function/" \
--regex-javascript="/function[ \t]+([A-Za-z0-9_$]+)[ \t]*\([^)]*\)/\1/,function/" \
--regex-javascript="/(,|^)[ \t]*([A-Za-z_$][A-Za-z0-9_$]+)[ \t]*:[ \t]*\{/\2/,object/" \
--regex-javascript="/(,|^)[ \t]*([A-Za-z_$][A-Za-z0-9_$]+)[ \t]*:[ \t]*function[ \t]*\(/\2/,function/" \
`pwd` 2> /dev/null
