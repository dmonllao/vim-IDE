VIM configuration for PHP development

Features
========
* Quick jump to methods, classes, functions...
* File methods, classes, functions outline
* phpDocumentor
* Don't be scared by the time it takes the first time you open a file, is only the first time

Limitations
===========
* The list of methods, classes and functions available is obtained from the current working directory so if you want to navigate through all your project definitions you have to run VIM from your project root folder.

Requirements
============
* Only tested with VIM 7.3 but is supposed to work with VIM 6 and higher

Install
=======
* sudo apt-get install vim cscope exuberant-ctags
* Copy .vimrc and .vim/ contents to your home directory or "git clone https://github.com/dmonllao/vim-php-tags.git ~/"

Usage
=====
* cd /to/your/project/root
* vim the/file/you/want/to/open.php  (this way all /to/your/project/root contents will be added to the definitions list)
* To add phpDocs to a class, method or function: Go to the class/var/method/function definition line and press <CTRL + P>, you can overwrite the default values in ~/.vim/plugin/php-doc.vim
* To toggle the current file definitions list (methods, classes, functions and vars): Press <F8> to switch on/off
* Jump to methods, classes or functions: Press <CTRL + PageUp> (to open horizontally) or <CTRL + PageDown> (to open vertically)
* Check PHP syntax: Type ":make"
* To paste without indentation problems: Press <Ins> (Insert) key and CTRL+SHIFT+P

Dependencies & credits
======================

All this dependencies are installed following the 'Install' steps:
* http://cscope.sourceforge.net/
* http://ctags.sourceforge.net/
* https://github.com/vim-scripts/taglist.vim
* https://github.com/tobyS/vip/blob/master/.vim/php-doc.vim

More info
=========
* phpDocumentor: https://github.com/tobyS/vip/blob/master/.vim/php-doc.vim
* Tag Browsing: http://vim-taglist.sourceforge.net/manual.html
* Jump to tags: http://cscope.sourceforge.net/cscope_vim_tutorial.html

TODO
====
* Tags database loaded globally
* Add .gitignore
