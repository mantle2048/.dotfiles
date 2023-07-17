return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local actions = require "telescope.actions"
      opts.defaults.initial_mode = 'normal'
      opts.defaults.mappings.n.l = actions.select_default

      -- return the final configuration table
      return opts
    end,
  },
}
