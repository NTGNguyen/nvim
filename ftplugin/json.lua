if string.find(vim.bo.formatexpr, "conform") == nil and vim.fn.executable "jq" == 1 then
  vim.bo.formatexpr = ""
  vim.bo.formatprg = "jq"
end
