-- File: lua/plugins/ts-autotag.lua
-- Plugin yang lebih modern untuk auto tag

return {
  "tronikelis/ts-autotag.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    -- Filetypes yang didukung
    filetypes = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "jsx",
      "tsx",
      "xml",
      "php",
      "vue",
      "svelte",
    },
    
    -- Auto close tag (ketik <div> jadi <div></div>)
    auto_close = {
      enabled = true,
    },
    
    -- FITUR UTAMA: Auto rename REAL-TIME di insert mode
    auto_rename = {
      enabled = true, -- NYALAKAN INI!
    },
  },
  
  -- Optional: Setup keybinding untuk manual rename
  keys = {
    {
      "<leader>rn",
      function()
        -- Manual rename dengan keybinding
        if not require("ts-autotag").rename() then
          -- Fallback ke LSP rename kalau gagal
          vim.lsp.buf.rename()
        end
      end,
      desc = "Rename HTML/JSX tag",
      mode = "n",
    },
  },
}
