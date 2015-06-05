Use Vim along with your project git repository to have all project-oriented IDEs cool features.

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
* Quick add echo "<cword>" based on the cursor line
* (Don't be scared by the time it takes the first time you open a project file, is gathering the project references and is only the first time)

By default the Vim-IDE mode is only automatically enabled when opening [supported languages](#fully-supported-languages) files, but it is easy to add more languages (read [Adding new languages](#adding-new-languages)" section for more info).

Usage
=====
You should run Vim from your project root directory, all /my/project/root files will be parsed to get the available tags.

    cd /my/project/root
    vim any/of/my/project/files.SUPPORTED-LANGUAGE

Only a [few usual vim customisations](https://github.com/dmonllao/vim-IDE/blob/master/.vimrc) are available when using Vim to open unsupported languages files.

Requirements
============
* Vim 7.3 and higher (not tested on lower versions)
* Ctags (or exhuberant Ctags) for project-scope tags, jump to definitions, auto-completion...
* For easy copy & paste to the system clipboard Vim should be compiled with **clipboard** support (vim-gtk package compiles Vim with clipboard support)
* For cscope support (list of tags uses) Vim should be compiled with **--enable-cscope** option (vim-gtk package compiles Vim with cscope support)

Install
=======

Backup your **~/.vimrc** and your **~/.vim** if you want

    cd ~/.vim
    git clone git://github.com/dmonllao/vim-IDE.git .
    ln -s ~/.vim/.vimrc ~/.vimrc
    git submodule init
    git submodule update

(Optional) Copy/add your own **.vimrc** rules and overrides to **~/.vim/custom.vim**, more info in **~/.vim/custom.vim.dist**; note that your settings may conflict with the ones set by vim-IDE.

Fully supported languages
=========================

Mostly the ones I use:

* Shell
* PHP
* Javascript
* Vim
* Markdown
* Text
* HTML

Languages can be easily added, more info in next section. Feel free to contribute.

Adding new languages
====================
* Create the filetype specifics in **ftplugin/FILETYPE.vim** you can base it on the existing filetypes (ftplugin/sh.vim for example)
* Add a line with "autocmd vimenter * IDEOpen" in your **ftplugin/FILETYPENAME.vim** to add IDE features
* Create a **fttags/FILETYPENAME.sh** to write the ctags command, use **fttags/template.sh** template

Commands
========
* **Auto-complete**: **\<Tab\>** in "Insert mode" while writing
* **Jump to methods, classes or functions**
    * **\<C-LeftMouse\>** over the method or class name to **jump to its definition**
    * **\<C-RightMouse\>** over the method or class name to **jump to its definition, splitting the window horizontally**
    * **\<C-MiddleMouse\>** over the method or class name to **jump to its definition, splitting the window vertically**
    * Cursor on the method or class and **\<C-c\>** to **open the definition splitting the window horizontally**
    * Cursor on the method or class and **\<C-f\>** to **open the definition splitting it vertically**
    * Cursor on the method or class and **\<C-a\>** to **open the definition on the current window**
    * Cursor on the method or class and **\<C-v\>** to **open a list of references to that tag**
* **Open a file from the project explorer**: **c** to open it splitting the screen horizontally, **f** vertically and **a** in the current window
* **To toggle the "File outline" visibility:** **\<F8\>**
* **To toggle the "Project explorer" visibility:** **\<F7\>**
* **Comment/uncomment the current line**: **\<leader\>c\<space\>** in non-Insert mode to comment/uncomment (\<leader\> key is mapped to "\" by default)
* **Comment/uncomment a bunch of lines**: **v** to enter in "Visual mode", select lines and **\<leader\>c<space>** to comment/uncomment them all
* **To paste without indentation problems**: **\<F9\>** and **\<C-S-P\>**
* **To copy**: Select the text using the mouse cursor or visual mode and **\<C-c\>** (only **if the system clipboard is available**)
* **To echo "<cword>"**: **\<F5\>** and **\<F6\>** to prepend/append a new line with an echo (language dependant) to the cursor line

More info about all the supported commands/mappings below, in [options](#options) section or in [each vim plugin's page](#more-info--dependencies--credits)

To overwrite these mapping with your own preferences see [custom.vim.dist](https://github.com/dmonllao/vim-IDE/blob/master/custom.vim.dist)

Options
=======
There are many vim-IDE features to customize. As mentioned above, you can set your own preferences and extensions,
the same with the vim-IDE features, you can set them in ~/.vim/custom.vim, which you can create from ~/.vim/custom.vim.dist

* **:IDEOpen** to add IDE features
* **:IDEClose** to return to normal Vim file edition mode
* **:IDERebuildTags** to rebuild the project tags (gets the filetype from the current window)
* **:IDES** open the shell command output in a sp window (e.g. :IDES ls -la)
* **let g:IDEAlways** if you want to use the IDE mode for all files opened with Vim
* **let g:IDEOnlyEditor** if you want only want to display the editor window
* **let g:IDESplitWindowKey** to redefine which key opens a file (or the current word) splitting the window horizontally, defaults to "c"
* **let g:IDEVSplitWindowKey** to redefine which key opens a file (or the current word) splitting the window vertically, defaults to "f"
* **let g:IDEOpenCurrentWindowKey** to redefine which key opens a file (or the current word) in the current window, defaults to "a"
* **let g:IDEFindUsesKey** to redefine which key opens the list of uses of the current work splitting the window horizontally, defaults to "v"
* **let g:IDENERDTreeToggleKey** to redefine the key to toggle the project explorer window, defaults to "F7"
* **let g:IDETagListToggleKey** to redefine the key to toggle the file outline window, defaults to "F8"
* **let g:IDEPasteModeKey** to redefine the key to enter to "paste mode", defaults to "F9"

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
* https://github.com/vim-scripts/taglist.vim (File outline)
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
* http://ctags.sourceforge.net/
* http://cscope.sourceforge.net/
* http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window

If I've missed someone/something, please, let me know.
