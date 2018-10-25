set encoding=utf8
set clipboard=unnamed
set guifont=Consolas:h15
set rtp+=~/.vim/bundle/Vundle.vim

" if (has("termguicolors"))
"  set termguicolors
" endif

set term=screen-256color

" set termguicolors
set background=dark
set t_Co=256
syntax enable
" set background=dark
" set background=light
" colorscheme hybrid
" colorscheme solarized8_dark
" colorscheme base16-tomorrow-night
" colorscheme jellybeans
colorscheme cobalt2
" colorscheme molokai
" colorscheme apprentice

" General {
  syntax enable                  " syntax highlighting
  filetype plugin indent on  " automatically detect file types
  set mouse=a                " automatically enable mouse usage
  set mousehide              " hide the mouse cursor while typing
  set encoding=utf-8
  scriptencoding utf-8
  set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

  if has ('x') && has ('gui') " on Linux use + register for copy-paste
    set clipboard=unnamedplus
  elseif has ('gui') " one mac and windows, use * register for copy-paste
    set clipboard=unnamed
  endif

  set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
  set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
  set virtualedit=onemore         " allow for cursor beyond last character
  set history=800                 " Store a ton of history (default is 20)
  set hidden                      " allow buffer switching without saving
  set viminfo^=%                  " Remember info about open buffers on close
  set ttyfast                     " this is the 21st century, people
"set autochdir                   " change directory to the current window

let loaded_matchparen = 1 " this should fix issue with long lines
" }

" Formatting {
  set nowrap                      " wrap long lines
  set autoindent                  " indent at the same level of the previous line
  set expandtab                   " tabs are spaces, not tabs
  set shiftwidth=2                " use indents of 2 spaces
  set tabstop=2                   " an indentation every two columns
  set softtabstop=2               " let backspace delete indent
  set diffopt+=iwhite,vertical    " ignore the difference of indents
  set matchpairs=(:),{:},[:],<:>
  set foldmethod=marker
  set colorcolumn=110
" }

  if has('statusline')
    set laststatus=2
  endif

  set numberwidth=4               " set the width of line number gutter column
  set linespace=2                 " set spaces between rows
  set ignorecase                  " case insensitive search
  set backspace=indent,eol,start  " backspace for dummies
  set smartcase                   " case sensitive when uc present
  set showmatch                   " show matching brackets/parenthesis
  set hlsearch                    " highlight search terms
  set incsearch                   " find as you type search
  set wildmenu                    " show list instead of just completing
  set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all
  set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
  set scrolljump=5                " lines to scroll when cursor leaves screen
  set scrolloff=3                 " minimum lines to keep above and below cursor
  set foldenable                  " auto fold code
  set cursorline
  hi CursorLine term=bold cterm=bold guibg=Grey50
  set anti                        " make text pretty

let g:solarized_termcolors=256

if has("gui_running")
  set macligatures
endif

set clipboard=unnamed

" copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

filetype off

call vundle#begin()
  Plugin 'hashivim/vim-terraform'
  Plugin 'elixir-lang/vim-elixir'
  Plugin 'tomlion/vim-solidity'
  Plugin 'fatih/vim-go'
  Plugin 'elzr/vim-json'
  Plugin 'pangloss/vim-javascript'
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'slashmili/alchemist.vim'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'rstacruz/sparkup'
  Plugin 'tpope/vim-rails'
  Plugin 'editorconfig/editorconfig-vim'
  Plugin 'kristijanhusak/vim-hybrid-material'
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'majutsushi/tagbar'
  Plugin 'tpope/vim-fugitive'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'scrooloose/syntastic'
  Plugin 'mhinz/vim-signify'
  Plugin 'isRuslan/vim-es6'
  Plugin 'rizzatti/dash.vim'
  Plugin 'tpope/vim-commentary'
  Plugin 'terryma/vim-multiple-cursors'
  Plugin 'mxw/vim-jsx'
  Plugin 'vim-airline/vim-airline'
  Plugin 'nathanaelkane/vim-indent-guides'
  Plugin 'Valloric/MatchTagAlways'
  Plugin 'w0rp/ale'
  Plugin 'leafgarland/typescript-vim'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'tpope/vim-surround'
  Plugin 'derekwyatt/vim-scala'
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'garbas/vim-snipmate'
  Plugin 'grvcoelho/vim-javascript-snippets'
call vundle#end()

let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing

let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

" NERDTree
" Open nerdtree by default
" au VimEnter *  NERDTree

nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1

" autocmd VimEnter * nested :call tagbar#autoopen(1)
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:alchemist_tag_map = '<C-]>'
let g:alchemist_tag_stack_map = '<C-T>'

let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits',
        \'i:impls,trait implementations',
    \]
    \}

let g:tagbar_type_scala = {
    \ 'ctagstype' : 'scala',
    \ 'sro'       : '.',
    \ 'kinds'     : [
      \ 'p:packages',
      \ 'T:types:1',
      \ 't:traits',
      \ 'o:objects',
      \ 'O:case objects',
      \ 'c:classes',
      \ 'C:case classes',
      \ 'm:methods',
      \ 'V:values:1',
      \ 'v:variables:1'
    \ ]
\ }

let g:tagbar_type_go = {
    \ 'ctagstype': 'go',
    \ 'kinds' : [
        \'p:package',
        \'f:function',
        \'v:variables',
        \'t:type',
        \'c:const'
    \]
\}

let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
\ }

let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }

if !exists('g:tagbar_javascript_ctags_bin')
    let g:tagbar_javascript_ctags_bin = 'esctags'
endif

if !exists('g:tagbar_javascript_ctags_memory_limit')
    let g:tagbar_javascript_ctags_memory_limit = '128M'
endif

let g:tagbar_type_javascript = {
    \ 'ctagstype' : 'JavaScript',
    \ 'kinds'     : [
        \ 'o:objects',
        \ 'f:functions',
        \ 'a:arrays',
        \ 's:strings'
    \ ]
\ }

nnoremap ,gl :YcmCompleter GoToDeclaration<CR>

let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_max_num_candidates = 15
let g:ycm_max_num_identifier_candidates = 10
let g:ycm_auto_trigger = 0

let g:ycm_rust_src_path = '/usr/local/rust/rust-1.29.2/src'
let g:ycm_gocode_binary_path = "$GOPATH/bin/gocode"
let g:ycm_godef_binary_path = "$GOPATH/bin/godef"

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_open_on_console_startup=1

" In ~/.vim/ftplugin/javascript.vim, or somewhere similar.

" Fix files with prettier, and then ESLint.
let b:ale_fixers = ['prettier', 'standard']
" Equivalent to the above.
let b:ale_fixers = {'javascript': ['prettier', 'standard']}

" Enable completion where available.
let g:ale_completion_enabled = 1

" autocmd bufwritepost *.js silent !standard --fix %
" set autoread

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size = 2

let g:Powerline_symbols = 'fancy'

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

set laststatus=2
let g:Powerline_symbols = 'fancy'
set t_Co=256

" Leader
let mapleader = " "

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace

" Use one space, not two, after punctuation.
set nojoinspaces

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'
  let g:ctrlp_use_caching = 0
endif

" Numbers
set number
set numberwidth=5

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_eruby_ruby_quiet_messages =
    \ {"regex": "possibly useless use of a variable in void context"}

" set ignorecase
" set tags=./tags,tags;$HOME
let NERDTreeShowHidden=1
" set cursorline
let g:syntastic_html_tidy_ignore_errors = [ '<template> is not recognized!' ]
