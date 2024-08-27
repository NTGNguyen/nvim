---@type NvPluginSpec
-- NOTE: AI chat
return {
  "yetone/avante.nvim",
  enabled = false,
  event = "VeryLazy",
  -- build = vim.fn.has "win32" == 0 and "make" or "powershell -ExecutionPolicy Bypass -File Build-LuaTiktoken.ps1", -- This is Optional, only if you want to use tiktoken_core to calculate tokens count
  opts = {
    -- add any opts here
    provider = "copilot",
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below is optional, make sure to setup it properly if you have lazy=true
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = {
          "markdown",
          "Avante",
        },
      },
      ft = {
        "markdown",
        "Avante",
      },
    },
    -- {
    --   "OXY2DEV/markview.nvim",
    --   ft = {
    --     "markdown",
    --     "Avante",
    --   },
    -- },
  },
}
