-- File: lua/plugins/nvim-ts-autotag.lua
-- Letakkan di folder plugins Anda di NvChad

return {
  "windwp/nvim-ts-autotag",
  enabled = false, 
  ft = { 
    "html", 
    "javascript",
    "javascriptreact", 
    "typescript",
    "typescriptreact",
    "jsx",
    "tsx",
    "vue",
    "svelte",
    "xml",
  },
  config = function()
    require("nvim-ts-autotag").setup({
      opts = {
        -- Defaults
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = false -- Auto close on trailing </
      },
      -- Juga bisa per filetype seperti ini (opsional):
      per_filetype = {
        ["html"] = {
          enable_close = true
        },
        ["typescriptreact"] = {
          enable_close = true,
          enable_rename = true,
        },
        ["javascriptreact"] = {
          enable_close = true,
          enable_rename = true,
        }
      }
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
}
