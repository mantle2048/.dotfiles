-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
  { import = "astrocommunity.colorscheme.catppuccin"},
  { import = "astrocommunity.fuzzy-finder.telescope-nvim" },
  { import = "astrocommunity.color.transparent-nvim"},
  { import = "astrocommunity.programming-language-support.csv-vim"},
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.python"},
  { import = "astrocommunity.pack.yaml"},
  { import = "astrocommunity.pack.json"},
  { import = "astrocommunity.pack.bash"},
}
