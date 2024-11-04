---@type NvPluginSpec
-- NOTE: For Database Querying and Processing
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
      vim.g.db_ui_execute_on_save = 0
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.vim_dadbod_completion_mark = ""

      vim.keymap.set("n", "<leader><C-d>", function()
        if vim.g.nvdash_displayed then
          require("nvchad.tabufline").close_buffer()
        end
        vim.cmd "DBUIToggle"
      end, { desc = "Dadbod | Toggle UI", silent = true })
    end,
  },
}
