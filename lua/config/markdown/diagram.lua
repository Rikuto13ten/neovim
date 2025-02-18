require("diagram").setup({
  integrations = {
    require("diagram.integrations.markdown"),
    require("diagram.integrations.neorg"),
  },
  renderer_options = {
    d2 = {
      theme_id = 1,
      dark_theme_id = 200,
      scale = -1,
      layout = nil,
      sketch = nil,
    },
  },
})
