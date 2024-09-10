---@type NvPluginSpec
-- NOTE: AI chat
return {
  "yetone/avante.nvim",
  enabled = true,
  build = vim.fn.has "win32" == 0 and "make" or "pwsh -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false", -- This is Optional, only if you want to use tiktoken_core to calculate tokens count, but may be required on Windows
  cmd = {
    "AvanteAsk",
    "AvanteRefresh",
    "AvanteEdit",
  },
  init = function()
    vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>AvanteAsk<cr>", { desc = "AI | Chat", silent = true })
    vim.keymap.set("v", "<leader>ar", "<cmd>AvanteRefresh<cr>", { desc = "AI | Refresh", silent = true })
    vim.keymap.set({ "n", "v" }, "<leader>ae", "<cmd>AvanteEdit<cr>", { desc = "AI | Edit", silent = true })
  end,
  opts = {
    provider = "copilot",
    behaviour = {
      auto_set_highlight_group = true,
      auto_set_keymaps = false,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = true,
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
