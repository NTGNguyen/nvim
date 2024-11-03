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
    config = function()
      require "nvchad"
    end,
  },
  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
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
