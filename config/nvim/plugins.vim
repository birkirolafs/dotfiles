" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.config/nvim/plugged')

" colorschemes
"Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'

" alignment
Plug 'junegunn/vim-easy-align'

" utilities
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } " file drawer
" Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " fuzzy file finder and so much more
Plug 'ryanoasis/vim-devicons'
Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline

Plug 'benekastah/neomake' " neovim replacement for syntastic using neovim's job control functuality
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-unimpaired' " mappings which are simply short normal mode aliases for commonly used ex commands
Plug 'tpope/vim-surround'

Plug 'janko-m/vim-test' " for testing inside of vim

" Problems
Plug 'editorconfig/editorconfig-vim' " .editorconfig support

" styles
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] } " markdown support

" language-specific plugins

" PYTHON

" MARKDOWN
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-markdown'
Plug 'nelstrom/vim-markdown-folding'

" HTML
Plug 'gregsexton/MatchTag', { 'for': 'html' } " match tags in html, similar to paren support
Plug 'othree/html5.vim', { 'for': 'html' } " html5 support
" JAVASCRIPT
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' } " JavaScript indent support
Plug 'moll/vim-node', { 'for': 'javascript' } " node support
Plug 'othree/yajs.vim', { 'for': 'javascript' } " JavaScript syntax plugin
Plug 'mxw/vim-jsx', { 'for': 'jsx' } " JSX support
Plug 'elzr/vim-json', { 'for': 'json' } " JSON support
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' } " ES6 and beyond syntax


call plug#end()
