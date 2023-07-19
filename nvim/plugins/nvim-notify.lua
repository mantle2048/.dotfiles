return {
  "rcarriga/nvim-notify",
  config = function(plugin, opts)
    require("plugins.configs.notify")(plugin, opts)
    local notify = require "notify"
    notify.setup({
      background_colour = "#181825"
    })
  end,
}

