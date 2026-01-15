
local options = {
  formatters_by_ft = {
    -- core
    lua = { "stylua" },

    -- web
    html = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    markdown = { "prettier" },
    yaml = { "prettier" },

    -- backend / others (opsional, aman ditinggal kalau belum install)
    python = { "black" },
    go = { "gofmt" },
    sh = { "shfmt" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options

