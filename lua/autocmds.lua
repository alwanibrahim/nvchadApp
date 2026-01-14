require "nvchad.autocmds"
vim.api.nvim_create_autocmd("FileType", {
  pattern = "kulala",
  callback = function()
    vim.opt_local.foldmethod = "manual"
    vim.opt_local.foldenable = false
  end,
})

