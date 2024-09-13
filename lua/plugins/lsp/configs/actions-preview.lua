---@type NvPluginSpec
-- NOTE: Fully customizable previewer for LSP code actions.
return {
  "aznhe21/actions-preview.nvim",
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
}
