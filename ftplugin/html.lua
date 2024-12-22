local conform_ok, _ = pcall(require, "conform")
if conform_ok then
  vim.bo.formatexpr = "v:lua.require'conform'.formatexpr()"
end
