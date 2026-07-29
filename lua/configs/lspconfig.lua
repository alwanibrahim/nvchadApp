vim.deprecate = function() end
local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- Jalankan default config NvChad
nvlsp.defaults()

local function global_typescript_path()
  local npm = vim.fn.exepath "npm"
  if npm == "" then
    return nil
  end

  local npm_root = vim.fn.system({ npm, "root", "--global" }):gsub("%s+$", "")
  local tsserver_path = npm_root .. "/typescript/lib/tsserver.js"
  if vim.uv.fs_stat(tsserver_path) then
    return npm_root .. "/typescript/lib"
  end
end

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
    local config = {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }

    if lsp == "ts_ls" then
      config.init_options = {
        hostInfo = "neovim",
        tsserver = { fallbackPath = global_typescript_path() },
      }
    end

    lspconfig[lsp].setup(config)
  else
    -- Jika nama salah, nvim tidak akan crash, hanya memberitahu di log
    print("LSP identifier tidak valid: " .. lsp)
  end
end
