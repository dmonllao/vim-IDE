VIM config with IDE features to work on PHP projects

Features
========
* Project explorer
* File outline
* Quick jump to methods, classes, functions...
* phpDocumentor to create phpDoc comments blocks quickly
* Comment/uncomment lines quickly
* (Don't be scared by the time it takes the first time you open a file, is gathering the project references and is only the first time) :)

Requirements
============
* Only tested with VIM 7.3 but is supposed to work with VIM 7 and higher

Install
=======
* sudo apt-get install vim exuberant-ctags (also works without ctags, but without quick jump nor file outline)
* Backup your /home/YOURUSER/.vimrc and your /home/YOURUSER/.vim
* Download the .zip file from https://github.com/dmonllao/vim-php-ide/archive/master.zip or "git clone https://github.com/dmonllao/vim-php-ide.git" into /home/YOURUSER/.vim/ 
* Run "ln -s ~/.vim/.vimrc ~/.vimrc" to link .vimrc to your user home directory

Usage
=====
* cd /your/project/root
* vim the/file/you/want/to/open.php  (All PHP files in /your/project/root will be parsed to get the available tags)
* Jump to methods, classes or functions: Press \<CTRL + PageUp\> (to open horizontally) or \<CTRL + PageDown\> (to open vertically)
* Open a file from the project explorer: Press intro to open it in the main window, "s" to open it splitting the screen vertically or "i" to split it horizontally
* Comment the current line: Press "\<leader\>cc" or "\<leader\>c\<space\>" to toogle the line comment (\<leader\> key is mapped to "\" by default)
* Check PHP syntax: Type ":make"
* To add phpDocs to a class, method or function: Go to the class/var/method/function definition line and press \<CTRL + P\>, you can overwrite the default values in ~/.vim/plugin/php-doc.vim
* To paste without indentation problems: Press \<Ins\> (Insert) key and CTRL+SHIFT+P
* To toggle the file outline: Press \<F8\>
* To toggle the project explorer: Press \<F7\>

VIM quick info
==============
* Enter 'Insert' mode with 'i' to edit text
* In 'Normal' mode press ':' to use the vim command line
* Navigate through windows \<CTRL + w\> and \<Up\>, \<Down\>, \<Left\> or \<Right\> depending on where is the window you want to focus
* Copy & paste: Enter to 'visual' mode with "V", highlight code and press 'y' when you are happy with the selection, then paste with 'p'
* Create a new file splitting the current window ":sp /path/to/new/file"

Dependencies & credits
======================

Dependencies are installed following the 'Install' steps, I got most of the code from different projects:
* http://ctags.sourceforge.net/
* https://github.com/scrooloose/nerdtree
* https://github.com/scrooloose/nerdcommenter
* https://github.com/vim-scripts/vtreeexplorer
* https://github.com/vim-scripts/taglist.vim
* https://github.com/tobyS/vip/blob/master/.vim/php-doc.vim
* https://github.com/nanotech/jellybeans.vim

More info
=========
* phpDocumentor: https://github.com/tobyS/vip/blob/master/.vim/php-doc.vim
* Tag Browsing: http://vim-taglist.sourceforge.net/manual.html
* Project explorer: https://github.com/scrooloose/nerdtree/blob/master/README.md
* Comment lines: https://github.com/scrooloose/nerdcommenter/blob/master/README.md
