-- 为了持久化undotree, set undofile => vim.opt[undofile]=true
-- TODO: 增加检测文件夹是否存在，不存在创建新文件夹的配置
vim.cmd("set undofile")
vim.cmd("set undodir=~/.config/nvim/tmp/undo")
