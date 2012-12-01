VIM config with IDE features to work on PHP projects

Features
========
* Project tree explorer
* File outline
* Quick jump to methods, classes, functions...
* phpDocumentor to create phpDoc comments blocks quickly
* Comment/uncomment lines quickly
* (Don't be scared by the time it takes the first time you open a file, is only the first time) :)

Requirements
============
* Only tested with VIM 7.3 but is supposed to work with VIM 6 and higher

Install
=======
* sudo apt-get install vim cscope exuberant-ctags
* Copy .vimrc and .vim/ contents to your home directory or "git clone https://github.com/dmonllao/vim-php-ide.git ~/"

Usage
=====
* cd /your/project/root
* vim the/file/you/want/to/open.php  (All PHP files in /your/project/root will be parsed to get the available definitions list)
* Jump to methods, classes or functions: Press <CTRL + PageUp> (to open horizontally) or <CTRL + PageDown> (to open vertically)
* Comment the current line: Press "<leader>cc" or "<leader>c<space>" to toogle the line comment (<leader> key is mapped to "\" by default)
* Check PHP syntax: Type ":make"
* To add phpDocs to a class, method or function: Go to the class/var/method/function definition line and press <CTRL + P>, you can overwrite the default values in ~/.vim/plugin/php-doc.vim
* To paste without indentation problems: Press <Ins> (Insert) key and CTRL+SHIFT+P
* To toggle the file outline: Press <F8>
* To toggle the tree explorer: Press <F7>

Dependencies & credits
======================

Dependencies are installed following the 'Install' steps, I got most of the code from different projects:
* http://cscope.sourceforge.net/
* http://ctags.sourceforge.net/
* https://github.com/scrooloose/nerdtree
* https://github.com/scrooloose/nerdcommenter
* https://github.com/vim-scripts/vtreeexplorer
* https://github.com/vim-scripts/taglist.vim
* https://github.com/tobyS/vip/blob/master/.vim/php-doc.vim

More info
=========
* phpDocumentor: https://github.com/tobyS/vip/blob/master/.vim/php-doc.vim
* Tag Browsing: http://vim-taglist.sourceforge.net/manual.html
* Jump to tags: http://cscope.sourceforge.net/cscope_vim_tutorial.html
* Tree explorer: https://github.com/scrooloose/nerdtree/blob/master/README.md
* Comment lines: https://github.com/scrooloose/nerdcommenter/blob/master/README.md

TODO
====
* Tags database loaded globally
* Use git submodules for the dependencies
* Think of what must be global and what local
