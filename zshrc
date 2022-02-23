# tmux
session="workspace"
tmux has-session -t $session 2>/dev/null
if [ $? != 0 ]; then
   TERM=xterm-256color tmux new-session -s $session 2>/dev/null
else
   TERM=xterm-256color ttmux attach -t $session 2>/dev/null
fi

# Pure theme
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

# Zsh history setting
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=10000000
SAVEHIST=10000000

export LANGUAGE=en_US
export LANG=en_US.UTF-8
export ZSH="/home/bobo/.oh-my-zsh"
export PET_GITHUB_ACCESS_TOKEN="1ad4eebf13422ffe4c0f132d6d2aeca5ef77ce25"
##### Rust #####
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/library"
export WASM_BUILD_TYPE=release
# export OPENSSL_LIB_DIR="/usr/lib/openssl-1.0"
# export OPENSSL_INCLUDE_DIR="/usr/include/openssl-1.0"
##### color man use bat #####
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
##### GOlang #####
export GOPATH="$HOME/go"
# export GO111MODULE=on
# export GOPROXY=https://mirrors.aliyun.com/goproxy/
# CGO_ENABLED=1 leads to faster, smaller builds & runtimes
# it can dynamically load the host OS's native libraries (glibc etc.)
# export CGO_ENABLED=0
##### Node #####
# alias npm="npm --registry=https://registry.npm.taobao.org --cache=$HOME/.npm/.cache/cnpm --disturl=https://npm.taobao.org/dist --userconfig=$HOME/.cnpmrc"
# export npm_config_proxy=http://127.0.0.1:10809
# npm config set registry https://registry.npm.taobao.org
# npm install -g something --verbose # 显示下载细节
# yarn config set httpProxy http://127.0.0.1:10809
# yarn config set httpsProxy http://127.0.0.1:10809
##### for Flutter #####
export NO_PROXY=localhost,127.0.0.1
export ANDROID_HOME="/home/bobo/Android/Sdk"
export ANDROID_TOOLS="/home/bobo/Android/Sdk/tools"
export ANDROID_PLATFORM_TOOLS="/home/bobo/Android/Sdk/platform-tools"
export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")
# 对编译polkawallet至关重要
export JPUSH_APPKEY=""
##### Git #####
export GPG_TTY=$(tty)
##### PATH #####
export PATH=$ANDROID_HOME:$ANDROID_TOOLS:$ANDROID_PLATFORM_TOOLS:$PATH
export PATH="$HOME/.emacs.d/bin:$HOME/.local/bin:$GOPATH/bin:$HOME/bin:$PATH"

# ~/.config/kioslaverc stores KDE proxy config
export SHELLPROXY_URL="http://127.0.0.1:10809"
ZSH_PYENV_QUIET=true

plugins=(extract git zsh-autosuggestions zsh-syntax-highlighting
         rust z nvm pyenv fzf shell-proxy)
source $ZSH/oh-my-zsh.sh

alias emacs="emacs -nw"
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls="/usr/bin/lsd --date '+%Y-%m-%d %H:%M:%S'"
alias la="ls -lth"
alias lb="ls -lh"
alias grep="rg"
alias less="bat -p"
alias baidunetdisk="/usr/lib/baidunetdisk/baidunetdisk"
alias top="glances"
alias open="xdg-open"
alias cat="less"

typeset -U PATH
proxy enable
# screenfetch -A 'Arch Linux' | lolcat

# sudo nethogs # A tool to infer progress speed
# macchina # better screenfetch written in rust
# ibus engine libpinyin
# alsamixer # 命令行调节声音大小
# xdg-mime query default inode/directory # 查看默认的文件管理器
