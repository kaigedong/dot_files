require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"

-- 1. 插件安装目录:
-- ~/.local/share/nvim/site

-- 2. 命令: `:Lexplore` 打开内置文件导航
-- 3. LspInfo 显示当前buffer attach的LSP
-- 4. LspInstallInfo 显示所有Lsp，i--install，u--update，U--update all; X -- uninstall
-- 5. g + l 可以显示LSP提示
-- 6. <S-v> 可以选中当前行
-- 7. 命令：`:e +Path` 可以像lvy一样导航目录，如 `:e ~/Documents/`
