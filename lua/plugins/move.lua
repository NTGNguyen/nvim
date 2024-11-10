---@type NvPluginSpec
-- NOTE: Gain the power to move lines and blocks and auto-indent them!
return {
  "fedepujol/move.nvim",
  cmd = {
    "MoveBlock",
    "MoveHBlock",
    "MoveWord",
    "MoveLine",
  },
  init = function()
    -- Normal-mode commands
    vim.keymap.set("n", "<A-j>", "<cmd>MoveLine(1)<CR>", { desc = "Move | Line Down", noremap = true, silent = true })
    vim.keymap.set("n", "<A-k>", "<cmd>MoveLine(-1)<CR>", { desc = "Move | Line Up", noremap = true, silent = true })
    vim.keymap.set("n", "<A-l>", "<cmd>MoveWord(1)<CR>", { desc = "Move | Word Right", noremap = true, silent = true })
    vim.keymap.set("n", "<A-h>", "<cmd>MoveWord(-1)<CR>", { desc = "Move | Word Left", noremap = true, silent = true })

    -- Visual-mode commands
    vim.keymap.set("v", "<A-j>", "<cmd>MoveBlock(1)<CR>", { desc = "Move | Block Down", noremap = true, silent = true })
    vim.keymap.set("v", "<A-k>", "<cmd>MoveBlock(-1)<CR>", { desc = "Move | Block Up", noremap = true, silent = true })
    vim.keymap.set(
      "v",
      "<A-h>",
      "<cmd>MoveHBlock(-1)<CR>",
      { desc = "Move | Block Left", noremap = true, silent = true }
    )
    vim.keymap.set(
      "v",
      "<A-l>",
      "<cmd>MoveHBlock(1)<CR>",
      { desc = "Move | Block Right", noremap = true, silent = true }
    )
  end,
  config = true,
}
