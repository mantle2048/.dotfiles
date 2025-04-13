-- Customize neo-tree

---@type LazySpec
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        follow_current_file = { enabled = true },
      },
    },
  },
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<C-n>"] = { "<Cmd>Neotree toggle<CR>", desc = "Toggle Explorer" },
        },
      },
    },
  },
}
