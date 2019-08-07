### What is EditorConfig?
---
EditorConfig helps maintain consistent coding styles for multiple developers working on the same project across various editors and IDEs.

When opening a file, EditorConfig plugins look for a file named .editorconfig in the directory of the opened file and in every parent directory.
A search for .editorconfig files will stop if the root filepath is reached or an EditorConfig file with root=true is found.

#### Steps to install on VScode:
Launch VS Code Quick Open (Ctrl+P), paste the following command, and press enter.

`ext install EditorConfig.EditorConfig`

#### Steps to install on Atom:
Open de Atom configuration with the command Ctrl+comma, and paste the following  command, and press enter.

`editorconfig`

 **NOTE:** Install the plugging from the user *"sindresorhus"*.

#### Steps to install on Vim:
Open your `.vimrf` file and paste the following line in your plugin section.

`Plugin 'editorconfig/editorconfig-vim'`

**NOTE:** Remeber to call :PluginInstall
