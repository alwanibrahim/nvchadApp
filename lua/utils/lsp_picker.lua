
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local M = {}

M.open = function()
  local clients = vim.lsp.get_clients()
  local results = {}

  for _, client in ipairs(clients) do
    table.insert(results, {
      name = client.name,
      id = client.id,
      cmd = client.config.cmd,
      filetypes = client.config.filetypes,
      root = client.config.root_dir,
      settings = client.config.settings,
      workspace = client.workspace_folders,
    })
  end

  pickers.new({}, {
    prompt_title = "LSP Clients",

    finder = finders.new_table({
      results = results,
      entry_maker = function(item)
        return {
          value = item,
          ordinal = item.name,
          display = item.name,
        }
      end,
    }),

    sorter = conf.generic_sorter({}),

    previewer = previewers.new_buffer_previewer({
      title = "LSP Detail",
      define_preview = function(self, entry)
        local lsp = entry.value
        local lines = {}

        local function add(title, value)
          table.insert(lines, "## " .. title)
          table.insert(lines, "")
          if type(value) == "table" then
            for _, v in ipairs(value or {}) do
              table.insert(lines, "- " .. tostring(v))
            end
          elseif value then
            table.insert(lines, tostring(value))
          else
            table.insert(lines, "—")
          end
          table.insert(lines, "")
        end

        add("Name", lsp.name)
        add("Command", lsp.cmd and table.concat(lsp.cmd, " "))
        add("Filetypes", lsp.filetypes)
        add("Root Dir", lsp.root)
        add("Workspace", lsp.workspace and vim.inspect(lsp.workspace))
        add("Settings", lsp.settings and vim.inspect(lsp.settings))

        vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)
      end,
    }),

    attach_mappings = function(bufnr)
      actions.select_default:replace(function()
        local entry = action_state.get_selected_entry()
        actions.close(bufnr)

        -- buka config LSP user kalau ada
        local path = vim.fn.stdpath("config") .. "/lua/configs/lspconfig.lua"
        if vim.fn.filereadable(path) == 1 then
          vim.cmd("edit " .. path)
        end
      end)

      return true
    end,
  }):find()
end

return M
