vim.deprecate = function() end
local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- Jalankan default config NvChad
nvlsp.defaults()

local servers = {
  "html",
  "cssls",
  "tailwindcss",
  "ts_ls", -- Gunakan "ts_ls" untuk versi terbaru atau "tsserver" untuk versi lama
  "emmet_ls",
  "eslint",
}

for _, lsp in ipairs(servers) do
  -- CEK APAKAH SERVER ADA SEBELUM SETUP (Penting agar tidak traceback)
  if lspconfig[lsp] then
    lspconfig[lsp].setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }
  else
    -- Jika nama salah, nvim tidak akan crash, hanya memberitahu di log
    print("LSP identifier tidak valid: " .. lsp)
  end
end
