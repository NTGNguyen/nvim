local get_gcc_path = function()
  local gcc_path = vim.fn.fnamemodify(vim.fn.exepath "gcc", ":h")
  if gcc_path == "." then
    return nil
  end
  return gcc_path .. "*"
end

local gcc_path = get_gcc_path()

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
    gcc_path ~= nil and "--query-driver=" .. gcc_path or nil,
    "--inlay-hints=true",
    "--function-arg-placeholders",
    "--header-insertion=iwyu",
  },
}
