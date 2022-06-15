-- :help options
local options = {
	conceallevel = 0, -- so that `` is visible in markdown files
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	undofile = true, -- enable persistent undo
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	guifont = "monospace:h17", -- the font used in graphical neovim applications
}

vim.opt.shortmess:append("c")

local options2 = {
	cmdheight = 1, -- more space in the neovim command line for displaying messages
	ignorecase = true, -- ignore case in search patterns
	timeoutlen = 400, -- time to wait for a mapped sequence to complete (in milliseconds)

	swapfile = false, -- creates a swapfile

	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	wrap = false, -- display lines as one long line
	fileencoding = "utf-8", -- the encoding written to a file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	hlsearch = true, -- highlight all matches on previous search pattern
	mouse = "a", -- allow the mouse to be used in neovim
	-- scrolloff = 8, -- is one of my fav
	-- sidescrolloff = 8,
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp

	updatetime = 300, -- faster completion (4000ms default)
	backup = false, -- creates a backup file

	number = true, -- set numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}

	relativenumber = false, -- set relative numbered lines
	termguicolors = true, -- set term gui colors (most terminals support this) 开启该选项，可以支持更多颜色
	cursorline = true, -- highlight the current line 高亮当前行

	-- Tab的设置
	tabstop = 2, -- Tab 默认显示宽度是 8 个空格,修改Tab显示宽度：1 tab == 4 spaces，不修改按Tab键的行为
	expandtab = true, -- 根据tabstop 选项值把插入的 tab 替换成特定数目的空格
	softtabstop = 2, -- 选项修改按 Tab 键的宽度，不修改 tab 字符的显示宽度。具体行为跟 tabstop 选项值有关
	shiftwidth = 4, -- shift 4 spaces when tab(how many columns of whitespace a “level of indentation” is worth?)
	smartindent = true, -- make indenting smarter again autoindent 根据上一行判断缩进，smartindent根据语法缩进

	-- 代码折叠样式设置
	foldmethod = "expr",
	foldexpr = "nvim_treesitter#foldexpr()",
	foldlevelstart = 99, -- 折叠等: 0: {; 1: {{; ...
	foldtext = "v:lua.custom_fold_text()",
	fillchars = { eob = "-", fold = " " },
}

for k, v in pairs(options2) do
	vim.opt[k] = v
end

-- 设置neovide光标移动气泡特效
vim.g["neovide_cursor_vfx_mode"] = "torpedo"

-- 配置代码折叠样式
vim.opt.viewoptions:remove("options")
function _G.custom_fold_text()
	local line = vim.fn.getline(vim.v.foldstart)
	local line_count = vim.v.foldend - vim.v.foldstart + 1
	return " ⚡ " .. line .. "... " .. line_count .. " lines"
end
