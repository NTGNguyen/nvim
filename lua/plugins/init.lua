---@type NvPluginSpec
-- NOTE: Default Plugins
return {
  -- NvChad Default Terminal
  {
    "NvChad/nvterm",
    enabled = false,
  },
  {
    "NvChad/ui",
  },
  { "nvchad/volt" },
  {
    "nvchad/minty",
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
  },
}
