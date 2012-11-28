#!/bin/sh

# Lists all the PHP files of the project and
find $PWD/* -name '*.php' > $PWD/cscope.files

# Creates cscope.out with the definitions list
cscope -b
rm ./cscope.files
