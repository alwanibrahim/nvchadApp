vim.deprecate = function() end

-- Atau lebih spesifik, filter warning tertentu

-- =========================================================
-- NVChad base (WAJIB)
-- =========================================================
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local util = lspconfig.util

-- =========================================================
-- TYPESCRIPT / JAVASCRIPT (PAKAI ts_ls)
-- =========================================================
lspconfig.ts_ls.setup({
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  root_dir = util.root_pattern(
    "tsconfig.json",
    "package.json",
    ".git"
  ),
})

-- =========================================================
-- HTML
-- =========================================================
lspconfig.html.setup({
  filetypes = { "html" },
})

-- =========================================================
-- CSS
-- =========================================================
lspconfig.cssls.setup({
  filetypes = { "css", "scss", "less" },
})

-- =========================================================
-- TAILWIND CSS
-- =========================================================
lspconfig.tailwindcss.setup({
  filetypes = {
    "html",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  root_dir = util.root_pattern(
    "tailwind.config.js",
    "tailwind.config.cjs",
    "tailwind.config.ts",
    "postcss.config.js",
    "package.json",
    ".git"
  ),
  settings = {
    tailwindCSS = {
      classAttributes = {
        "class",
        "className",
        "class:list",
        "classList",
        "ngClass",
      },
      experimental = {
        classRegex = {
          "cn%(([^)]*)%)",
          "clsx%(([^)]*)%)",
        },
      },
      validate = true,
    },
  },
})
