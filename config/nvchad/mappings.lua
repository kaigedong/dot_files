---@type MappingsTable
local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
    -- ["<leader>h"] = "",
    -- ["<C-n>"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>e"] = { ":Clap filer <CR>", "Ivy-like file explorer" },
  },
}

-- more keybinds!

return M
