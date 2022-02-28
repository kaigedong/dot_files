local colorscheme = "tokyonight"

-- vim.cmd "colrscheme darkblue" 或 :colorscheme darkblue
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
