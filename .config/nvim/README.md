# nvim 配置说明

 1. 插件安装目录: `~/.local/share/nvim/site`
 2. 命令: `:Lexplore` 打开内置文件导航
 3. 命令：`:e +Path` 可以像lvy一样导航目录，如 `:e ~/Documents/`
 4. 添加autocmd时，augroup后的名字，不能与其他命令重合，不然不生效
 5. vim.opt 相当于 `:set`

## 插件
 1. LspInfo 显示当前buffer attach的LSP
 2. LspInstallInfo 显示所有Lsp; `i`--install，`u`--update，`U`--update all; `X` -- uninstall 
 3. 开启/禁用treesitter: TSDisableAll heightlight / TSEnableAll heightlight

## 快捷键
 1. g + l 可以显示LSP提示信息
 2. <S-v> 可以选中当前行

