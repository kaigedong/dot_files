# nvim 配置说明

 1. 插件安装目录: `~/.local/share/nvim/site`

 2. 命令: `:Lexplore` 打开内置文件导航

 3. 命令：`:e +Path` 可以像lvy一样导航目录，如 `:e ~/Documents/`

 4. 添加autocmd时，augroup后的名字，不能与其他命令重合，不然不生效

 5. vim.opt 相当于 `:set`

 6. vim.notify如果被其他消息覆盖，可以执行`:messages`命令，来查看

 7. 要安装`xclip`才能复制到系统剪贴板

## 插件

 1. LspInfo 显示当前buffer attach的LSP

 2. LspInstallInfo 显示所有Lsp; `i`--install，`u`--update，`U`--update all; `X` -- uninstall

 3. 开启/禁用treesitter: TSDisableAll heightlight / TSEnableAll heightlight

## 快捷键

 1. g + l 可以显示LSP提示信息

 2. <S-v> 可以选中当前行

## 主题

1. tmux中，要开启24-color支持: `tmux_conf_24b_colour=true`

使用下面命令，输出连续不间断的色彩才能正确显示nvim色彩

```bash
awk 'BEGIN{
   s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
   for (colnum = 0; colnum<77; colnum++) {
       r = 255-(colnum*255/76);
       g = (colnum*510/76);
       b = (colnum*255/76);
       if (g>255) g = 510-g;
       printf "\033[48;2;%d;%d;%dm", r,g,b;
       printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
       printf "%s\033[0m", substr(s,colnum+1,1);
   }
   printf "\n";
}'
```

2. 同时，打开tmux的时候，要指定环境变量：在.zshrc中配置：`alias tmux="TERM=xterm-256color tmux"`

