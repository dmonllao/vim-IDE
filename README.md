Use Vim along with your project git repository to have all project-oriented IDEs cool features.

[![Features demo](https://asciinema.org/a/21377.png)](https://asciinema.org/a/21377)

Features
========
* Integrated with git at project-level repository
* Project explorer
* File outline
* Auto-completion
* Jump to methods, classes, functions... (definitions and uses of them) using keyboard or mouse
* Syntax checking and highlighting
* Project level search (git grep or cscope)
* Comment/uncomment lines quickly
* Easy system copy & paste (depends on clipboard, see [Requirements](#requirements))
* Keyboard and mouse mappings for common actions
* Fuzzy search
* Quick add echo "<cword>" based on the cursor line
* (Don't be scared by the time it takes the first time you open a project file, is gathering the project references and is only the first time)

By default the vim-IDE mode is only automatically enabled when opening [supported languages](#fully-supported-languages) files, but it is easy to add more languages (read [Adding new languages](#adding-new-languages) section for more info).

Usage
=====
You should run Vim from your project root directory, all /my/project/root files will be parsed to get the available tags.

    cd /my/project/root
    vim any/of/my/project/files.file

A few [usual customisations](https://github.com/dmonllao/vim-IDE/blob/master/.vimrc) are available when using Vim to open not fully supported languages files.

Requirements
============

Vim 7.3 and higher (not tested on lower versions)

(Optional) But really recommended, is to install ctags (project-scope tags, jump to definitions, auto-completion...) and cscope (list of tags uses). Vim should also be compiled with **--enable-cscope** option (you can just install vim-gtk package).

    # Linux (apt-get)
    sudo apt-get install ctags cscope vim-gtk

    # OSx
    brew install ctags cscope

(Optional) For easy copy & paste to the system clipboard, Vim should be compiled with **clipboard** support (also included in vim-gtk package).

(Optional) You can use https://github.com/universal-ctags/ctags alternatively for better support.

Install
=======

Backup your **~/.vimrc** and/or your **~/.vim** dir.

    cd ~/.vim
    git clone git://github.com/dmonllao/vim-IDE.git .
    ln -s ~/.vim/.vimrc ~/.vimrc
    git submodule init
    git submodule update

If you are later interested in using part of your previous **~/.vimrc** you can do it in [**~/.vim/custom.vim**](#options).

Note that it uses a dark colour scheme (jellybeans) but respecting your command line interface background colour configuration; if you are using a bash "black on white" colour scheme you might want to change it to something darker.

Upgrade
=======

    # Replace origin if you used a different remote name.
    git fetch origin && git rebase origin/master
    ./upgrade.sh

Note that your **~/.vim/custom.vim** changes will be preserved but if you hacked **~/.vimrc** directly you would have to backup your changes and restore them after last vim-IDE changes are pulled. It is better to add your [customisations to **~/.vim/custom.vim**](#options).

Fully supported languages
=========================

Mostly the ones I use:

* Shell
* PHP
* Javascript
* Python
* Vim
* Markdown
* LaTeX
* HTML
* Text

Languages can be easily added, more info in next section. Feel free to contribute.

Adding new languages
====================
* Create the filetype specifics in **ftplugin/FILETYPE.vim** you can base it on the existing filetypes (ftplugin/sh.vim for example)
* Add a line with "autocmd vimenter * IDEOpen" in your **ftplugin/FILETYPENAME.vim** to add IDE features
* Create a **fttags/FILETYPENAME.sh** to write the ctags command, use **fttags/template.sh** template

Usage
=====

* **Auto-complete**: **\<Tab\>** in "Insert mode" while writing
* **Fuzzy search**: **\<C-p\>**, select the file and [select file](#selecting-files)
* **Jump to methods, classes or functions**
    * Cursor on the method or class and [select file](#selecting-files)
    * Cursor on the method or class and **\<C-v\>** to **open a list of references to that tag**
    * **\<C-LeftMouse\>** over the method or class name to **jump to its definition**
    * **\<C-RightMouse\>** over the method or class name to **jump to its definition, splitting the window horizontally**
    * **\<C-MiddleMouse\>** over the method or class name to **jump to its definition, splitting the window vertically**
* **Open a file from the project explorer**: [select file](#selecting-files)
* **Select a file from file outline**: [select file](#selecting-files)
* **To toggle the "File outline" visibility:** **\<F8\>**
* **To toggle the "Project explorer" visibility:** **\<F7\>**
* **Comment/uncomment the current line**: **\<leader\>c\<space\>** in non-Insert mode to comment/uncomment
* **Comment/uncomment a bunch of lines**: Select lines in "Visual mode" and **\<leader\>c<space>** to comment/uncomment
* **To paste without indentation problems**: **\<F9\>** and **\<C-S-P\>**
* **To copy**: Select the text and **\<C-c\>** (only **if the system clipboard is available**)
* **To echo "<cword>"**: **\<F5\>** and **\<F6\>** to prepend/append a new line with an echo (language dependant) to the cursor line

More info about all the supported commands/mappings below, in [options](#options) section or in [each vim plugin's page](#more-info--dependencies--credits)

To overwrite these mapping with your own preferences see [custom.vim.dist](https://github.com/dmonllao/vim-IDE/blob/master/custom.vim.dist)

Selecting files
===============

These are the mappings to select files ([you can customise them](#options)) to open files or tags. They are used on multiple commands:
* **\<C-a\>** open in the current buffer
* **\<C-c\>** open new buffer splitting the window horizontally
* **\<C-f\>** open new buffer splitting the window vertically

Options
=======
You can set your own preferences and extensions in **~/.vim/custom.vim**, which you can create from **~/.vim/custom.vim.dist**, it will be included just after **~/.vimrc** is loaded.

These are the global variables you can overwrite in **~/.vim/custom.vim**:

* **let g:IDEOnlyEditor** if you want only want to display the editor window (I use this one)
* **let g:IDEAlways** if you want to use the IDE mode for all files opened with Vim, not only the fully supported ones
* **let g:IDESplitWindowKey** to redefine which key opens a file (or the current word) splitting the window horizontally, defaults to "c"
* **let g:IDEVSplitWindowKey** to redefine which key opens a file (or the current word) splitting the window vertically, defaults to "f"
* **let g:IDEOpenCurrentWindowKey** to redefine which key opens a file (or the current word) in the current window, defaults to "a"
* **let g:IDEFindUsesKey** to redefine which key opens the list of uses of the current work splitting the window horizontally, defaults to "v"
* **let g:IDENERDTreeToggleKey** to redefine the key to toggle the project explorer window, defaults to "F7"
* **let g:IDETagListToggleKey** to redefine the key to toggle the file outline window, defaults to "F8"
* **let g:IDEPasteModeKey** to redefine the key to enter to "paste mode", defaults to "F9"

These are the vim-IDE commands:

* **:IDEOpen** to add IDE features
* **:IDEClose** to return to normal Vim file edition mode
* **:IDERebuildTags** to rebuild the project tags (gets the filetype from the current window)
* **:IDES** open the shell command output in a sp window (e.g. :IDES ls -la)

Here you can also customise the other Vim [plugins included here](#more-info--dependencies--credits).

Vim quick info
==============
* Enter **Insert mode** with **i** to edit text
* In "Normal mode" press **:** to enter into **Command-line mode**
* **Navigate through windows** using **\<C-w\> and \<Up\>, \<Down\>, \<Left\> or \<Right\>** depending on where is the window you want to focus
* **Create a new file** splitting the current window **:sp /path/to/new/file** horizontally, and **:vsp /path/to/new/file** vertically, **in "Command-line mode"**

More info / dependencies / credits
======================

Dependencies are automatically installed following the 'Install' section steps.

Most of the project features are part of different plugins, only the basic ones have been explained here; refer to them for more info / options / maps / commands.

* https://github.com/scrooloose/nerdtree (Project explorer)
* https://github.com/scrooloose/nerdcommenter (Code commenter)
* https://github.com/majutsushi/tagbar (File outline)
* https://github.com/tobyS/vip/blob/master/.vim/php-doc.vim (PHP documentor)
* https://github.com/tpope/vim-fugitive (Git & grep)
* https://github.com/nanotech/jellybeans.vim (Styles)
* http://www.vim.org/scripts/script.php?script_id=2855 (Styles)
* https://github.com/scrooloose/syntastic (Syntax highlighting)
* https://github.com/shawncplus/phpcomplete.vim (Omni-completion)
* https://github.com/ervandew/supertab (Completion using Tab)
* https://github.com/tpope/vim-markdown (Markdown)
* https://github.com/digitaltoad/vim-jade (Jade)
* https://github.com/mattn/emmet-vim (Quick HTML & CSS typing)
* https://github.com/bling/vim-airline (Improved statusline)
* https://github.com/airblade/vim-gitgutter (Git diff)
* https://github.com/tpope/vim-pathogen (Plugin dependencies)
* https://github.com/kien/ctrlp.vim
* https://github.com/evidens/vim-twig
* https://github.com/haya14busa/incsearch.vim
* https://github.com/lervag/vimtex
* http://ctags.sourceforge.net/
* http://cscope.sourceforge.net/
* http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
* https://asciinema.org

If I've missed someone/something, please, let me know.
