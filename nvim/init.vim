"
" ██╗███╗   ██╗██╗████████╗██╗   ██╗██╗███╗   ███╗
" ██║████╗  ██║██║╚══██╔══╝██║   ██║██║████╗ ████║
" ██║██╔██╗ ██║██║   ██║   ██║   ██║██║██╔████╔██║
" ██║██║╚██╗██║██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║
" ██║██║ ╚████║██║   ██║██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
" ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
"
"         @_mantle

" Sets {{{
set exrc
set relativenumber
set nu
set nohlsearch
set mouse=a
set hidden
set splitright
set splitbelow
set noerrorbells
set nowrap
set formatoptions-=t
set ignorecase
set smartcase
set noswapfile
set nobackup
set incsearch
set scrolloff=2
set noshowmode
set completeopt=menu,menuone,noselect
set number
set updatetime=50
set encoding=UTF-8
set clipboard+=unnamedplus " Copy paste between vim and everything else
set nojoinspaces " don't autoinsert two spaces after '.', '?', '!' for join command
set showcmd " extra info at end of command line
filetype plugin indent on

set nofoldenable          " disable folding when open
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" attempt to speed-up vim
set ttyfast
set lazyredraw
" }}}


" Adopted from vim {{{
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
set undodir=~/.dotfiles/nvim/undodir

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
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

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
nnoremap <silent> <A-n> :call ToggleNumber()<CR>
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
"}}}

" Custom Setting {{{
set guicursor=n-v-c-i:block
nnoremap <silent> <leader><leader> :source $MYVIMRC<CR>
" }}}

" Plugins {{{
call plug#begin('~/.dotfiles/vim/plugged')
" PlugInstall PlugClean PlugUpdate

" Plug 'rmagatti/auto-session'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'glepnir/dashboard-nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'ojroques/nvim-bufdel'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim'
Plug 'FooSoft/vim-argwrap'
Plug 'ojroques/vim-oscyank'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-unimpaired'

" Initialize plugin system
call plug#end()
" }}}

" Plug justinmk/vim-sneak {{{
map <space>f <Plug>Sneak_s
map <space>F <Plug>Sneak_S
" }}}

" Plug FooSoft/vim-argwrap {{{
nnoremap <Leader>w :ArgWrap<CR>
" }}}

" Plug glephir/dashboard-nvim {{{
let g:dashboard_default_executive ='telescope'
let g:dashboard_custom_shortcut={
\ 'last_session'       : 'SPC s l',
\ 'find_history'       : 'SPC f h',
\ 'find_file'          : 'SPC f f',
\ 'new_file'           : 'SPC n f',
\ 'change_colorscheme' : 'SPC c t',
\ 'find_word'          : 'SPC f g',
\ 'book_marks'         : 'SPC f m',
\ }
let s:header = [
    \ '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
    \ '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
    \ '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
    \ '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
    \ '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
    \ '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
    \ '',
    \ '                 [ @_mantle ]                 ',
    \ ]
let s:footer = []
let g:dashboard_custom_header = s:header
let g:dashboard_custom_footer = s:footer
" }}}


" kyazdani42/nvim-tree.lua {{{
lua << EOF
-- empty setup using defaults
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  ignore_ft_on_setup  = { 'startify', 'dashboard' },
  view = {
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
EOF
nnoremap <leader>n :NvimTreeToggle<CR>
"}}}


" nvim-telescope/telescope.nvim {{{
lua << EOF
local actions = require "telescope.actions"
local fb_actions = require "telescope".extensions.file_browser.actions
require('telescope').setup {
  defaults = {
    initial_mode = 'normal',
    file_ignore_patterns = { "yarn.lock" },
    path_display = { "smart" },
    sorting_strategy = "ascending",
    layout_config = {
      preview_width = 0.6
    },
    mappings = {
        n = {
          ["l"] = "select_default",
          ["q"] = "close",
          ["<space>"] = actions.toggle_selection + actions.move_selection_worse,
        }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case"
    },
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      path_display = { truncate = 3 },
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
          ['q'] = fb_actions.open,
          ['p'] = fb_actions.copy,
          ['x'] = fb_actions.remove,
          ['v'] = fb_actions.move,
          ['a'] = fb_actions.select_all,
          f = false,
        },
      },
    },
  },
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      theme = "ivy",
      mappings = {
        n = {
          ["<C-q>"] = "delete_buffer",
        }
      }
    },
    find_files = {
      theme = 'ivy',
      find_command = { "rg", "--ignore", "-L", "--hidden", "--files" }
    },
    grep_string = {
      theme = 'ivy',
    },
    live_grep = {
      theme = 'ivy',
    },
    git_status = {
      theme = 'ivy',
    },
    git_branches = {
      theme = 'ivy',
    },
    quickfix = {
      theme = 'ivy',
    },
  }
}
require('telescope').load_extension('fzf')
require("telescope").load_extension "file_browser"
EOF

nnoremap ; <cmd>Telescope buffers<cr>
nnoremap <C-p> :lua require'telescope.builtin'.find_files{}<cr>
nnoremap <C-n> :lua require 'telescope'.extensions.file_browser.file_browser( { path = vim.fn.expand('%:p:h') } )<CR>
nnoremap <C-f> :Telescope oldfiles theme=ivy<cr>
nnoremap <leader>fw :lua require('telescope.builtin').live_grep( { file_ignore_patterns = { '**/*.git' } } )<cr>
nnoremap <leader>gr :lua require('telescope.builtin').grep_string({search = vim.fn.input("Grep for > ") } )<cr>
nnoremap <Leader>gs :lua require'telescope.builtin'.git_status{}<cr>
nnoremap <Leader>gb :lua require'telescope.builtin'.git_branches{}<cr>
nnoremap <leader>ru :lua require'telescope.builtin'.resume{}<CR>
nnoremap <leader>qx :Telescope quickfix theme=ivy<cr>
nnoremap <leader>qh :lua require('telescope.builtin').quickfixhistory(require('telescope.themes').get_ivy{})<cr>
nnoremap <leader>jl :Telescope jumplist theme=ivy<cr>
nnoremap <leader>jm :Telescope marks theme=ivy<cr>
nnoremap <leader>reg :Telescope registers theme=ivy<cr>

"}}}


" nvim-treesitter {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "bash", "lua", "python"},
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true,
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true
  },
}
EOF
" }}}


lua << EOF
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}

local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "dracula",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { branch, diagnostics },
		lualine_b = { mode },
		lualine_c = {"filename"},
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { diff, spaces, "encoding", filetype },
		lualine_y = { location },
		lualine_z = { progress },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})

EOF

" Plug 'hoob3rt/lualine.nvim' {{{
" lua << EOF
" require('plenary.reload').reload_module('lualine', true)
" require('lualine').setup({
"   options = {
"     theme = 'dracula',
"     disabled_types = { 'NvimTree' }
"   },
"   sections = {
"     lualine_x = {},
"     -- lualine_y = {},
"     -- lualine_z = {},
"   }
" })
" EOF
" }}}
