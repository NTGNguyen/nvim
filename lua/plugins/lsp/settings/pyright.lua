return {
  settings = {
    python = {
      analysis = {
        -- If use ruff, uncomment
        -- ignore = { "*" },
        typeCheckingMode = "standard",
        diagnosticMode = "workspace",
      },
    },
    pyright = {
      -- If use Ruff's import organizer, uncomment
      disableOrganizeImports = true,
    },
  },
}
