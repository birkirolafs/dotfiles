if !exists('g:vscode')
	source ~/.config/nvim/plugins.vim

	" Section General {{{

	" Abbreviations
	abbr funciton function
	abbr functoin function
	abbr teh the
	abbr tempalte template
	abbr fitler filter
	abbr restard restart


	set nocompatible " not compatible with vi
	set autoread " detect when a file is changed


	" make backspace behave in a sane manner
	set backspace=indent,eol,start


	" set map leader for more key combos
	let mapleader = ','
	let g:mapleader = ','
	"
	set history=1000 " change history to 1000
	set textwidth=120

	" use the
	"  - WARNING: $NVIM_TUI_ENABLE_CURSOR_SHAPE is ignored in Nvim 0.2+
	"    - SUGGESTIONS:
	"      - Use the 'guicursor' option to configure cursor shape. :help |'guicursor'|
	"      - https://github.com/neovim/neovim/wiki/Following-HEAD#20170402
	" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

	" fix for resizing in Konsole (KDE)
	set guicursor=

	if &term =~ '256color'
		" disable background color erase
		set t_ut=
	endif

	" enable 24 bit color support if supported
	if (has('nvim'))
		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
		set termguicolors
	elseif (has("termguicolors"))
		set termguicolors
	endif

	" Tab control
	set noexpandtab " insert tabs rather than spaces for <Tab>
	set smarttab " tab respects 'tabstop, 'shiftwidth', and 'softtabstop'
	set tabstop=4 " the visible width of tabs
	set softtabstop=4 " edit as if the tabs are 4 characters wide
	set shiftwidth=4 " number of spaces to use for indent and unindent
	set shiftround " round indent to a multiple of 'shiftwidth'
	set completeopt+=longest

	if (has('nvim'))
		" show results of substition as they're happening
		" but don't open a split
		set inccommand=nosplit
	endif


	if has ('mouse')
		set mouse=a
		" set ttymouse=xterm2
	endif

	" set clipboard in vim as the same clipboard as normal
	set clipboard=unnamed

	" set faster redrawing
	set ttyfast

	set diffopt+=vertical

	" highlight conflicts
	match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

	set backupdir=~/.vim-tmp,~/.tmp,/var/tmp,/tmp
	set directory=~/.vim-tmp,~/.tmp,/var/tmp,/tmp

	set laststatus=2 " show the status line all the time

	" }}}

	" Section AutoGroups {{{
	" file specific settings
	augroup configgroup
		autocmd!
		autocmd FileType plugin indent on
		autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
		autocmd FileType make setlocal ts=9 sts=8 sw=8 noexpandtab
		autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
		autocmd FileType html setlocal ts=4 sts=4 sw=4 noexpandtab indentkeys-=*<return>
		autocmd FileType jade setlocal ts=2 sts=2 sw=2 noexpandtab
		autocmd FileType *.md.js :call SyntasticReset<cr>
		autocmd FileType markdown,textile setlocal textwidth=0 wrapmargin=0 wrap spell
		autocmd FileType .xml exe ":silent %!xmllint --format --recover - 2>/dev/null"
		autocmd FileType crontab setlocal nobackup nowritebackup

		" automatically resize panes on resize
		autocmd VimResized * exe 'normal! \<c-w>='
		autocmd BufWritePost .vimrc source %
		autocmd BufWritePost .vimrc.local source %
		" save all files on focus lost, ignoring warnings about untitled buffers
		autocmd FocusLost * silent! wa

		autocmd BufNewFile,BufRead *.ejs set filetype=html
		autocmd BufNewFile,BufRead *.ino set filetype=c
		autocmd BufNewFile,BufRead *.svg set filetype=xml
		autocmd BufNewFile,BufRead .babelrc set filetype=json
		autocmd BufNewFile,BufRead .jshintrc set filetype=json
		autocmd BufNewFile,BufRead .eslintrc set filetype=json
		autocmd BufNewFile,BufRead *.es6 set filetype=javascript
		autocmd BufNewFile,BufRead *.tmux.conf set filetype=tmux
		autocmd BufNewFile,BufRead *.py set filetype=python
		autocmd BufNewFile,BufRead *.jsx set filetype=typescript.tsx

		autocmd FileType qf wincmd J

		autocmd BufNewFile,BufReadPost *.md set filetype=markdown
		let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html']

		autocmd! BufEnter * call ApplyLocalSettings(expand('<afile>:p:h'))
		autocmd BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
		" autocmd! BufReadPost,BufWritePost * Neomake
		autocmd BufRead,BufWritePost scp://* :set bt=acwrite
	augroup END
	" }}}

	" Section User Interface {{{

	" code folding settings
	set foldmethod=syntax " fold based on indent
	set foldnestmax=10 " deepest fold is 10 levels
	set nofoldenable " don't fold by default
	set foldlevel=1


	set so=7 " set 7 lines to the cursors - when moving vertical
	set wildmenu " enhanced command line completion
	set hidden " current buffer can be put into background
	set showcmd " show incomplete commands
	set noshowmode " don't show which mode disabled for PowerLine
	set wildmode=list:longest " complete files like a shell
	set scrolloff=3 " lines of text around cursor
	set shell=$SHELL
	set cmdheight=1 " command bar height

	set title " set terminal title

	" Searching
	set ignorecase " case insensitive searching
	set smartcase " case-sensitive if expresson contains a capital letter
	set hlsearch " highlight search
	set incsearch " set incremental search, like modern browsers
	set nolazyredraw " don't redraw while executing macros

	set magic " Set magic on, for regex

	set showmatch " show matching braces
	set mat=2 " how many tenths of a second to blink

	" error bells
	set noerrorbells
	set visualbell
	set t_vb=
	set tm=500

	" switch syntax highlighting on
	syntax on
	" set t_Co=256                " Explicitly tell vim that the terminal supports 256 colors"
	colorscheme gruvbox         " Set the colorscheme

	" make the highlighting of tabs and other non-text less annoying
	highlight SpecialKey ctermbg=none ctermfg=8
	highlight NonText ctermbg=none ctermfg=8

	let g:onedark_termcolors=16

	" make comments and HTML attributes italic
	if $TERM =~ "xterm-255color-italic"
		let g:onedark_terminal_italics=1
		highlight Comment cterm=italic
		highlight htmlArg cterm=italic
	endif

	set number " show line numbers
	" set relativenumber " show relative line numbers

	set wrap "turn on line wrapping
	set wrapmargin=8 " wrap lines when coming within n characters from side
	set linebreak " set soft wrapping
	set showbreak=… " show ellipsis at breaking

	set autoindent " automatically set indent of new line
	set smartindent

	" }}}

	" Section Mappings {{{

	" EasyAlign
	" Start interactive EasyAlign in visual mode (e.g. vipga)
	xmap ga <Plug>(EasyAlign)

	" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
	nmap ga <Plug>(EasyAlign)

	" remap esc
	inoremap jk <esc>

	" remove extra whitespace
	nmap <leader><space> :%s/\s\+$<cr>

	" shortcut to save
	nmap <leader>, :w<cr>

	" disable Ex mode
	noremap Q <NOP>

	" set paste toggle
	set pastetoggle=<F6>

	" toggle paste mode
	map <leader>v :set paste!<cr>

	" edit ~/.config/nvim/init.vim
	map <leader>ev :e! ~/.config/nvim/init.vim<cr>
	" edit ~/.config/nvim/init.vim
	map <leader>ep :e! ~/.config/nvim/plugins.vim<cr>
	" edit gitconfig
	map <leader>eg :e! ~/.gitconfig<cr>
	" edit tmux.config
	map <leader>et :e! ~/.tmux.conf<cr>
	" edit tmuxp.yaml
	map <leader>es :e! ~/.tmuxp/dev.yaml<cr>

	" clear highlighted search
	noremap <space> :set hlsearch! hlsearch?<cr>

	" activate spell-checking alternatives
	nmap ;s :set invspell spelllang=en<cr>


	" toggle invisible characters
	set invlist
	set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
	highlight SpecialKey ctermbg=none " make the highlighting of tabs less annoying
	set showbreak=↪
	nmap <leader>l :set list!<cr>

	" Textmate style indentation
	vmap <leader>[ <gv
	vmap <leader>] >gv
	nmap <leader>[ <<
	nmap <leader>] >>

	" switch between current and last buffer
	nmap <leader>. <c-^>

	" enable . command in visual mode
	vnoremap . :normal .<cr>

	map <silent> <C-h> :call WinMove('h')<cr>
	map <silent> <C-j> :call WinMove('j')<cr>
	map <silent> <C-k> :call WinMove('k')<cr>
	map <silent> <C-l> :call WinMove('l')<cr>

	" map <leader>wc :wincmd q<cr>

	" toggle cursor line
	nnoremap <leader>i :set cursorline!<cr>

	" scroll the viewport faster
	nnoremap <C-e> 3<C-e>
	nnoremap <C-y> 3<C-y>

	" moving up and down work as you would expect
	nnoremap <silent> j gj
	nnoremap <silent> k gk
	nnoremap <silent> ^ g^
	nnoremap <silent> $ g$

	" search for word under the cursor
	nnoremap <leader>/ "fyiw :/<c-r>f<cr>

	" inoremap <tab> <c-r>=Smart_TabComplete()<CR>

	" map <leader>r :call RunCustomCommand()<cr>
	" map <leader>s :call SetCustomCommand()<cr>
	let g:silent_custom_command = 0

	" helpers for dealing with other people's code
	nmap \t :set ts=4 sts=4 sw=4 noet<cr>
	nmap \s :set ts=4 sts=4 sw=4 et<cr>

	nmap <leader>w :setf textile<cr> :Goyo<cr>

	" }}}

	" Section Functions {{{

	" Window movement shortcuts
	" move to the window in the direction shown, or create a new window
	function! WinMove(key)
		let t:curwin = winnr()
		exec "wincmd ".a:key
		if (t:curwin == winnr())
			if (match(a:key,'[jk]'))
				wincmd v
			else
				wincmd s
			endif
			exec "wincmd ".a:key
		endif
	endfunction

	" recursively search up from dirname, sourcing all .vimrc.local files along the way
	function! ApplyLocalSettings(dirname)
		" convert windows paths to unix style
		let l:curDir = substitute(a:dirname, '\\', '/', 'g')

		" walk to the top of the dir tree
		let l:parentDir = strpart(l:curDir, 0, strridx(l:curDir, '/'))
		if isdirectory(l:parentDir)
			call ApplyLocalSettings(l:parentDir)
		endif

		" now walk back down the path and source .vimsettings as you find them.
		" child directories can inherit from their parents
		let l:settingsFile = a:dirname . '/.vimrc.local'
		if filereadable(l:settingsFile)
			exec ':source' . l:settingsFile
		endif
	endfunction

	" smart tab completion
	function! Smart_TabComplete()
		let line = getline('.')                         " current line

		let substr = strpart(line, -1, col('.')+1)      " from the start of the current
		" line to one character right
		" of the cursor
		let substr = matchstr(substr, '[^ \t]*$')       " word till cursor
		if (strlen(substr)==0)                          " nothing to match on empty string
			return '\<tab>'
		endif
		let has_period = match(substr, '\.') != -1      " position of period, if any
		let has_slash = match(substr, '\/') != -1       " position of slash, if any
		if (!has_period && !has_slash)
			return '\<C-X>\<C-P>'                         " existing text matching
		elseif ( has_slash )
			return '\<C-X>\<C-F>'                         " file matching
		else
			return '\<C-X>\<C-O>'                         " plugin matching
		endif
	endfunction

	" execute a custom command
	function! RunCustomCommand()
		up
		if g:silent_custom_command
			execute 'silent !' . s:customcommand
		else
			execute '!' . s:customcommand
		endif
	endfunction

	function! SetCustomCommand()
		let s:customcommand = input('Enter Custom Command$ ')
	endfunction

	function! TrimWhiteSpace()
		%s/\s\+$//e
	endfunction

	function! HiInterestingWord(n)
		" Save our location.
		normal! mz

		" Yank the current word into the z register.
		normal! "zyiw

		" Calculate an arbitrary match ID.  Hopefully nothing else is using it.
		let mid = 86750 + a:n

		" Clear existing matches, but don't worry if they don't exist.
		silent! call matchdelete(mid)

		" Construct a literal pattern that has to match at boundaries.
		let pat = '\V\<' . escape(@z, '\') . '\>'

		" Actually match the words.
		call matchadd("InterestingWord" . a:n, pat, 1, mid)

		" Move back to our original location.
		normal! `z
	endfunction

	nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
	nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
	nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
	nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
	nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
	nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

	hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
	hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
	hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
	hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
	hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
	hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

	function! HtmlUnEscape()
	silent s/&lt;/</eg
	silent s/&gt;/>/eg
	silent s/&amp;/\&/eg
	endfunction

	nnoremap <silent> <leader>u :call HtmlUnEscape()<cr>

	" }}}

	" Section Plugins {{{

	" close NERDTree after a file is opened
	let g:NERDTreeQuitOnOpen=0
	" show hidden files in NERDTree
	let NERDTreeShowHidden=1
	" remove some files by extension
	let NERDTreeIgnore = ['\.js.map$','__pycache__$[[dir]]', '.mypy_cache$[[dir]]']
	" Toggle NERDTree
	nmap <silent> <leader>k :NERDTreeToggle<cr>
	" expand to the path of the file in the current buffer
	nmap <silent> <leader>y :NERDTreeFind<cr>
	"
	" settings for fuzzy file finder fzf

	if has('nvim') || has('gui_running')
	let $FZF_DEFAULT_OPTS .= ' --inline-info'
	endif


	" All files
	command! -nargs=? -complete=dir AF
	\ call fzf#run(fzf#wrap(fzf#vim#with_preview({
	\   'source': 'fd --type f --hidden --follow --exclude .git --no-ignore . '.expand(<q-args>)
	\ })))

	let g:fzf_colors =
	\ { 'fg':      ['fg', 'Normal'],
	\ 'bg':      ['bg', 'Normal'],
	\ 'hl':      ['fg', 'Comment'],
	\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
	\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
	\ 'hl+':     ['fg', 'Statement'],
	\ 'info':    ['fg', 'PreProc'],
	\ 'border':  ['fg', 'Ignore'],
	\ 'prompt':  ['fg', 'Conditional'],
	\ 'pointer': ['fg', 'Exception'],
	\ 'marker':  ['fg', 'Keyword'],
	\ 'spinner': ['fg', 'Label'],
	\ 'header':  ['fg', 'Comment'] }

	" Terminal buffer options for fzf
	autocmd! FileType fzf
	autocmd  FileType fzf set noshowmode noruler nonu

	if exists('$TMUX')
	let g:fzf_layout = { 'tmux': '-p90%,60%' }
	else
	let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
	endif

	nnoremap <silent> <expr> <leader><leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
	nnoremap <silent> <leader>C        :Colors<CR>
	nnoremap <silent> <leader><Enter>  :Buffers<CR>
	nnoremap <silent> <leader>L        :Lines<CR>
	nnoremap <silent> <leader>ag       :Ag <C-R><C-W><CR>
	nnoremap <silent> <leader>AG       :Ag <C-R><C-A><CR>
	xnoremap <silent> <leader>ag       y:Ag <C-R>"<CR>
	nnoremap <silent> <leader>`        :Marks<CR>

	inoremap <expr> <c-x><c-t> fzf#complete('tmuxwords.rb --all-but-current --scroll 500 --min 5')
	imap <c-x><c-k> <plug>(fzf-complete-word)
	imap <c-x><c-f> <plug>(fzf-complete-path)
	inoremap <expr> <c-x><c-d> fzf#vim#complete#path('blsd')
	imap <c-x><c-j> <plug>(fzf-complete-file-ag)
	imap <c-x><c-l> <plug>(fzf-complete-line)


	" settings for window manager
	let g:netrw_altv          = 1
	let g:netrw_fastbrowse    = 2
	let g:netrw_keepdir       = 0
	let g:netrw_liststyle     = 2
	let g:netrw_retmap        = 1
	let g:netrw_silent        = 1
	let g:netrw_special_syntax= 1

	" map fuzzyfinder (CtrlP) plugin
	" nmap <silent> <leader>t :CtrlP<cr>
	" nmap <silent> <leader>r :CtrlPBuffer<cr>
	" let g:ctrlp_map='<leader>t'
	" let g:ctrlp_dotfiles=1
	" let g:ctrlp_working_path_mode = 'ra'

	" Fugitive Shortcuts
	nmap <silent> <leader>gs :Gstatus<cr>
	nmap <leader>ge :Gedit<cr>
	nmap <silent><leader>gr :Gread<cr>
	nmap <silent><leader>gb :Gblame<cr>

	" nmap <leader>m :MarkedOpen!<cr>
	" nmap <leader>mq :MarkedQuit<cr>

	" toggle Limelight
	nmap <leader>f :Limelight!!<cr>
	autocmd! User GoyoEnter Limelight
	autocmd! User GoyoLeave Limelight!

	" neomake options

	" Disable inherited syntastic
	"let g:syntastic_mode_map = {
	""  \ "mode": "passive",
	""  \ "active_filetypes": [],
	""  \ "passive_filetypes": [] }
	"
	"let g:neomake_serialize = 1
	"let g:neomake_serialize_abort_on_error = 1
	"
	"let g:neomake_python_enabled_makers = ['flake8']
	"
	"let g:neomake_python_flake8_maker = {
	""    \ 'errorformat':
	""        \ '%E%f:%l: error: %m,' .
	""        \ '%W%f:%l: warning: %m,' .
	""        \ '%I%f:%l: note: %m'
	""\ }
	"
	"let g:neomake_python_mypy_maker = {
	""    \ 'args': ['--check-untyped-defs', '--ignore-missing-imports'],
	""    \ 'errorformat':
	""        \ '%E%f:%l: error: %m,' .
	""        \ '%W%f:%l: warning: %m,' .
	""        \ '%I%f:%l: note: %m'
	""\ }
	"
	"let g:neomake_javascript_jshint_maker = {
	""    \ 'args': ['--verbose'],
	""    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
	""\ }
	"
	"let g:neomake_typescript_tsc_maker = {
	""    \ 'args': ['-m', 'commonjs', '--noEmit' ],
	""    \ 'append_file': 0,
	""    \ 'errorformat':
	""        \ '%E%f %#(%l\,%c): error %m,' .
	""        \ '%E%f %#(%l\,%c): %m,' .
	""        \ '%Eerror %m,' .
	""        \ '%C%\s%\+%m'
	""\ }

	" autocmd FileType javascript let g:neomake_javascript_enabled_makers = findfile('.jshintrc', '.;') != '' ? ['jshint'] : ['eslint']
	"autocmd FileType javascript let g:neomake_javascript_enabled_makers = findfile('.jshintrc', '.;') != '' ? ['jshint'] : ['eslint']
	"let g:neomake_javascript_enabled_makers = ['jshint', 'jscs']

	"let g:ale_linters = {'javascript': ['eslint']}
	"let g:ale_fixers = { 'javascript': ['eslint'] }
	"let g:ale_sign_error = '❌'
	"let g:ale_sign_warning = '⚠️'
	"let g:ale_fix_on_save = 1

	" CtrlP ignore patterns
	" let g:ctrlp_custom_ignore = {
	"             \ 'dir': '\.git$\|node_modules$\|bower_components$\|\.hg$\|\.svn$',
	"             \ 'file': '\.exe$\|\.so$'
	"             \ }
	" only show files that are not ignored by git
	" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

	" search the nearest ancestor that contains .git, .hg, .svn
	" let g:ctrlp_working_path_mode = 2

	" lightline options
	let g:lightline = {
		\ 'colorscheme': 'gruvbox'
		\ }



	" airline options
	"let g:airline_powerline_fonts=1
	"let g:airline_left_sep=''
	"let g:airline_right_sep=''
	"let g:airline_theme='onedark'
	" let g:airline_section_b = '%{FugitiveStatusline()}'
	"let g:airline#extensions#tabline#enabled = 1 " enable airline tabline
	"let g:airline#extensions#tabline#tab_min_count = 2 " only show tabline if tabs are being used (more than 1 tab open)
	"let g:airline#extensions#tabline#show_buffers = 0 " do not show open buffers in tabline
	"let g:airline#extensions#tabline#show_splits = 0

	"if !exists('g:airline_symbols')
	"    let g:airline_symbols = {}
	"endif

	" Airline Symbols
	"let g:airline_left_sep = ''
	"let g:airline_left_alt_sep = ''
	"let g:airline_right_sep = ''
	"let g:airline_right_alt_sep = ''
	"let g:airline_symbols.branch = ''
	"let g:airline_symbols.readonly = ''
	"let g:airline_symbols.linenr = ''

	" don't hide quotes in json files
	let g:vim_json_syntax_conceal = 0

	" Coc Settings
	command! -nargs=0 Prettier :CocCommand prettier.formatFile


	let g:SuperTabCrMapping = 0

	if (has("gui_running"))
		set guioptions=egmrt
		set background=light
		colorscheme solarized
	"    let g:airline_left_sep=''
	"    let g:airline_right_sep=''
	"    let g:airline_powerline_fonts=0
	"    let g:airline_theme='solarized'
	endif

	call ApplyLocalSettings(expand('.'))

	" }}}

	" Use local configuration file
	if !empty(glob("~/.local.vim"))
		source ~/.local.vim
	endif

	" vim:foldmethod=marker:foldlevel=0

	"
	" make test commands execute using dispatch.vim
	let test#strategy = 'neovim'
	let test#python#runner = 'pytest'

	let g:elm_setup_keybindings = 1

	" py.test configuration
	nmap <silent> <leader>t :TestNearest --verbose<CR>
	nmap <silent> <leader>T :TestFile --verbose<CR>
	nmap <silent> <leader>a :TestSuite<CR>
	nmap <silent> <leader>l :TestLast<CR>
	nmap <silent> <leader>g :TestVisit<CR>

	" interpreter paths for python
	let g:python_host_prog = '/usr/bin/python2'
	let g:python3_host_prog = '/usr/bin/python3'
endif
