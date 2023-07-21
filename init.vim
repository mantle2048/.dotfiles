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
set noshowmode
set completeopt=menu,menuone,noselect
set number
set updatetime=50
set encoding=UTF-8
" set clipboard+=unnamedplus " Copy paste between vim and everything else
set nojoinspaces " don't autoinsert two spaces after '.', '?', '!' for join command
set showcmd " extra info at end of command line

set nofoldenable          " disable folding when open
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set scl=auto

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
" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
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

set scrolloff=999 " show lines above and below cursor (when possible)

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
" nnoremap j gjzz
" nnoremap k gkzz
" nnoremap G Gzz

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

"---------------------
"  quick insert breakpoint in Vim-python (temporally abandoned since python-mode)
"---------------------
" func! s:SetBreakpoint()
"     cal append('.', repeat(' ', strlen(matchstr(getline('.'), '^\s*'))) . 'import ipdb; ipdb.set_trace()')
" endf
" 
" func! s:RemoveBreakpoint()
"     exe 'silent! g/^\s*import\sipdb\;\?\n*\s*ipdb.set_trace()/d'
" endf
" 
" func! s:ToggleBreakpoint()
"     if getline('.')=~#'^\s*import\sipdb' | cal s:RemoveBreakpoint() | el | cal s:SetBreakpoint() | en
" endf
" nnoremap <silent><F6> :call <SID>ToggleBreakpoint()<CR>

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

Plug 'rmagatti/auto-session'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'chrisbra/csv.vim'
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v1.*'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'ludovicchabant/vim-gutentags'
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
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'rmagatti/session-lens'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-unimpaired'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }

" Initialize plugin system
call plug#end()
" }}}

" Plug justinmk/vim-sneak {{{
map <space><space>w <Plug>Sneak_s
map <space><space>b <Plug>Sneak_S
let g:sneak#label = 1
" }}}

" Plug FooSoft/vim-argwrap {{{
nnoremap <Leader>w :ArgWrap<CR>
" }}}

" Plug 'ojroques/vim-oscyank' {{{
vnoremap <leader>c :OSCYank<CR>
" }}}


" kyazdani42/nvim-tree.lua {{{
lua << EOF
-- empty setup using defaults
-- require("nvim-tree").setup({
--   disable_netrw = false,
--   hijack_netrw = true,
--   hijack_cursor = true,
--   update_focused_file = {
--     enable = true,
--     update_cwd = false,
--   },
--   sort_by = "case_sensitive",
--   ignore_ft_on_setup  = { 'startify', 'dashboard' },
--   view = {
--     mappings = {
--       list = {
--         { key = "u", action = "dir_up" },
--       },
--     },
--   },
--   filters = {
--     dotfiles = true,
--   },
-- })
EOF
" nnoremap <leader>n :NvimTreeToggle<CR>
"}}}

" 'nvim-web-devicons'{{{
lua << EOF
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  xml = {
    icon = "",
  }
 };
}
EOF

" nvim-telescope/telescope.nvim {{{
lua << EOF
local actions = require "telescope.actions"
local fb_actions = require "telescope".extensions.file_browser.actions
require('telescope').setup {
  defaults = {
    initial_mode = 'normal',
    file_ignore_patterns = {".git/", ".cache", "%.o", "%.a", "%.out", "%.class",
		"%.pdf", "%.mkv", "%.mp4", "%.zip", "__pycache__","%.egg-info" },
    path_display = { "short" },
    previewer = true,
    mappings = {
        n = {
          ["l"] = "select_default",
          ["q"] = "close",
          -- ["<space><space>"] = actions.toggle_selection + actions.move_selection_worse,
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
      grouped = true,
      sorting_strategy = 'ascending',
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
          -- ['q'] = fb_actions.open,
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
      previewer = false,
      show_all_buffers = true,
      sort_lastused = true,
      theme = "ivy",
      layout_config = {
        preview_width = 0.6
      },
      mappings = {
        n = {
          ["<C-q>"] = "delete_buffer",
        }
      }
    },
    find_files = {
      theme = 'ivy',
      layout_config = {
        preview_width = 0.6
      },
      find_command = { "rg", "--ignore", "-L", "--files" }
    },
    grep_string = {
      layout_config = {
        preview_width = 0.6
      },
      theme = 'ivy',
    },
    live_grep = {
      layout_config = {
        preview_width = 0.6
      },
      theme = 'ivy',
    },
    git_status = {
      layout_config = {
        preview_width = 0.6
      },
      theme = 'ivy',
    },
    git_branches = {
      layout_config = {
        preview_width = 0.6
      },
      theme = 'ivy',
    },
    quickfix = {
      layout_config = {
        preview_width = 0.6
      },
      theme = 'ivy',
    },
  }
}
require('telescope').load_extension('fzf')
require("telescope").load_extension "file_browser"
require("telescope").load_extension("session-lens")
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
nnoremap <leader>qh :lua require('telescope.builtin').quickfixhistory(require('telescope.themes').get_ivy{})<cr>
nnoremap <leader>qx :Telescope quickfix theme=ivy<CR>
nnoremap <leader>jl :Telescope jumplist theme=ivy<cr>
nnoremap <leader>jm :Telescope marks theme=ivy<cr>
nnoremap <leader>reg :Telescope registers theme=ivy<cr>

"}}}

" nvim-treesitter {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "bash", "lua", "python", "yaml"},
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true,
    disable = { "vim" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true
  },
  indent = { enable = true, disable = { "yaml", "python" } },
  context_commentstring = {
    enable = true
  },
}
EOF
" }}}


" Plug 'hoob3rt/lualine.nvim' {{{
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
        component_separators = { left = '|', right = '|'},
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { branch, diagnostics },
		lualine_b = { mode },
		lualine_c = {"filename"},
		lualine_x = { diff, spaces, "encoding", filetype },
		lualine_y = { "location" },
		lualine_z = { "progress" },
	},
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
	tabline = {},
	extensions = {},
})
EOF
" }}}

" Plug 'windwp/nvim-autopairs' {{{
lua << EOF
-- Setup nvim-cmp.
local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

npairs.setup {
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = false,
  },
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0, -- Offset from pattern match
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "LineNr",
  },
}
EOF

" 'akinsho/nvim-bufferline.lua' {{{
" https://github.com/girishji/config/blob/main/nvim/lua/user/bufferline.lua
lua << EOF
local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

local color1 = 2
local color2 = 4
local color3 = 3


bufferline.setup {
  options = {
    numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator = { style = 'icon', icon = "▎"},
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 30,
    max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics = false, -- | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "("..count..")"
    end,
    offsets = { { filetype = "NvimTree", text = "File Explorer", padding = 1 } },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    -- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
    --   -- add custom logic
    --   return buffer_a.modified > buffer_b.modified
    -- end
  },
  highlights = {
    fill = {
    },
    buffer_selected = {
      ctermbg = color2,
    },
    buffer_visible = {
      ctermbg = color1,
    },
    close_button_selected = {
      ctermbg = color2,
    },
    close_button_visible = {
      ctermbg = color1,
    },
    separator_selected = {
      ctermbg = color2,
    },
    separator_visible = {
      ctermbg = color1,
    },
    indicator_selected = {
      ctermbg = color2,
    },
    indicator_visible = {
      ctermbg = color1,
    },
    modified_selected = {
      ctermbg = color2,
    },
    modified_visible = {
      ctermbg = color1,
    },
    pick_selected = {
      ctermbg = color2,
      bold = true,
      italic = true,
    },
    pick_visible = {
      ctermbg = color1,
      bold = true,
      italic = true,
    },
  }
}
EOF

lua << EOF
require('bufdel').setup {
  next = 'cycle',  -- or 'alternate'
  quit = true,
}
EOF
nnoremap <silent> <space>jj :BufferLinePick<CR>
nnoremap <silent> <space>l :BufferLineCycleNext<CR>
nnoremap <silent> <space>h :BufferLineCyclePrev<CR>
nnoremap <silent> <space><right> :BufferLineMoveNext<CR>
nnoremap <silent> <space><left> :BufferLineMovePrev<CR>
nnoremap <space>d :BufDel<CR>
" }}}

" 'indentline.lua' {{{
lua << EOF
local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_filetype_exclude = {
	"help",
	"startify",
	"dashboard",
	"packer",
	"neogitstatus",
	"NvimTree",
	"Trouble",
}
vim.g.indentLine_enabled = 1
vim.g.indent_blankline_char = "▏"
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = true
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_patterns = {
	"class",
	"return",
	"function",
	"method",
	"^if",
	"^while",
	"jsx_element",
	"^for",
	"^object",
	"^table",
	"block",
	"arguments",
	"if_statement",
	"else_clause",
	"jsx_element",
	"jsx_self_closing_element",
	"try_statement",
	"catch_clause",
	"import_statement",
	"operation_type",
}
-- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
vim.wo.colorcolumn = "99999"

indent_blankline.setup({
	show_current_context = true,
})
EOF
" }}}


" 'auto-session.lua' {{{
lua << EOF

-- local session_saved_dir = vim.fn.getcwd().."/.sessions/"
-- 
-- if vim.fn.isdirectory(session_saved_dir) == 0 then
--     vim.fn.mkdir(session_saved_dir, 'p')
-- end

local opts = {
  log_level = 'info',
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
  auto_session_enabled = false,
  auto_save_enabled = nil,
  auto_restore_enabled = nil,
  auto_session_suppress_dirs = nil,
  auto_session_use_git_branch = nil,
  -- the configs below are lua only
  bypass_session_save_file_types = nil
}

require('auto-session').setup(opts)

local SessionLensActions = require("telescope._extensions.session-lens.session-lens-actions")
require('session-lens').setup {
  theme = 'ivy',
  path_display = {'smart'},
  previewer = true,
}
EOF
nnoremap <leader>ss :lua require('auto-session').SaveSession(require('auto-session').get_root_dir() .. vim.fn.input('SavedSessionName > ')) <CR>
nnoremap <leader>ls :Telescope session-lens search_session<CR>
" }}}


" Plug vim-gutentags {{{

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

" 忽略gitinore中的文件
let g:gutentags_file_list_command = {
      \ 'markers': {
      \ '.git': 'bash -c "git ls-files; git ls-files --others --exclude-standard"',
      \ },
      \ }
" }}}


" Plug 'Vimjas/vim-python-pep8-indent'{{{
let g:python_pep8_indent_multiline_string = 1
let g:python_pep8_indent_hang_closing = 1
" }}}

" Plug 'python-mode/python-mode'{{{
"
nnoremap <silent> <leader>n :exe "set signcolumn=" .. (&signcolumn == "yes" ? "no" : "yes")<CR>

" Lint settings
nnoremap <leader>li :PymodeLint<CR>
nnoremap <leader>8 :PymodeLintAuto<CR>

let g:pymode_lint_on_write = 0
let g:pymode_lint_message = 1

let g:pymode_python = 'python3'

let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace()'
let g:pymode_breakpoint_bind = '<F6>'

" remove the annoying red line
let g:pymode_options_colorcolumn = 0
" au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

let g:pymode_lint_ignore = ["E501", "W0612", "E702"]
" C0111,W0621,E501,F0002

" let g:pymode_lint_select = ["W0011", "W430"]

" Other setttings
let g:pymode_doc = 0

let g:pymode_run = 0

let g:pymode_rope = 0

let g:pymode_rope_completion = 0

let g:pymode_virtualenv = 0

let g:pymode_rope_goto_definition_bind = 'gD'

let g:pymode_syntax = 0

let g:pymode_motion = 0
" }}}

" Plug 'heavenshell/vim-pydocstring'{{{
let g:pydocstring_formatter = 'google'
let g:pydocstring_doq_path = '~/.dotfiles/vim/plugged/vim-pydocstring/lib/doq'
" }}}
