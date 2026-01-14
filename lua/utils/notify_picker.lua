
local notify = require("notify")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local conf = require("telescope.config").values

local M = {}

M.open = function()
  local items = notify.history()

  pickers.new({}, {
    prompt_title = "Notifications",

    finder = finders.new_table({
      results = items,
      entry_maker = function(item)
        local msg = table.concat(
          type(item.message) == "table" and item.message or { item.message },
          "\n"
        )

        return {
          value = item,
          ordinal = msg, -- ⬅️ STRING (WAJIB)
          display = string.format("[%s] %s", item.level, msg:gsub("\n", " ")),
          message = msg,
        }
      end,
    }),

    sorter = conf.generic_sorter({}),

    previewer = previewers.new_buffer_previewer({
      title = "Detail",
      define_preview = function(self, entry)
        local lines = vim.split(entry.message, "\n")
        vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)
      end,
    }),
  }):find()
end

return M

