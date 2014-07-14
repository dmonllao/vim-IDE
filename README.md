Configuration and plugins to work with Vim on projects like slow Java-based IDEs does.

The aim is to use the same project-oriented base (project explorer, file outline, jump to methods, git, global search...) but allowing Vim to behave differently depending on the programming language used, also allowing other language-specific plugins and all sort of user customizations.

By default the Vim-IDE mode is only auto enabled in the supported languages, read "Add new languages" section for further info.

Uses pathogen to allow more plugins and languages to be added easily and ctags for project-scope definitions jumps.

Features
========
* Project explorer
* File outline
* Omni-completion
* Jump to methods, classes, functions...
* Syntax highlighting
* Comment/uncomment lines quickly
* Integrated with git at project-level repository
* Project level search (git grep)
* Auto-completion of quotes, parenthesis...
* (Don't be scared by the time it takes the first time you open a file, is gathering the project references and is only the first time) :)

Requirements
============
* Only tested with Vim 7.3 and higher

Install
=======
* sudo apt-get install vim exuberant-ctags (also works without ctags, but without quick jump nor file outline)
* Backup your /home/YOURUSER/.vimrc and your /home/YOURUSER/.vim
* Run the following in CLI
    * *cd ~/.vim*
    * *git clone git://github.com/dmonllao/vim-IDE.git .*
    * *ln -s ~/.vim/.vimrc ~/.vimrc*
    * *git submodule init*
    * *git submodule update*
* Copy/add your own .vimrc rules and overrides to ~/.vim/custom.vim, more info in ~/.vim/custom.vim.dist; note
  that your settings may conflict with the ones set by vim-IDE.

Options
=======
There are many vim-IDE features to customize. As mentioned above, you can set your own preferences and extensions,
the same with the vim-IDE features, you can set them in ~/.vim/custom.vim, which you can create from ~/.vim/custom.vim.dist

Read ~/.vim/custom.vim.dist for further info about the following IDE options:

* ":IDEOpen" to add IDE features
* ":IDEClose" to return to normal Vim file edition mode
* ":IDERebuildTags" to rebuild the project tags (gets the filetype from the current window)
* "let g:IDEAlways" if you want to use the IDE mode for all files opened with Vim
* "let g:IDEOnlyEditor" if you want only want to display the editor window
* "let g:IDESplitWindowKey" to redefine which key opens a file splitting the window horizontally, defaults to "c"
* "let g:IDEVSplitWindowKey" to redefine which key opens a file splitting the window vertically, defaults to "f"
* "let g:IDEOpenCurrentWindowKey" to redefine which key opens a file in the current window, defaults to "a"
* "let g:IDENERDTreeToggleKey" to redefine the key to toggle the project explorer window, defaults to "F7"
* "let g:IDETagListToggleKey" to redefine the key to toggle the file outline window, defaults to "F8"
* "let g:IDEPasteModeKey" to redefine the key to enter to "paste mode", defaults to "F9"


Fully supported languages
=========================
* PHP

Languages can be easily added, more info in next section. All contributions will be greatly appreciated :)

Adding new languages
====================
* Create the filetype specifics in ftplugin/FILETYPENAME.vim as usual or include a language-specific plugin as submodule in bundle/
* Add a line with "autocmd vimenter * IDEOpen" in your ftplugin/FILETYPENAME.vim if you want to add IDE features
* Create a fttags/FILETYPENAME.sh to write the ctags command, you can use fttags/template.sh as template

Usage
=====
* cd /your/project/root
* vim the/file/you/want/to/open  (All files in /your/project/root will be parsed to get the available tags)
* Jump to methods, classes or functions: Hover the method, class or function name and press \<CTRL + c\> to open the definition splitting the window horizontally, \<CTRL + f\> to split it vertically or \<CTRL + a\> to open it on the current window
* Auto-complete: Press Tab key in Insert mode
* Open a file from the project explorer: Same key mappings, Press "c" to open it splitting the screen horizontally, "f" to split it vertically and "a" to open it on the current window
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
* Paste code from another application: Enter paste mode (\<F9\>) and CTRL + SHIFT + P
* Create a new file splitting the current window ":sp /path/to/new/file" for horizontally and ":vsp /path/to/new/file" for vertically

More info / Dependencies / credits
======================

Dependencies are installed following the 'Install' section steps. Most of the project features are part of different plugins, only the basics are explained here; refer to them for more info / options / maps / commands.

* https://github.com/scrooloose/nerdtree (Project explorer)
* https://github.com/scrooloose/nerdcommenter (Code commenter)
* https://github.com/vim-scripts/taglist.vim (File outline)
* https://github.com/tobyS/vip/blob/master/.vim/php-doc.vim (PHP documentor)
* https://github.com/tpope/vim-fugitive (Git & grep)
* https://github.com/nanotech/jellybeans.vim (Styles)
* http://www.vim.org/scripts/script.php?script_id=2855 (Styles)
* https://github.com/scrooloose/syntastic (Syntax highlighting)
* https://github.com/shawncplus/phpcomplete.vim (Omni-completion)
* https://github.com/ervandew/supertab (Completion using Tab)
* https://github.com/Raimondi/delimitMate (Auto-completion of quotes, parenthesis...)
* https://github.com/tpope/vim-pathogen
* http://ctags.sourceforge.net/

If I've missed someone/something, please, let me know.
