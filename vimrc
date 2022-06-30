" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Turn on syntax highlighting.
syntax on
" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

filetype plugin indent on " enable file type detection
set autoindent

"---------------------
"" Basic editing config
"---------------------

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

set showcmd " show command in bottom bar

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
"
set incsearch " Enable searching as you type, rather than waiting till you press enter.
set hlsearch " highlight search
set ignorecase " Ignore case in searches by default
set smartcase  " But make it case sensitive if an uppercase is entered

" Ignore files for completion
set wildignore+=*/.git/*,*/tmp/*,*.swp


" Ignore files for completion
set wildignore+=*/.git/*,*/tmp/*,*.swp

set listchars=tab:>>,nbsp:~ " set list to see tabs and non-breakable spaces

set linebreak " Have lines wrap instead of continue off-screen

set scrolloff=12 " show lines above and below cursor (when possible)

set noshowmode " hide mode

set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts

set lazyredraw " skip redrawing screen in some cases

" set autochdir " automatically set current directory to directory of last opened file

set history=8192 " more history

set nojoinspaces " suppress inserting two spaces between sentences

" tab completion for files/buffers
set wildmode=longest,list
set wildmenu
" set mouse+=a " enable mouse mode (scrolling, selection, etc)
"
" if you want to use mouse to resize split window please use the following two
" lines( That's really cool! )
" set mouse=n
" set ttymouse=xterm2

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4



" Ignore files for completion
set wildignore+=*/.git/*,*/tmp/*,*.swp

" Maintain undo history between sessions`
set undofile
set undodir=~/.dotfiles/vim/undodir


" Folding
set nofoldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
" nnoremap <space> za
set foldmethod=indent   " fold based on indent level
hi Folded ctermbg=242
" This is especially useful for me since I spend my days in Python.
" Other acceptable values are marker, manual, expr, syntax, diff.
" Run :help foldmethod to find out what each of those do.


nnoremap <F9> :!clear && "%:p"<Enter>
"--------------------
"" Misc configurations
"--------------------


" Unbind some useless/annoying default key bindings.
map <C-a> <Nop>
map <C-x> <Nop>
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
" nnoremap <Left>  :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up>    :echoe "Use k"<CR>
" nnoremap <Down>  :echoe "Use j"<CR>

" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

"Makefile requires Tab must be Tab not 4 sapce
autocmd FileType make set noexpandtab

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <Down> <C-w>j
nnoremap <Up> <C-w>k
nnoremap <Left> <C-w>h
nnoremap <Right> <C-w>l

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" Jump to start and end of line using the home row keys
map H ^
map L $

" (Shift)Tab (de)indents code
vnoremap <Tab> >
vnoremap <S-Tab> <


" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz


"quick move between tabs"
nnoremap <C-Left> :tabprevious<CR>"
nnoremap <C-Right> :tabnext<CR>"

"fast insert a blank line in current line"
nnoremap <CR> o<Esc>

" toggle relative numbering
" nnoremap <C-n> :set rnu!<CR>
nnoremap <silent> <C-n> :call ToggleNumber()<CR>
fun! ToggleNumber() "{{{
	if exists('+relativenumber')
		:exec &nu==&rnu? "setl nu!" : "setl rnu!"
	else
		setl nu!
	endif
endf "}}}

" quick switch between paste mode
set pastetoggle=<F3>

" ctags for multi matches
nnoremap <C-]> g<C-]>
nnoremap <C-W>] <C-W>g]

" for copy and paste in different terminal | Awesome!!!!
vmap <leader>y :w! /tmp/vitmp<CR>
nmap <leader>p :r! cat /tmp/vitmp<CR>

" yank part of the line
nnoremap yu y$
nnoremap yt y0

" swap LHS and RHS
" nnoremap <leader>z :s/\([^=]*\)\s\+=\s\+\([^;]*\)/\2 = \1<CR>

"---------------------
" Macro configuration
"---------------------

" join two equations
let @j="^jf=wDkA, \<Esc>pj^dt=kt=i, \<Esc>pxjddkj^"

" Swap LHS and RHS
let @f= "^\"0dt=^wD^i \<Esc>pa \<Esc>A\<Esc>\"0px^hx"

"---------------------
" Plugin configuration
"---------------------

" nerdtree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Ale---------------------------
let g:ale_enabled = 0
"
" For quick startup  if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1

nnoremap <Leader>a :ALEToggle<CR>
" let g:ale_sign_warning = '▲'
" let g:ale_sign_error = '✗'
" highlight link ALEWarningSign String
" highlight link ALEErrorSign Title

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \}

"navigate between errors quickly"
nmap <silent> [a <Plug>(ale_previous_wrap)
nmap <silent> ]a <Plug>(ale_next_wrap)

" ctrlp
nnoremap ; :CtrlPBuffer<CR>
let g:ctrlp_switch_buffer = 0
let g:ctrlp_show_hidden = 1

let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" ctrlp function for delete buffer file (there is also an plugin but no need for me now https://github.com/d11wtq/ctrlp_bdelete.vim)

func! MyCtrlPMappings()
    nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
endfunc

func! s:DeleteBuffer()
    let line = getline('.')
    let bufid = line =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(line, '\d\+'))
        \ : fnamemodify(line[2:], ':p')
    exec "bd" bufid
    exec "norm \<F5>"
endfunc

" buffergator
let g:buffergator_suppress_keymaps = 1
nnoremap <Leader>b :BuffergatorToggle<CR>

" python-syntax
let g:python_highlight_all = 1


"Lightline
" --INSERT-- is unncessary because of lightline

let g:lightline = {
\ 'active': {
\   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified', 'gitbranch'] ],
\   'right': [['lineinfo'], ['percent' ],
\             [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok', 'filetype', 'fileencoding']]
\ },
\ 'component_function': {
\   'filename': 'LightlineFilename',
\   'gitbranch': 'FugitiveHead'
\ },
\ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }


function! LightlineFilename()
    return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" easymotion
map <Space> <Plug>(easymotion-prefix)

" incsearch
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

 " incsearch-easymotion
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)

" argwrap
nnoremap <Leader>w :ArgWrap<CR>

" fugitive
" set tags=./tags;/
set tags=./.tags;,.tags


" vim-cool |  Disables highlight when search is done
let g:CoolTotalMatches = 1

" u    -- Undo Tree toggle show
nnoremap <Leader>u :MundoToggle<CR>

" vim-gutentags

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" vim-signify
let g:signify_disable_by_default = 1
set updatetime=100
nnoremap <Leader>s :SignifyToggle<CR>

"---------------------
" Local customizations
"---------------------

"---------------------
" local customizations in ~/.vimrc_local
"---------------------
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif

"---------------------
"  quick insert breakpoint in Vim-python
"---------------------
func! s:SetBreakpoint()
    cal append('.', repeat(' ', strlen(matchstr(getline('.'), '^\s*'))) . 'import ipdb; ipdb.set_trace()')
endf

func! s:RemoveBreakpoint()
    exe 'silent! g/^\s*import\sipdb\;\?\n*\s*ipdb.set_trace()/d'
endf

func! s:ToggleBreakpoint()
    if getline('.')=~#'^\s*import\sipdb' | cal s:RemoveBreakpoint() | el | cal s:SetBreakpoint() | en
endf
nnoremap <F6> :call <SID>ToggleBreakpoint()<CR>

"---------------------
"  Using ripgrep with VIM CtrlP plugin
"---------------------
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
else
  let g:ctrlp_clear_cache_on_exit = 0
endif


"---------------------
" ag / ack.vim
"---------------------
command -nargs=+ Gag Gcd | Ack! <args>
nnoremap K :Gag "\b<C-R><C-W>\b"<CR>:cw<CR>
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

"---------------------
" vim-easyescape-plus
"---------------------
let g:easyescape_string = "jk"
let g:easyescape_timeout = 100
