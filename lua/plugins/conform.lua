
-- lua/plugins/conform.lua
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" }, -- 🔥 KUNCI :w
  opts = require("configs.conform"), -- ← options kamu
}
