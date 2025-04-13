-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        swapfile = false, -- Disable swap file
        showmode = true, -- Disable showing modes in command line
        clipboard = "", -- Connection to the system clipboard
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- standard operations
        ["<leader>w"] = false,
        ["<leader>q"] = false,
        ["<C-s>"] = false,
        ["<C-q>"] = false,
        ["|"] = false,
        ["\\"] = false,
        ["yu"] = "y$",
        ["yt"] = "y0",
        ["@j"] = "^jf=wDkA, <Esc>pj^dt=kt=i, <Esc>pxjddkj^",
        ["@f"] = '^"0dt=^wD^i <Esc>pa <Esc>A<Esc>"0px^hx',
        ["<CR>"] = "o<Esc>",
        ["<C-p>"] = "<CR>",
        ["H"] = "^",
        ["L"] = "$",
        -- Navigate tabs
        ["<space>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        ["<C-RIGHT>"] = { function() vim.cmd.tabnext() end, desc = "Next tab" },
        ["<C-LEFT>"] = { function() vim.cmd.tabprevious() end, desc = "Previous tab" },
        -- insert ipdb breakpoint
        ["<F6>"] = { function() require("utils").toggleDebugLine() end, desc = "Toggle ipdb breakpoint" },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
        ["<space><space>"] = { "gcc", remap = true, desc = "Toggle comment line" },
      },
      v = {
        -- nvim-osc52
        ["<leader>c"] = { function() require("osc52").copy_visual() end, desc = "Copy Given Text in Normal" },
        ["H"] = "^",
        ["L"] = "$",
        ["<space><space>"] = { "gc", remap = true, desc = "Toggle comment" },
      },
    },
  },
}
