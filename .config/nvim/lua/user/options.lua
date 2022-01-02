-- :help options
--
-- 1. 可以用这种方式： o = vim.opt
-- o.backup = false
-- 2. 用for loop来设置变量，避免下面三行的写法
-- vim.opt.backup = false                          -- creates a backup file
-- vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
-- vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
-- 3. 如果不用local，则是global的，使用local，只对当前文件有效
local options = {
    conceallevel = 0, -- so that `` is visible in markdown files
    ignorecase = true, -- ignore case in search patterns
    pumheight = 10, -- pop up menu height
    showmode = false, -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2, -- always show tabs
    smartcase = true, -- smart case
    swapfile = false, -- creates a swapfile
    undofile = true, -- enable persistent undo
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    guifont = "monospace:h17" -- the font used in graphical neovim applications
}

vim.opt.shortmess:append "c"

-- 用for loop 来设置变量
for k, v in pairs(options) do
    -- (我不想更改vim的默认设置，这里就不进行设置了。)
    -- vim.opt[k] = v
end

local options2 = {
    cmdheight = 1, -- more space in the neovim command line for displaying messages
    -- timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)

    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    wrap = false, -- display lines as one long line
    fileencoding = "utf-8", -- the encoding written to a file
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    -- 似乎没什么用
    hlsearch = true, -- highlight all matches on previous search pattern
    mouse = "a", -- allow the mouse to be used in neovim
    -- 好像没啥作用
    -- scrolloff = 8, -- is one of my fav
    -- sidescrolloff = 8,
    completeopt = {"menuone", "noselect"}, -- mostly just for cmp

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
    shiftwidth = 2, -- shift 4 spaces when tab(how many columns of whitespace a “level of indentation” is worth?)
    smartindent = true -- make indenting smarter again autoindent 根据上一行判断缩进，smartindent根据语法缩进
}
for k, v in pairs(options2) do
    vim.opt[k] = v
end


-- 代码折叠配置
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
-- 折叠等: 0: {; 1: {{; ...
vim.o.foldlevelstart = 99

function _G.custom_fold_text()
    local line = vim.fn.getline(vim.v.foldstart)
    local line_count = vim.v.foldend - vim.v.foldstart + 1
    return " ⚡ " .. line .. "... " .. line_count .. " lines"
end

vim.opt.foldtext = 'v:lua.custom_fold_text()'
vim.opt.fillchars = { eob = "-", fold = " " }
vim.opt.viewoptions:remove("options")

-- 为了持久化undotree, set undofile => vim.opt[undofile]=true
vim.cmd "set undofile"
vim.cmd "set undodir=~/.config/nvim/tmp/undo"

-- 有些设置，可能用lua不太好实现，就用了默认的vim的语法(我不想进行修改，这里就不进行设置了)
-- vim.cmd "set whichwrap+=<,>,[,],h,l"
-- vim.cmd [[set iskeyword+=-]] -- 似乎是将 - 左右两侧的字母合起来当作一个word
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- autocmd，来执行"记录上次文件打开位置"的作用
-- autocmd BufReadPost * \ if line("'"") >= 1 && line("'"") <= line("$") && &ft !~# 'commit' \ | exe "normal! g`"" \ | endif
-- 参考： https://github.com/neovim/neovim/issues/14420#issuecomment-824668729
-- 注意，添加autocmd时，这个augroup后面的名字，不与其他命令重合，不然似乎不生效
vim.cmd [[
  augroup LastCursorPos
    autocmd!
    autocmd BufReadPost * if @% !~# "\.git[\/\\]COMMIT_EDITMSG$" && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  augroup end
]]

