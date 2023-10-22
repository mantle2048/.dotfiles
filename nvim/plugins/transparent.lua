return { -- further customize the options set by the community
  "xiyaowong/transparent.nvim",
  opts = function(_, opts) --override the options using
    opts.exclude_groups = {
      "CursorLine"
    }
  end,
}
