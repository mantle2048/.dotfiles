return { -- further customize the options set by the community
  "xiyaowong/transparent.nvim",
  config = function(_, config)
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
    transparent.clear_prefix "BufferLine"
    transparent.clear_prefix "lualine"
  end,
}
