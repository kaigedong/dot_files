require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.bufferline"
require "user.lualine"
require "user.nvim-tree"
require "user.gitsigns"
require "user.toggleterm"
require "user.project"
require "user.impatient"
require "user.indentline"
require "user.alpha"
require "user.whichkey"
require "user.autocommands"
require "user.better-whitespace"
require "user.undotree"
require "user.rust-tools"

local vimim_status_ok, vimim = pcall(require, "vimim")
if not vimim_status_ok then
    return
end

