local util = require "lspconfig.util"
local root_files = {
  "pyproject.toml",
  "setup.py",
  "setup.cfg",
  "requirements.txt",
  "Pipfile",
  "pyrightconfig.json",
  "main.py"
}
opts.root_dir = util.root_pattern(unpack(root_files))
return opts
