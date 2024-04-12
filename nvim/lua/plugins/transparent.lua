return {
  "xiyaowong/transparent.nvim",
  lazy = false,
  config = function()
    local transparent = require "transparent"
    transparent.setup {
      extra_groups = {
        "NormalFloat",
        "NvimTreeNormal",
      },
      exclude_groups = {
        "CursorLine",
        "NeoTreeCursorLine",
      },
    }
    transparent.clear_prefix "NeoTree"
    -- transparent.clear_prefix "BufferLine"
    -- transparent.clear_prefix "StatusLine"
    -- transparent.clear_prefix "lualine"
  end,
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>uT"] = { "<Cmd>doautocmd ColorScheme<CR>", desc = "Refresh ColorScheme" },
          },
        },
      },
    },
  },
}
