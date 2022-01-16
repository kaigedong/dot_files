if status is-interactive
    # Commands to run in interactive sessions can go here
end

# For pyenv
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

# tmux
# set -e: 清除; set -q: 检查是否存在
set -x session "workspace"
if set -q TMUX
  env TERM=xterm-256color tmux attach -t $session 2>/dev/null
else
  env TERM=xterm-256color tmux new-session -s $session 2>/dev/null
end

export npm_config_proxy=http://127.0.0.1:10809
# npm config set registry https://registry.npm.taobao.org
# npm install -g something --verbose # 显示下载细节
# yarn config set httpProxy http://127.0.0.1:10809
# yarn config set httpsProxy http://127.0.0.1:10809

fnm env --use-on-cd | source
# starship init fish | source

# A tool to infer progress speed
# sudo nethogs

# alsamixer # 命令行调节声音大小
# xdg-mime query default inode/directory # 查看默认的文件管理器
