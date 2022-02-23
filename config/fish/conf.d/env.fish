# Proxy
# ~/.config/kioslaverc stores KDE proxy config
export http_proxy="http://127.0.0.1:10809"
export https_proxy=$http_proxy
export HTTP_PROXY=$http_proxy
export HTTPS_PROXY=$http_proxy

export LANGUAGE=en_US
export LANG=en_US.UTF-8

# GOlang
export GOPATH="$HOME/go"
export GO111MODULE=on
# export GOPROXY=https://mirrors.aliyun.com/goproxy/
# CGO_ENABLED=1 leads to faster, smaller builds & runtimes
# it can dynamically load the host OS's native libraries (glibc etc.)
# export CGO_ENABLED=0

# Flutter
export NO_PROXY=localhost,127.0.0.1
export ANDROID_HOME="/home/bobo/Android/Sdk"
export ANDROID_TOOLS="/home/bobo/Android/Sdk/tools"
export ANDROID_PLATFORM_TOOLS="/home/bobo/Android/Sdk/platform-tools"
export JAVA_HOME=(readlink -f /usr/bin/javac | sed "s:/bin/javac::")
# 对编译polkawallet至关重要
export JPUSH_APPKEY=""
fish_add_path $ANDROID_HOME
fish_add_path $ANDROID_TOOLS
fish_add_path $ANDROID_PLATFORM_TOOLS

# color man use bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export PYENV_ROOT="$HOME/.pyenv"
fish_add_path $PYENV_ROOT/bin

export PET_GITHUB_ACCESS_TOKEN="1ad4eebf13422ffe4c0f132d6d2aeca5ef77ce25"

# Git
export GPG_TTY=(tty)
export NEOVIDE_MULTIGRID

# Rust
rustc --print sysroot | read r_sysroot
export RUST_SRC_PATH="$r_sysroot/lib/rustlib/src/rust/library"
export WASM_BUILD_TYPE=release # For substrate

# NPM
export npm_config_proxy=http://127.0.0.1:10809
# npm config set registry https://registry.npm.taobao.org
# npm install -g something --verbose # 显示下载细节
# yarn config set httpProxy http://127.0.0.1:10809
# yarn config set httpsProxy http://127.0.0.1:10809

fish_add_path $HOME/.local/bin
fish_add_path $HOME/bin
fish_add_path $HOME/.emacs.d/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $GOPATH/bin
fish_add_path $HOME/.local/share/nvim/lsp_servers/zk/ $HOME/.local/share/nvim/lsp_servers/rust
