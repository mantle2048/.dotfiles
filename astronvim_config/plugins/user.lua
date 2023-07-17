return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
	  "FooSoft/vim-argwrap",
	  lazy = false,
	  config = function()
	    vim.cmd[[ nnoremap <Leader>w :ArgWrap<CR> ]]
	  end
  },
  "ojroques/nvim-osc52",
}
