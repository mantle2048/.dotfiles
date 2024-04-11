-- Customize pyright lsp

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    config = {
      -- the key is the server name to configure
      -- the value is the configuration table
      pyright = {
        settings = {
          python = {
            analysis = {
              diagnosticSeverityOverrides = {
                reportIncompatibleMethodOverride = false,
              },
            },
          },
        },
      },
    },
  },
}
