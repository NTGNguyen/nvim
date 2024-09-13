return {
  -- NOTE: Just attach tailwindcss LSP when match one of below file
  root_dir = function(fname)
    print(fname)
    return require("lspconfig.util").root_pattern(
      "tailwind.config.js",
      "tailwind.config.cjs",
      "tailwind.config.mjs",
      "tailwind.config.ts",
      "postcss.config.js",
      "postcss.config.cjs",
      "postcss.config.mjs",
      "postcss.config.ts"
    )(fname)
  end,
  settings = {
    tailwindCSS = {
      -- classAttributes = { "class", "className", "ngClass" },
      experimental = {
        classRegex = {
          "tw`([^`]*)", -- tw`...`
          "tw='([^']*)", -- <div tw="..." />
          "tw={`([^`}]*)", -- <div tw={"..."} />
          "tw\\.\\w+`([^`]*)", -- tw.xxx`...`
          "tw\\(.*?\\)`([^`]*)", -- tw(component)`...`
          "styled\\(.*?, '([^']*)'\\)",
          { "cn\\(([^)]*)\\)", "(?:'|\"|`)([^\"'`]*)(?:'|\"|`)" },
          { "clsx\\(([^]*)\\)", "(?:'|\"|`)([^\"'`]*)(?:'|\"|`)" },
          { "(?:twMerge|twJoin)\\(([^\\);]*)[\\);]", "[`'\"`]([^'\"`,;]*)[`'\"`]" },
          { "{([\\s\\S]*)}", ":\\s*['\"`]([^'\"`]*)['\"`]" },
        },
      },
    },
  },
}
