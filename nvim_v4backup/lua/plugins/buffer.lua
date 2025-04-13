-- Customize buffer ops

---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          -- second key is the lefthand side of the map
          -- tables with just a `desc` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          ["<space>b"] = { desc = "Buffers" },
          ["<space>bs"] = { desc = "Buffers Sort" },
          -- Manage Buffers
          ["<space>l"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          ["<space>h"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
          ["<space>d"] = { function() require("astrocore.buffer").close() end, desc = "Close buffer" },
          ["<space>D"] = { function() require("astrocore.buffer").close(0, true) end, desc = "Force close buffer" },
          ["<space><left>"] = { function() require("astrocore.buffer").move(-vim.v.count1) end, desc = "Move buffer tab left"},
          ["<space><right>"] = { function() require("astrocore.buffer").move(vim.v.count1) end, desc = "Move buffer tab right"},

          ["<space>bc"] = { function() require("astrocore.buffer").close_all(true) end, desc = "Close all buffers except current" },
          ["<space>bC"] = { function() require("astrocore.buffer").close_all() end, desc = "Close all buffers" },
          ["<space>jj"] = {
            function()
              require("astroui.status.heirline").buffer_picker(
                function(bufnr) vim.api.nvim_win_set_buf(0, bufnr) end)
            end,
            desc = "Select buffer from tabline",
          },
          ["<space>bD"] = {
            function()
              require("astroui.status.heirline").buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },
          ["<space>bl"] =
            { function() require("astrocore.buffer").close_left() end, desc = "Close all buffers to the left" },
          ["<space>o"] = { function() require("astrocore.buffer").prev() end, desc = "Previous buffer" },

          ["<space>br"] =
            { function() require("astrocore.buffer").close_right() end, desc = "Close all buffers to the right" },
          ["<space>bse"] = { function() require("astrocore.buffer").sort "extension" end, desc = "By extension" },
          ["<space>bsr"] =
            { function() require("astrocore.buffer").sort "unique_path" end, desc = "By relative path" },
          ["<space>bsp"] = { function() require("astrocore.buffer").sort "full_path" end, desc = "By full path" },
          ["<space>bsi"] = { function() require("astrocore.buffer").sort "bufnr" end, desc = "By buffer number" },
          ["<space>bsm"] = { function() require("astrocore.buffer").sort "modified" end, desc = "By modification" },
          ["<space>b\\"] = {
            function()
              require("astroui.status.heirline").buffer_picker(function(bufnr)
                vim.cmd.split()
                vim.api.nvim_win_set_buf(0, bufnr)
              end)
            end,
            desc = "Horizontal split buffer from tabline",
          },
          ["<space>b|"] = {
            function()
              require("astroui.status.heirline").buffer_picker(function(bufnr)
                vim.cmd.vsplit()
                vim.api.nvim_win_set_buf(0, bufnr)
              end)
            end,
            desc = "Vertical split buffer from tabline",
          },
        },
      },
    },
  },
}
