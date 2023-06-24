-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- vim.opt.colorcolumn = "80"
-- vim.opt.relativenumber = true

-- for vim-clap
vim.g.clap_theme = "material_design_dark"
-- vim.g.clap_layout = { relative = "editor", width = "67%", height = "33%", row = "65%", col = "0%" }
vim.g.clap_layout = { relative = "editor", width = "50%", height = "33%", row = "65%", col = "0%" }
-- for git-blame
vim.g.gitblame_date_format = "%Y %X"
