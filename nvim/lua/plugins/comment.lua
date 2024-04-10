-- Customize comment

---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<space><space>"] = {
            function() require("Comment.api").toggle.linewise.count(vim.v.count1) end,
            desc = "Toggle comment line",
          },
        },
        v = {
          ["<space><space>"] = {
            "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
            desc = "Toggle comment for selection"
          },
        }
      },
    },
  },
}
