
require("nvchad.configs.lspconfig").defaults()

-- DEFINE dulu
vim.lsp.config.tsserver = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "typescript",
    "typescriptreact",
    "javascript",
    "javascriptreact",
  },
  root_markers = { "package.json", "tsconfig.json", ".git" },
}

vim.lsp.config.html = {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  root_markers = { "package.json", ".git" },
}

vim.lsp.config.cssls = {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  root_markers = { "package.json", ".git" },
}

-- BARU enable
vim.lsp.enable({ "tsserver", "html", "cssls" })

vim.lsp.inlay_hint.enable(false)
