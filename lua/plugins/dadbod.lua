---@type NvPluginSpec
-- NOTE: For database query and processing
return {
  {
    "kristijanhusak/vim-dadbod-ui",
    enabled = true,
    dependencies = {
      {
        "tpope/vim-dadbod",
      },
      {
        "kristijanhusak/vim-dadbod-completion",
        ft = {
          "sql",
          "mysql",
          "plsql",
        },
      },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      -- vim.g.db_ui_execute_on_save = 0

      vim.keymap.set("n", "<leader>ub", "<cmd>DBUIToggle<cr>", { desc = "Dadbod | Toggle UI", silent = true })
    end,
  },
}
