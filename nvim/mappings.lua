-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local utils = require "astronvim.utils"
local get_icon = utils.get_icon
local is_available = utils.is_available
local ui = require "astronvim.utils.ui"

local maps = require("astronvim.utils").empty_map_table()

local sections = {
  f = { desc = get_icon("Search", 1, true) .. "Find" },
  p = { desc = get_icon("Package", 1, true) .. "Packages" },
  l = { desc = get_icon("ActiveLSP", 1, true) .. "LSP" },
  u = { desc = get_icon("Window", 1, true) .. "UI/UX" },
  b = { desc = get_icon("Tab", 1, true) .. "Buffers" },
  bs = { desc = get_icon("Sort", 1, true) .. "Sort Buffers" },
  d = { desc = get_icon("Debugger", 1, true) .. "Debugger" },
  g = { desc = get_icon("Git", 1, true) .. "Git" },
  S = { desc = get_icon("Session", 1, true) .. "Session" },
  t = { desc = get_icon("Terminal", 1, true) .. "Terminal" },
}

return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    -- ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    -- ["<leader>bD"] = {
    --   function()
    --     require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
    --   end,
    --   desc = "Pick to close",
    -- },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    -- ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    -- Standard Operations
    ["<leader>w"] = false,
    ["<leader>q"] = false,
    ["<C-s>"] = false,
    ["<C-q>"] = false,
    ["|"] = false,
    ["\\"] = false,
    ["yu"] = "y$",
    ["yt"] = "y0",
    ["@j"] = "^jf=wDkA, <Esc>pj^dt=kt=i, <Esc>pxjddkj^",
    ["@f"] = "^\"0dt=^wD^i <Esc>pa <Esc>A<Esc>\"0px^hx",
    ["<CR>"] = "o<Esc>",
    ["H"] = "^",
    ["L"] = "$",

    ["<F6>"] = { function() require('user.utils').toggleDebugLine() end, desc = "Toggle ipdb breakpoint" },
    -- Manage Buffers
    ["<space>d"] = { function() require("astronvim.utils.buffer").close() end, desc = "Close buffer" },
    ["<space>D"] = { function() require("astronvim.utils.buffer").close(0, true) end, desc = "Force close buffer" },
    ["<space>l"] =
      { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" },
    ["<space>h"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    ["<space><right>"] = {
      function() require("astronvim.utils.buffer").move(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Move buffer tab right",
    },
    ["<space><left>"] = {
      function() require("astronvim.utils.buffer").move(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Move buffer tab left",
    },

    ["<space>b"] = sections.b,
    ["<space>bc"] =
      { function() require("astronvim.utils.buffer").close_all(true) end, desc = "Close all buffers except current" },
    ["<space>bC"] = { function() require("astronvim.utils.buffer").close_all() end, desc = "Close all buffers" },
    ["<space>jj"] = {
      function()
        require("astronvim.utils.status.heirline").buffer_picker(function(bufnr) vim.api.nvim_win_set_buf(0, bufnr) end)
      end,
      desc = "Select buffer from tabline",
    },
    ["<space>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<space>kk"] = {
      function()
        require("astronvim.utils.status.heirline").buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Close buffer from tabline",
    },
    ["<space>bl"] =
      { function() require("astronvim.utils.buffer").close_left() end, desc = "Close all buffers to the left" },
    ["<space>o"] = { function() require("astronvim.utils.buffer").prev() end, desc = "Previous buffer" },
    ["<space>br"] =
      { function() require("astronvim.utils.buffer").close_right() end, desc = "Close all buffers to the right" },
    ["<space>bs"] = sections.bs,
    ["<space>bse"] = { function() require("astronvim.utils.buffer").sort "extension" end, desc = "By extension" },
    ["<space>bsr"] =
      { function() require("astronvim.utils.buffer").sort "unique_path" end, desc = "By relative path" },
    ["<space>bsp"] = { function() require("astronvim.utils.buffer").sort "full_path" end, desc = "By full path" },
    ["<space>bsi"] = { function() require("astronvim.utils.buffer").sort "bufnr" end, desc = "By buffer number" },
    ["<space>bsm"] = { function() require("astronvim.utils.buffer").sort "modified" end, desc = "By modification" },
    ["<space>b\\"] = {
      function()
        require("astronvim.utils.status.heirline").buffer_picker(function(bufnr)
          vim.cmd.split()
          vim.api.nvim_win_set_buf(0, bufnr)
        end)
      end,
      desc = "Horizontal split buffer from tabline",
    },
    ["<space>b|"] = {
      function()
        require("astronvim.utils.status.heirline").buffer_picker(function(bufnr)
          vim.cmd.vsplit()
          vim.api.nvim_win_set_buf(0, bufnr)
        end)
      end,
      desc = "Vertical split buffer from tabline",
    },

    -- Navigate tabs
    ["<C-RIGHT>"] = { function() vim.cmd.tabnext() end, desc = "Next tab" },
    ["<C-LEFT>"] = { function() vim.cmd.tabprevious() end, desc = "Previous tab" },

    -- NeoTree
    ["<C-n>"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },

    -- Comment
    ["<space><space>"] = {
      function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Toggle comment line"
    },

  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    -- ['<leader>c'], require('osc52').copy_visual)
  },
  v = {
    -- nvim-osc52
    ["<leader>c"] = { function() require('osc52').copy_visual() end, desc = "Copy Given Text in Normal" },
    ["<space><space>"] = {
      "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
      desc = "Toggle comment for selection"
    },
    ["H"] = "^",
    ["L"] = "$",
  }
}
