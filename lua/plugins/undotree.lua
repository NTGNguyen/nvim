---@type NvPluginSpec
return {
  "mbbill/undotree",
  cmd = {
    "UndotreeToggle",
  },
  init = function()
    vim.keymap.set("n", "<leader>uu", "<cmd>UndotreeToggle<cr>", { desc = "Undotree | Toggle", silent = true })
  end,
}
