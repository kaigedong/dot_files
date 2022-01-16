#GOlang
export GOPATH="$HOME/go"
export GO111MODULE=on
# export GOPROXY=https://mirrors.aliyun.com/goproxy/
# CGO_ENABLED=1 leads to faster, smaller builds & runtimes
# it can dynamically load the host OS's native libraries (glibc etc.)
export CGO_ENABLED=0

# for Flutter
export NO_PROXY=localhost,127.0.0.1
export ANDROID_HOME="/home/bobo/Android/Sdk"
export ANDROID_TOOLS="/home/bobo/Android/Sdk/tools"
export ANDROID_PLATFORM_TOOLS="/home/bobo/Android/Sdk/platform-tools"
export JAVA_HOME=(readlink -f /usr/bin/javac | sed "s:/bin/javac::")

# 对编译polkawallet至关重要
export JPUSH_APPKEY=""


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

export PATH="$HOME/.emacs.d/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PYENV_ROOT/bin:$GOPATH/bin:$HOME/bin:$PATH:$ANDROID_HOME:$ANDROID_TOOLS:$ANDROID_PLATFORM_TOOLS"

export GPG_TTY=(tty)
export NEOVIDE_MULTIGRID

rustc --print sysroot | read r_sysroot
export RUST_SRC_PATH="{$r_sysroot}/lib/rustlib/src/rust/library"
export WASM_BUILD_TYPE=release # For substrate
