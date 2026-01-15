require "nvchad.options"

-- add yours here!
--
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.filetype.add {
  extension = {
    ts = "typescript",
    tsx = "typescriptreact",
  },
}

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

vim.o.relativenumber = true

-- Matikan hover LSP native
vim.lsp.handlers["textDocument/hover"] = function() end
