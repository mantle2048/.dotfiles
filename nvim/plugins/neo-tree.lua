return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.filesystem.follow_current_file.enabled = false
      -- return the final configuration table
      return opts
    end,
  },
}
