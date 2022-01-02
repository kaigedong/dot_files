local opts = {
    noremap = true,
    silent = true
}

local term_opts = {
    silent = true
}

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
-- 方便的在窗口之间移动。
-- n: normal模式； <C-h> Ctrl+h
-- 表示：在normal模式下 将<C-h> mapping to <C-w> h
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- 在normal模式下，ESC map到清除高亮
keymap("n", "<ESC>", ":noh<cr>", opts)

-- <leader>e 执行命令： :Lex 30<cr>
-- cr表示：carriage return，类似于回车
-- Lexplore表示Left hand explorer
-- keymap("n", "<leader>e", ":Lex 30<cr>", opts)
-- 使用nvim-tree，上面的方式光荣退休
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Resize with arrows
-- 默认快捷键中，<C-w>W 将当前窗口放到左边，<C-w>L将当前窗口放到右边..
-- 下面这些map对我无用，可以注释掉
-- 调整窗口大小快捷键
-- keymap("n", "<C-Up>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
-- buffer类似于tab, 我不喜欢buffers =_=
-- <S-l> 表示Shift+l
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
-- 在insert模式，jk映射为Esc
keymap("i", "jk", "<ESC>", opts)
-- insert模式，将Ctrl + f 映射到 Right按键。其他三个按键：`Left`, `Down`, `Up`
keymap("i", "<C-f>", "<Right>", opts)

-- Visual --
-- Stay in indent mode
-- 在visual模式，< 向左缩进，> 向右缩进
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
-- 在visual模式下，选中一段文字，可以将这段文字整体移动
-- 对我没用，注释掉
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- 跟复制粘贴有关。实现 Pasting without yanking
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
-- V模式下选中一段文字，按J可以整块移动。
-- 为什么x表示v模式？
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
-- dropdown 的形式打开Telescope，并禁用previewer
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({ }))<cr>", opts)

-- 按键冲突： c-t是代码跳转
-- keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>", opts)

