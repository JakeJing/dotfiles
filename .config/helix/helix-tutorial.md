# Useful command in Helix

**Note:** Alt or A in helix is corresponding to cmd in vim. Importanly, you always need to first select and perform action (selection-first).

## Navigation

- h/j/k/l
- w/W/e/E/b/B
- i/a and I/A: beginning and end of a line and insert
- f/F/t/T: jump in the current line
- gg /ge(go to end of file)/gh(beginning of the line)/gl(line end)
- u/U: undo and redo
- gr: go to reference
- gd: go to definition

[[##Navigation]]

## Deletion 

- c: change a char or selection
- dd: remapped to delete a line

## Open and close files and commands

- <space-f>: open file picker
- <space-b>: get buffer picker to check files in the current buffer
- <space-?>: launch command palette for all available commands
- ZZ: save and close
- ZQ: quit without saving

## Windows

- ctrl-w-v: vertical window split
- zz: center the line at the middle of the screen

## selection

- v-2w: select the next two words
- x: expand selection of the current line and below; X expand line selection above.
- 5x: select the current and 4 lines below
- 2xv: this can be useful when you combine x with v, so that you can use jk to resize the selection.
- mi": match inside quotation
- miw: match inside word
- mip: match in paragraph
- %: select the whole file
- %spattern: select the whole doc and select pattern. This will also enable multiple cursors. If you want to exit the multiple cursor, you can type `esc+,`. This also allows regexp, e.g., you can select the lines you want and type `s` and search for ^ for beginning of lines and $ for line ends.
- space+/: grep word in the current directory. After the search, you can type ctrl+V to get a vertical split of the selection.

## Multiple cursor

- C: duplicate multiple cursor or multicursor, e.g., you can easily create multiple cursors at certain positions across lines. This can also be combined with jkhl to move the multiple cursor. Also, you can use Ctrl+A and Ctrl+E to move all cursor to the beginning or end and insert with I or A, or any other key in the insert mode. 
- ,: to remove the second cursor.
- vj+C+C+C: create multiple cursors for every 2 lines. You first need to select two lines with vj or xx, and type C (captial c) to duplicate the cursor two line below. You can continue to add as many cursor as you wish.

## copy and paste

- x: selection the line; p: paste in the register

## command

- | or cmd+!: pipe to insert cmd, eg., | sort will sort the selected lines.

## check definition and diagnoistic

- gd: go to definition
- ctrl+o: go back to the previous old window
- ctrl + i: go the next window
- space+k: function help
