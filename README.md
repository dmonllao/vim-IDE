Configuration and plugins to work with Vim on projects like slow Java-based IDEs does. Uses pathogen to allow more languages to be added easily.

Features
========
* Project explorer
* File outline
* Jump to methods, classes, functions...
* Comment/uncomment lines quickly
* Integrated with git at project-level repository
* Project level find (git grep)
* (Don't be scared by the time it takes the first time you open a file, is gathering the project references and is only the first time) :)

Requirements
============
* Only tested with Vim 7.3 but is supposed to work with Vim 7 and higher

Install
=======
* sudo apt-get install Vim exuberant-ctags (also works without ctags, but without quick jump nor file outline)
* Backup your /home/YOURUSER/.vimrc and your /home/YOURUSER/.vim
* Run the following in CLI
    * cd ~/.vim
    * git clone https://github.com/dmonllao/IDE.vim .
    * ln -s ~/.vim/.vimrc ~/.vimrc
    * git submodule init
    * git submodule update

Options
=======
* ":IDEOpen" to add IDE features
* ":IDEClose" to return to regular file edition
* ":IDERebuildTags" to rebuild the project tags (get the filetype from the current window)
* Add "let g:IDEAlways = 1" to the lowest part of ~/.vim/.vimrc if you want to use the IDE mode for all files opened with Vim

Fully supported languages
=========================
* PHP

Languages can be easily added, more info in next section.

Adding new languages
====================
* Create the filetype specifics in ftplugin/FILETYPENAME.vim as usual or include a language-specific plugin as submodule in bundle/
* Add a line with "autocmd vimenter * IDEOpen" in your ftplugin/FILETYPENAME.vim if you want to add IDE features
* Create a fttags/FILETYPENAME.sh to write the ctags command, you can use fttags/template.sh as template

Usage
=====
* cd /your/project/root
* vim the/file/you/want/to/open  (All files in /your/project/root will be parsed to get the available tags)
* Jump to methods, classes or functions: Hover the method, class or function name and press \<CTRL + i\> (to open the definitions splitting the window horizontally) or \<CTRL + v\> (to split it vertically)
* Open a file from the project explorer: Press intro to open it in the main window, "s" to open it splitting the screen vertically or "i" to split it horizontally
* Comment the current line: Press "\<leader\>cc" or "\<leader\>c\<space\>" to toogle the line comment (\<leader\> key is mapped to "\" by default)
* Check syntax: Type ":make"
* To paste without indentation problems: Press \<F9\> and CTRL+SHIFT+P
* To toggle the file outline: Press \<F8\>
* To toggle the project explorer: Press \<F7\>

Vim quick info
==============
* Enter 'Insert' mode with 'i' to edit text
* In 'Normal' mode press ':' to use the Vim command line
* Navigate through windows \<CTRL + w\> and \<Up\>, \<Down\>, \<Left\> or \<Right\> depending on where is the window you want to focus
* Copy & paste: Enter to 'visual' mode with "V", highlight code and press 'y' when you are happy with the selection, then paste with 'p'
* Create a new file splitting the current window ":sp /path/to/new/file"

More info / Dependencies / credits
======================

Dependencies are installed following the 'Install' section steps. Most of the project features are part of different plugins, only the basics are explained here; refer to them for more info / options / maps / commands.

* https://github.com/scrooloose/nerdtree (Project explorer)
* https://github.com/scrooloose/nerdcommenter (Code commenter)
* https://github.com/vim-scripts/taglist.vim (File outline)
* https://github.com/tobyS/vip/blob/master/.vim/php-doc.vim (PHP documentor)
* https://github.com/tpope/vim-fugitive (Git & grep)
* https://github.com/nanotech/jellybeans.vim (Styles)
* https://github.com/tpope/vim-pathogen
* http://ctags.sourceforge.net/
