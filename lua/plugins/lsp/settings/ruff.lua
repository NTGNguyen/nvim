return {
  on_attach = function(client, bufnr)
    require("plugins.lsp.opts").on_attach(client, bufnr)
    client.server_capabilities.hoverProvider = false
  end,
}
