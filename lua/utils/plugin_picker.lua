
local lazy = require("lazy")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local config_root = vim.fn.stdpath("config") .. "/lua/plugins"

local M = {}

M.open = function()
  local plugins = lazy.plugins()
  local results = {}

  for name, plugin in pairs(plugins) do
    local override = config_root .. "/" .. name .. ".lua"

    table.insert(results, {
      name = name,
      dir = plugin.dir,
      enabled = plugin.enabled ~= false,
      override = vim.fn.filereadable(override) == 1 and override or nil,
    })
  end

  pickers.new({}, {
    prompt_title = "Plugins",

    finder = finders.new_table({
      results = results,
      entry_maker = function(item)
        return {
          value = item,
          ordinal = item.name .. " " .. item.dir,
          display = function()
            local mark = item.enabled and "✓" or "✗"
            local ovr = item.override and "  override" or ""
            return string.format(
              "%s %-25s %s%s",
              mark,
              item.name,
              item.dir,
              ovr
            )
          end,
          name = item.name,
          dir = item.dir,
          override = item.override,
        }
      end,
    }),

    sorter = conf.generic_sorter({}),

    previewer = previewers.new_buffer_previewer({
      title = "Preview",
      define_preview = function(self, entry)
        local target

        if entry.override then
          target = entry.override
        else
          target = entry.dir .. "/README.md"
        end

        if vim.fn.filereadable(target) == 1 then
          vim.api.nvim_buf_set_lines(
            self.state.bufnr,
            0,
            -1,
            false,
            vim.fn.readfile(target)
          )
        else
          vim.api.nvim_buf_set_lines(
            self.state.bufnr,
            0,
            -1,
            false,
            {
              entry.name,
              "",
              entry.dir,
              "",
              "No override / README found",
            }
          )
        end
      end,
    }),

    attach_mappings = function(bufnr)
      -- ENTER → buka override kalau ada, fallback ke plugin
      actions.select_default:replace(function()
        local entry = action_state.get_selected_entry()
        actions.close(bufnr)

        if entry.value.override then
          vim.cmd("edit " .. entry.value.override)
        else
          vim.cmd("edit " .. entry.value.dir)
        end
      end)

      -- CTRL+S → buka source plugin
      vim.keymap.set("i", "<C-s>", function()
        local entry = action_state.get_selected_entry()
        actions.close(bufnr)
        vim.cmd("edit " .. entry.value.dir)
      end)

      return true
    end,
  }):find()
end

return M

