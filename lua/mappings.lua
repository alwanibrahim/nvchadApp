require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local notify = require "notify"
-- INSERT
map("i", "jj", "<Esc>:w<CR>", { desc = "Exit insert + save" })
map("i", "jk", "<Esc>:w<CR>", { desc = "Exit insert + save" })

-- TERMINAL
map("t", "jj", "<C-\\><C-n>", { desc = "Exit terminal (jj)" })
map("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal (jk)" })

-- GIT
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })
map("n", "<leader>gr", function()
  vim.cmd("!git restore " .. vim.fn.expand "%")
end, { desc = "Git restore current file" })

-- SPLIT
map("n", "sh", "<cmd>split | wincmd j<CR>", { desc = "Horizontal split" })
map("n", "sv", "<cmd>vsplit | wincmd l<CR>", { desc = "Vertical split" })

-- TERMINAL (toggleterm WAJIB ada plugin-nya)
map("n", "<leader>th", function()
  require("toggleterm").toggle(1, nil, nil, "horizontal")
end, { desc = "Terminal horizontal" })

map("n", "<leader>tv", function()
  require("toggleterm").toggle(2, nil, nil, "vertical")
end, { desc = "Terminal vertical" })

map("n", "<leader>tf", function()
  require("toggleterm").toggle(3, nil, nil, "float")
end, { desc = "Terminal float" })

-- OBSIDIAN (Snacks Picker)
map("n", "<leader>of", function()
  require("snacks").picker.files {
    cwd = "/home/alwan/Documents/Obsidian Vault",
  }
end, { desc = "Obsidian: Find files" })

map("n", "<leader>og", function()
  require("snacks").picker.grep {
    cwd = "/home/alwan/Documents/Obsidian Vault",
  }
end, { desc = "Obsidian: Live grep" })

map("n", "<leader><leader>", "<leader>ff", { remap = true, desc = "Find files" })
map("n", "<leader>f", "<leader>ff", { remap = true, desc = "Find files" })

-- LIVE GREP
map("n", "<leader>/", "<leader>fw", { remap = true, desc = "Live grep" })

map("n", "<leader>E", "<cmd>NvimTreeToggle<CR>", {
  desc = "NvimTree Toggle",
})
-- map("n", "<leader>e", function()
--   require("snacks").explorer()
-- end, { desc = "Snacks Explorer" })
-- Kulala: run HTTP request
map("n", "<leader>Rs", "<cmd>Kulala run<CR>", {
  desc = "Kulala: Run HTTP request",
})
map("n", "<leader>qq", "<cmd>qa!<CR>", {
  desc = "Quit all",
})
map("n", "<leader>qs", function()
  require("telescope.builtin").find_files {
    cwd = vim.fn.stdpath "state" .. "/sessions",
  }
end, {
  desc = "Session: pick session",
})

vim.keymap.set("n", "<leader>sp", function()
  require("utils.plugin_picker").open()
end, { desc = "Search Plugins" })

--
-- vim.keymap.set("n", "<leader>n", function()
--   require("utils.notify_picker").open()
-- end, { desc = "Notification History" })
vim.keymap.set("n", "<leader>n", "<cmd>messages<cr>", { desc = "Notification History" })
vim.keymap.set("n", "<leader>cm", "<cmd>Mason<CR>", {
  desc = "Mason",
})

vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", {
  desc = "Lazy (plugin manager)",
})
vim.keymap.set("n", "<leader>cl", "<cmd>LspInfo<CR>", {
  desc = "LSP Info",
})

vim.keymap.set("n", "<leader>uC", function()
  require("nvchad.themes").open()
end, {
  desc = "NVChad Theme Picker",
})

vim.keymap.set("n", "<leader>wq", "<cmd>close<CR>", {
  desc = "Close current window",
})

map("n", "<leader>bb", "<C-^>", {
  desc = "Last buffer",
})
map("n", "<leader>fb", function()
  require("telescope.builtin").buffers {
    sort_mru = true,
    ignore_current_buffer = true,
  }
end, {
  desc = "Find buffers",
})
map("n", "<leader>bd", function()
  local buf = vim.api.nvim_get_current_buf()
  vim.cmd "bprevious"
  vim.cmd("bd " .. buf)
end, {
  desc = "Delete buffer",
})

vim.keymap.set("n", "<leader>ul", function()
  vim.o.relativenumber = not vim.o.relativenumber
end, { desc = "Toggle Relative Number" })
vim.keymap.set("n", "<leader>uL", function()
  vim.o.number = not vim.o.number
  vim.o.relativenumber = vim.o.number
end, { desc = "Toggle Line Number" })
vim.keymap.set("n", "<leader>uh", function()
  local enabled = vim.lsp.inlay_hint.is_enabled()
  vim.lsp.inlay_hint.enable(not enabled)
end, { desc = "Toggle Inlay Hints" })

vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help)

vim.keymap.set("i", "jk", function()
  notify.dismiss { silent = true, pending = true }
  return "<Esc>"
end, { expr = true })

vim.keymap.set("i", "jj", function()
  notify.dismiss { silent = true, pending = true }
  return "<Esc>"
end, { expr = true })

vim.keymap.set("c", "jk", "<Esc>", { silent = true })
vim.keymap.set("c", "jj", "<Esc>", { silent = true })
