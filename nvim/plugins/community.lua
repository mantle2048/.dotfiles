return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.pack.python"},
  { import = "astrocommunity.pack.yaml"},
  { import = "astrocommunity.pack.json"},
  { import = "astrocommunity.pack.bash"},
  { import = "astrocommunity.colorscheme.catppuccin"},
  { import = "astrocommunity.color.transparent-nvim"},
  { import = "astrocommunity.programming-language-support.csv-vim"},
}
