if status is-interactive
    # Commands to run in interactive sessions can go here
end

# For pyenv
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

# # tmux
# session="workspace"
# tmux has-session -t $session 2>/dev/null
# if [ $? != 0 ]; then
#    # 对终端中nvim色彩显示很重要
#    TERM=xterm-256color tmux new-session -s $session 2>/dev/null
# else
#   tmux attach -t $session 2>/dev/null
# fi

abbr -a ls "lsd --date '+%Y-%m-%d %H:%M:%S'"
abbr -a la "lsd -lth --date '+%Y-%m-%d %H:%M:%S'"
abbr -a lb "lsd -lh --date '+%Y-%m-%d %H:%M:%S'"
abbr -a grep rg
abbr -a less "bat -p"
abbr -a baidunetdisk /usr/lib/baidunetdisk/baidunetdisk
abbr -a top glances
abbr -a open xdg-open
abbr -a cat less
abbr -a emacs "emacs -nw"
abbr -a tmux "env TERM=xterm-256color tmux"

# color man use bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export PYENV_ROOT="$HOME/.pyenv"
export PET_GITHUB_ACCESS_TOKEN="1ad4eebf13422ffe4c0f132d6d2aeca5ef77ce25"

export LANGUAGE=en_US
export LANG=en_US.UTF-8


# ~/.config/kioslaverc stores KDE proxy config
export http_proxy="http://127.0.0.1:10809"
export https_proxy=$http_proxy
export HTTP_PROXY=$http_proxy
export HTTPS_PROXY=$http_proxy


# nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
# npm install -g yarn
# alias npm="npm --registry=https://registry.npm.taobao.org --cache=$HOME/.npm/.cache/cnpm --disturl=https://npm.taobao.org/dist --userconfig=$HOME/.cnpmrc"
export npm_config_proxy=http://127.0.0.1:10809
# npm config set registry https://registry.npm.taobao.org
# npm install -g something --verbose # 显示下载细节
# yarn config set httpProxy http://127.0.0.1:10809
# yarn config set httpsProxy http://127.0.0.1:10809


rustc --print sysroot | read r_sysroot
export RUST_SRC_PATH="{$r_sysroot}/lib/rustlib/src/rust/library"
export WASM_BUILD_TYPE=release # For substrate

fnm env --use-on-cd | source
# starship init fish | source

#GOlang
export GOPATH="$HOME/go"
export GO111MODULE=on
# export GOPROXY=https://mirrors.aliyun.com/goproxy/
# CGO_ENABLED=1 leads to faster, smaller builds & runtimes
# it can dynamically load the host OS's native libraries (glibc etc.)
export CGO_ENABLED=0

export PATH="$HOME/.emacs.d/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PYENV_ROOT/bin:$GOPATH/bin:$HOME/bin:$PATH"


# for Flutter
export NO_PROXY=localhost,127.0.0.1
export ANDROID_HOME="/home/bobo/Android/Sdk"
export ANDROID_TOOLS="/home/bobo/Android/Sdk/tools"
export ANDROID_PLATFORM_TOOLS="/home/bobo/Android/Sdk/platform-tools"
export JAVA_HOME=(readlink -f /usr/bin/javac | sed "s:/bin/javac::")

# 对编译polkawallet至关重要
export JPUSH_APPKEY=""

export PATH="$HOME/.emacs.d/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PYENV_ROOT/bin:$GOPATH/bin:$HOME/bin:$PATH:$ANDROID_HOME:$ANDROID_TOOLS:$ANDROID_PLATFORM_TOOLS"

export GPG_TTY=(tty)
export NEOVIDE_MULTIGRID


# A tool to infer progress speed
# sudo nethogs

# alsamixer # 命令行调节声音大小
# xdg-mime query default inode/directory # 查看默认的文件管理器
