-- NOTE: Utilities
local M = {}

M.git = function()
  local status_ok, _ = pcall(require, "toggleterm")
  if not status_ok then
    return vim.notify "toggleterm.nvim isn't installed!!!"
  end

  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new { cmd = "lazygit", hidden = true }
  lazygit:toggle()
end

-- HUUUUUUUUUUUUUUUUUUUUUUUGE kudos and thanks to
-- https://github.com/hown3d for this function <3
M.substitute = function(cmd)
  cmd = cmd:gsub("%%", vim.fn.expand "%")
  cmd = cmd:gsub("$fileBase", vim.fn.expand "%:r")
  cmd = cmd:gsub("$filePath", vim.fn.expand "%:p")
  cmd = cmd:gsub("$file", vim.fn.expand "%")
  cmd = cmd:gsub("$dir", vim.fn.expand "%:p:h")
  cmd = cmd:gsub("#", vim.fn.expand "#")
  cmd = cmd:gsub("$altFile", vim.fn.expand "#")

  return cmd
end

M.run_code = function()
  local file_extension = vim.fn.expand "%:e"
  local selected_cmd = ""
  local term_cmd = "bot 20 new | term "
  local supported_filetypes = {
    c = {
      default = "gcc % -o $fileBase && $fileBase",
      debug = "gcc -g % -o $fileBase && $fileBase",
    },
    cpp = {
      gcc_single = "g++ % -o $fileBase && $fileBase",
      gcc_single_debug = "g++ -g % -o $fileBase",
      gcc_multiple = "g++ -o $fileBase ./*.cpp && $fileBase",
      gcc_multiple_debug = "g++ -g -o $fileBase ./*.cpp && $fileBase",
      gcc_multiple_structure = "g++ -o $fileBase ./src/*.cpp -I ./include && $fileBase",
      gcc_multiple_structure_debug = "g++ -g -o $fileBase ./src/*.cpp -I ./include && $fileBase",
      clang_single = "clang++ % -o $fileBase && $fileBase",
      clang_single_debug = "clang++ -g % -o $fileBase",
      clang_multiple = "clang++ -o $fileBase ./*.cpp && $fileBase",
      clang_multiple_debug = "clang++ -g -o $fileBase ./*.cpp && $fileBase",
      clang_multiple_structure = "clang++ -o $fileBase ./src/*.cpp -I ./include && $fileBase",
      clang_multiple_structure_debug = "clang++ -g -o $fileBase ./src/*.cpp -I ./include && $fileBase",
      -- competitive = "g++ -std=c++17 -Wall -DAL -O2 % -o $fileBase && $fileBase<input.txt",
      -- competitive = "g++ -std=c++17 -Wall -DAL -O2 % -o $fileBase && $fileBase",
    },
    cs = {
      default = "dotnet run --project $dir",
    },
    go = {
      default = "go run %",
    },
    html = {
      default = "brave %", -- NOTE: Change this based on your browser that you use
    },
    java = {
      default = "java %",
    },
    jl = {
      default = "julia %",
    },
    js = {
      default = "node %",
      debug = "node --inspect %",
    },
    lua = {
      default = "lua %",
    },
    php = {
      default = "php %",
    },
    pl = {
      default = "perl %",
    },
    ps1 = {
      default = vim.fn.executable "pwsh" == 1 and "pwsh %" or "powershell %",
    },
    py = {
      default = vim.fn.executable "python" == 1 and "python %" or "python3 %",
    },
    r = {
      default = "Rscript %",
    },
    rb = {
      default = "ruby %",
    },
    rs = {
      default = "rustc % && $fileBase",
    },
    sh = {
      default = "bash %",
    },
    ts = {
      default = "tsc % && node $fileBase",
    },
  }

  if supported_filetypes[file_extension] then
    local choices = vim.tbl_keys(supported_filetypes[file_extension])

    if #choices == 0 then
      vim.notify("It doesn't contain any command", vim.log.levels.WARN, { title = "Code Runner" })
    elseif #choices == 1 then
      selected_cmd = supported_filetypes[file_extension][choices[1]]
      vim.cmd(term_cmd .. M.substitute(selected_cmd))
    else
      vim.ui.select(choices, { prompt = "Choose a command: " }, function(choice)
        selected_cmd = supported_filetypes[file_extension][choice]
        if selected_cmd then
          vim.cmd(term_cmd .. M.substitute(selected_cmd))
        end
      end)
    end
  else
    vim.notify("The filetype isn't included in the list", vim.log.levels.WARN, { title = "Code Runner" })
  end
end

return M
