---@type NvPluginSpec
-- NOTE: NvChad Color Picker
return {
  "NvChad/minty",
  dependencies = {
    "nvchad/volt",
  },
  keys = {
    {
      "<leader>uh",
      function()
        require("minty.huefy").toggle()
      end,
      desc = "Minty | Toggle Huefy",
      silent = true,
    },
    {
      "<leader>us",
      function()
        require("minty.shades").toggle()
      end,
      desc = "Minty | Shades Huefy",
      silent = true,
    },
  },
}
