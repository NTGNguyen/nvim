---@type NvPluginSpec
-- NOTE: Marks
return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  enabled = true,
  init = function()
    vim.keymap.set("n", "<leader>ha", function()
      require("harpoon"):list():add()
      vim.notify("   Marked file", vim.log.levels.INFO, { title = "Harpoon" })
    end, { desc = "Harpoon | Add Mark" })

    vim.keymap.set("n", "<leader>hm", function()
      require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
    end, { desc = "Harpoon | Menu" })

    -- Uncomment below to enable navigation keymaps
    vim.keymap.set("n", "<leader>hl", function()
      require("harpoon"):list():next()
    end, { desc = "Harpoon | Next" })

    vim.keymap.set("n", "<leader>hh", function()
      require("harpoon"):list():prev()
    end, { desc = "Harpoon | Previous" })

    -- https://github.com/ThePrimeagen/harpoon/tree/harpoon2?tab=readme-ov-file#telescope
    local conf = require("telescope.config").values

    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set("n", "<leader>hf", function()
      toggle_telescope(require("harpoon"):list())
    end, { desc = "Harpoon | Find Telescope" })
  end,
  branch = "harpoon2",
  opts = {},
}
