---@type NvPluginSpec
-- NOTE: Fully customizable previewer for LSP code actions.
return {
  "aznhe21/actions-preview.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    {
      "<leader>la",
      function()
        require("actions-preview").code_actions()
      end,
      mode = { "v", "n" },
      desc = "Action Preview | Open",
      silent = true,
    },
  },
  config = function()
    require("actions-preview").setup {
      highlight_command = vim.fn.has "win32" == 0 and { require("actions-preview.highlight").delta() } or nil,
    }
  end,
}
