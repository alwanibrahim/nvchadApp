-- File: lua/plugins/treesitter.lua
-- Config treesitter yang sudah bersih dari plugin lama

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      -- core
      "vim",
      "lua",
      "vimdoc",
      -- web
      "html",
      "css",
      "javascript",
      "typescript",
      "tsx",
      -- http & graphql untuk Kulala
      "http",
      "graphql",
      "json",
      -- data / misc
      "yaml",
      "bash",
      "markdown",
      "markdown_inline",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
