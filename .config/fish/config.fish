# tmux
set -x session "workspace"
if set -q TMUX
  env TERM=xterm-256color tmux attach -t $session 2>/dev/null
else
  env TERM=xterm-256color tmux new-session -s $session 2>/dev/null
end

# pyenv
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

# fnm
fnm env --use-on-cd | source
# starship init fish | source

# A tool to infer progress speed
# sudo nethogs

# alsamixer # 命令行调节声音大小
# xdg-mime query default inode/directory # 查看默认的文件管理器
