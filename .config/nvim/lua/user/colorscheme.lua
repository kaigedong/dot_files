local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end

-- 1. `:colorscheme TAB`可以选择一些内置的主题
-- 2. 上面的代码，相当于代码： vim.cmd "colrscheme darkblue"
-- 的增强版，等于在命令行执行： :colorscheme darkblue
-- 3. tmux中，要开启24-color支持:
-- tmux_conf_24b_colour=true
-- 使用下面命令，输出连续不间断的色彩才能正确显示nvim色彩
-- awk 'BEGIN{
--     s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
--     for (colnum = 0; colnum<77; colnum++) {
--         r = 255-(colnum*255/76);
--         g = (colnum*510/76);
--         b = (colnum*255/76);
--         if (g>255) g = 510-g;
--         printf "\033[48;2;%d;%d;%dm", r,g,b;
--         printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
--         printf "%s\033[0m", substr(s,colnum+1,1);
--     }
--     printf "\n";
-- }'
-- 4. 同时，打开tmux的时候，要指定环境变量：在.zshrc中配置：
-- alias tmux="TERM=xterm-256color tmux"
-- 5. 上面的vim.notify如果被其他消息冲掉，可以执行`:messages`命令，来查看
