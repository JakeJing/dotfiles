" set runtimepath=~/vimrc/vim,~/vimrc/vim/after,\$VIMRUNTIME
" source ~/vimrc/vimrc
" helptags ~/vimrc/vim/doc

set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" cursor highlighting
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

" Plugins starts
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'ryanoasis/vim-devicons'
Plug 'ryanoasis/vim-webdevicons'
Plug 'junegunn/goyo.vim'
Plug 'majutsushi/tagbar'  " show tags in a bar (functions etc) for easy browsing
Plug 'vim-airline/vim-airline'  " make statusline awesome
Plug 'vim-airline/vim-airline-themes'  " themes for statusline
Plug 'jonathanfilip/vim-lucius'  " nice white colortheme
Plug 'tweekmonster/impsort.vim'  " color and sort imports
Plug 'wsdjeg/FlyGrep.vim'  " awesome grep on the fly
Plug 'airblade/vim-gitgutter'  " show git changes to files in gutter
Plug 'tpope/vim-commentary'  "comment-out by gc
Plug 'roxma/nvim-yarp'  " dependency of ncm2
Plug 'ncm2/ncm2-path'  " filepath completion
Plug 'terryma/vim-multiple-cursors'   " multiple cursors
Plug 'eiginn/netrw' " netrw for displaying the tree structure of a folder
Plug 'prettier/vim-prettier', { 'do': 'npm install --frozen-lockfile --production' }
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
" List ends here. Plugins become vi
call plug#end()

" remember more commands and search history
set history=10000
" split the window right
set splitright


let g:airline#extensions#ale#enabled = 1
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

let g:netrw_banner       = 0  " removes the netrw banner
let g:netrw_liststyle    = 3  " tree style listing
let g:netrw_browse_split = 4  " see help on this one. lots of useful options
let g:netrw_altv         = 1  " change from left splitting to right splitting
let g:netrw_winsize      = 25 " initial size of new explore windows
" By default netrw leaves unmodified buffers open. This autocommand
" deletes them when they're hidden (using :q for example).
autocmd FileType netrw setl bufhidden=delete

" prettier formating
au FileType css,scss let b:prettier_exec_cmd = "prettier-stylelint"
" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0
" whenever you write the file, it will automatically format the doc
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync
" autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync


" Colorscheme
colorscheme desert

" Highlight search and search while typing
set hlsearch
set incsearch
set cpoptions+=x  " stay at seach item when <esc>

" Remove bells (too annoying, i think this is default in neovim)
set noerrorbells
set visualbell
set t_vb=
set relativenumber
set viminfo='20,<1000  " allow copying of more than 50 lines to other applications

" allow cursor to continue to move after reaching the end of a line
set whichwrap+=<,>,h,l,[,]

" set up for ctrlp (ignore certain files)
let g:ctrlp_custom_ignore = '\v\.(npy|jpg|png|gif|bmp|DS_Store|git|hg|svn|tmp|a|o|swp|pyc|so|dll)$'

" global settings for multiple cursors
let g:multi_cursor_exit_from_visual_mode=1
let g:multi_cursor_exit_from_insert_mode=1

"turn off jedi completion
let g:jedi#completions_enabled = 0

" automatically deletes all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

set nu
set autoindent

" yank to clipboard
if has("clipboard")
	set clipboard=unnamed " copy to the system clipboard
	if has("unnamedplus") " X11 support
		set clipboard+=unnamedplus
	endif
endif


set encoding=UTF-8

" set the font
set guifont=courier_new\ 50

" setting for vim-webdevicons
let g:lightline = {
			\ 'component_function': {
			\   'filetype': 'MyFiletype',
			\   'fileformat': 'MyFileformat',
			\ }
			\ }



"""""""""""""""""""""""""""""
""""""""" key mapping """""""
"""""""""""""""""""""""""""""

" remap to resize the splitted window
nmap = <C-W>>
nmap - <C-W><

" remap ctrl+S to split a terminal window at the right
noremap <C-s> :vertical botright terminal <CR>

"  split a window on the right and move the cursor on the right
noremap <leader>v :vsplit<CR><C-w>l

" move the beginning or end for Insert and Replace modes
nnoremap <C-e> <esc>A
nnoremap <C-a> <esc>I
imap <C-e> <esc>A
imap <C-a> <esc>I

" move farward or backward one word
" imap <A-Left> <esc>b
" imap <A-Right> <esc>e
" nnoremap <A-Left> b
" nnoremap <A-Right> e


" delete one word forward <C-W> as the default
" noremap! <C-BS> <C-w>
" inoremap <C-BS> <C-\><C-o>db

" delete one word at the current location
nnoremap dw daw
nnoremap cw caw

" noremap! <A-BS> <esc>daw
" nnoremap <A-BS> <esc>daw
" noremap <A-BS> <esc>daw

" map dd to move one page down, and use dl to delete one line
" noremap dd <C-d>zz

" " map uu to scroll up
" noremap uu <C-u>zz

" " map U to undo a action
" noremap U u

" easy block selection with mouse
noremap <M-LeftMouse> <LeftMouse><Esc><C-V>
noremap <M-LeftDrag> <LeftDrag>

" remove search highlight
nnoremap <C-l> :nohl<CR><C-l>

" press S is aliased to replace all
nnoremap S :%s//g<left><left>
" Search and Replace
" nmap <Leader>s :%s//g<Left><Left>

" traverse text in Insert mode by using ctrl + jkhl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" compile the file manually
" map <C-r> :! compile % &<CR>
" map <C-r> :!setsid /Users/jakejing/.script/autocomp.sh % &<CR>


function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
	return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" and a handy-dandy function to toggle a Netrw sidebar
" Toggle Vexplore with Ctrl-\
function! ToggleVExplorer()
	if exists("t:expl_buf_num")
		let expl_win_num = bufwinnr(t:expl_buf_num)
		if expl_win_num != -1
			let cur_win_nr = winnr()
			exec expl_win_num . 'wincmd w'
			close
			exec cur_win_nr . 'wincmd w'
			unlet t:expl_buf_num
		else
			unlet t:expl_buf_num
		endif
	else
		exec '1wincmd w'
		Vexplore
		let t:expl_buf_num = bufnr("%")
	endif
endfunction
map <silent> <C-\> :call ToggleVExplorer()<CR>
" key mapping to automatically complete filename
" imap <C-f> <C-f><C-x>
"umap key F3 for autoformat and autoformat upon saving
"
" noremap <F3> :Autoformat<CR>
" au BufWrite * :Autoformat
" let g:python3_host_prog="/Library/Frameworks/Python.framework/Versions/3.11/bin/python3"

" Switch window mappings
" nmap <silent> <A-Up> :wincmd k<CR>
" nmap <silent> <A-Down> :wincmd j<CR>
" nmap <silent> <A-Left> :wincmd h<CR>
" nmap <silent> <A-Right> :wincmd l<CR>
" imap <C-w> <C-o><C-w>
" map - <C-W>-
" map + <C-W>+
"
"
" ###################
" ### Functions #######
" #########################
"
function! ToggleVExplorer()
	if exists("t:expl_buf_num")
		let expl_win_num = bufwinnr(t:expl_buf_num)
		if expl_win_num != -1
			let cur_win_nr = winnr()
			exec expl_win_num . 'wincmd w'
			close
			exec cur_win_nr . 'wincmd w'
			unlet t:expl_buf_num
		else
			unlet t:expl_buf_num
		endif
	else
		exec '1wincmd w'
		Vexplore
		let t:expl_buf_num = bufnr("%")
	endif
endfunction

" Copy matches of the last search to a register (default is the clipboard).
" Accepts a range (default is whole file).
" 'CopyMatches'   copy matches to clipboard (each match has \n added).
" 'CopyMatches x' copy matches to register x (clears register first).
" 'CopyMatches X' append matches to register x.
" We skip empty hits to ensure patterns using '\ze' don't loop forever.
command! -range=% -register CopyMatches call s:CopyMatches(<line1>, <line2>, '<reg>')
function! s:CopyMatches(line1, line2, reg)
	let hits = []
	for line in range(a:line1, a:line2)
		let txt = getline(line)
		let idx = match(txt, @/)
		while idx >= 0
			let end = matchend(txt, @/, idx)
			if end > idx
				call add(hits, strpart(txt, idx, end-idx))
			else
				let end += 1
			endif
			if @/[0] == '^'
				break  " to avoid false hits
			endif
			let idx = match(txt, @/, end)
		endwhile
	endfor
	if len(hits) > 0
		let reg = empty(a:reg) ? '+' : a:reg
		execute 'let @'.reg.' = join(hits, "\n") . "\n"'
	else
		echo 'No hits'
	endif
endfunction


" Use 0"+y0 to clear the clipboard, then
"    :g/pattern/call CopyMultiMatches()
" to copy all multiline hits (just the matching text).
" This is for when the match extends over multiple lines.
" Only the first match from each line is found.
" BUG: When searching for "^function.*\_s*let" the '.*' stops at the end
" of a line, but it greedily skips "\n" in the following (we copy too much).
function! CopyMultiMatches()
	let text = join(getline(".", "$"), "\n") . "\n"
	let @+ .= matchstr(text, @/) . "\n"
endfunction

map <silent> <C-\> :call ToggleVExplorer()<CR>

