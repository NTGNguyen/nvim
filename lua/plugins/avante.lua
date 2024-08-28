---@type NvPluginSpec
-- NOTE: AI chat
return {
  "yetone/avante.nvim",
  enabled = true,
  build = false
    and (
      vim.fn.has "win32" == 0 and (vim.fn.executable "make" and "make" or false)
      or "powershell -ExecutionPolicy Bypass -File Build-LuaTiktoken.ps1"
    ), -- This is Optional, only if you want to use tiktoken_core to calculate tokens count
  keys = {
    {
      "<leader>ac",
      "<cmd>AvanteAsk<cr>",
      desc = "Avante | Chat",
      silent = true,
    },
    {
      "<leader>ar",
      "<cmd>AvanteRefresh<cr>",
      desc = "Avante | Refresh",
      silent = true,
    },
    {
      "<leader>ar",
      "<cmd>AvanteEdit<cr>",
      desc = "Avante | Edit",
      silent = true,
    },
  },
  opts = {
    provider = "copilot",
    mappings = {
      ask = "_",
      edit = "_",
      refresh = "_",
      toggle = {
        debug = "_",
        hint = "_",
      },
    },
    hints = {
      enabled = true,
    },
    windows = {
      width = 50,
    },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "OXY2DEV/markview.nvim",
  },
}
