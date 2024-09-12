-- NOTE: Path g++:
-- - Choco: "C:/ProgramData/mingw64/mingw64/bin/g*.exe"
-- - Scoop: "C:/Users/kevinnitro/scoop/apps/mingw/current/bin/g++.exe"
local gcc_path = vim.fn.has "win32" == 0 and "/usr/bin/g*" or "C:/Users/kevinnitro/scoop/apps/mingw/current/bin/g*.exe"

return {
  capabilities = {
    documentFormattingProvider = false,
    documentRangeFormattingProvider = false,
  },
  cmd = {
    "clangd",
    "--all-scopes-completion",
    -- "--suggest-missing-includes",
    -- "--background-index",
    -- "--pch-storage=disk",
    -- "--cross-file-rename",
    -- "--log=info",
    -- "--completion-style=detailed",
    "--enable-config", -- clangd 11+ supports reading from .clangd configuration file
    "--clang-tidy",
    "--offset-encoding=utf-16",
    -- "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
    "--fallback-style=Microsoft",
    -- "--header-insertion=never",
    -- "--query-driver=<list-of-white-listed-complers>"
    "--query-driver=" .. gcc_path,
    "--inlay-hints=true",
    "--function-arg-placeholders",
    "--header-insertion=iwyu",
  },
}
