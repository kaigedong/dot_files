echo "Initing manjaro..."

# 将硬件时间设置为localtime
sudo timedatectl set-local-rtc true
sudo timedatectl set-ntp true

# 设置源
sudo pacman-mirrors -i -c China -m rank
sudo pacman -Syyu
# 恢复默认源
# sudo pacman-mirrors --country all --api --protocol all --set-branch stable && sudo pacman -Syyu

# 本地化文本编码
sudo echo "zh_CN.UTF-8 UTF-8" >>locale.gen
sudo locale-gen

# 安装必要软件
sudo pacman -S emacs alacritty base-devel tmux fcitx5-im fcitx5-rime \
	flameshot rofi go lsd bat i3-wm polybar feh tig papirus-icon-theme

yay -S visual-studio-code-bin xray-bin rust-analyzer nerd-fonts-noto-sans-mono bluez-utils

# sway: 修改 /etc/gdm/custom.conf, 删掉 WaylandEnable=false

echo "请配置 rofi 与 flameshot快捷方式"
echo "rofi: rofi -show combi -combi-modi window,drun,run,ssh -modi combi -show-icons -dpi 180 -icon-theme 'Papirus'"

# Ubuntu v2ray
# For ubuntu: https://github.com/v2fly/fhs-install-v2ray
# (Must run by root): sudo bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)
# /usr/local/etc/v2ray/config.json
# 设置apt代理
# sudo touch /etc/apt/apt.conf.d/proxy.conf
# Acquire {
#   HTTP::proxy "http://127.0.0.1:10809";
#   HTTPS::proxy "http://127.0.0.1:10809";
# }

export http_proxy=http://127.0.0.1:10809
export https_proxy=http://127.0.0.1:10809
echo "Set proxy role: https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt"

# 设置git
git config --global user.name kaigedong
git config --global user.email dongkaige@gmail.com

# 安装omf
# curl -L https://get.oh-my.fish | fish
# ln .config/omf/* ~/.config/omf/
# omf update

# 安装zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp .zshrc ~/.zshrc

# zsh theme
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# 安装rust
curl https://getsubstrate.io -sSf | bash -s -- --fast
source ~/.cargo/env
cargo install --force subkey --git https://github.com/paritytech/substrate --version 2.0.1 --locked
cargo install tealdeer ripgrep fd-find
tldr --update

# 配置emacs
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
ln .doom.d/* ~/.doom.d/

# 配置tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf
cp ~/.tmux/.tmux.conf.local ~/

cp -r .config/i3 ~/.config/i3
cp -r .config/polybar ~/.config/polybar

# 配置fcitx5
echo "GTK_IM_MODULE DEFAULT=fcitx
QT_IM_MODULE  DEFAULT=fcitx
XMODIFIERS    DEFAULT=\@im=fcitx
SDL_IM_MODULE DEFAULT=fcitx" >>~/.pam_environment

# ubuntu:
# sudo apt install fcitx5 fcitx5-chinese-addons kde-config-fcitx5
# ubuntu: sudo ln -s /usr/share/applications/org.fcitx.Fcitx5.desktop  /etc/xdg/autostart/org.fcitx.Fcitx5.desktop
# cp /usr/share/applications/org.fcitx.Fcitx5.desktop ~/.config/autostart

echo "输入法将在重启后生效"
echo "请在重启后，设置输入法引擎"

# 配置alacritty
mkdir -p ~/.config/alacritty
cp .config/alacritty/* ~/.config/alacritty/
echo "Download nerd fonts: https://www.nerdfonts.com/"
# nerd-fonts-noto-sans-mono.git
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=nerd-fonts-noto-sans-mono

# 微软雅黑
echo "Download Yahei: https://www.download-free-fonts.com/"

# ssh
mkdir ~/.ssh
cp .ssh/* ~/.ssh/
chmod 400 ~/.ssh/id_rsa
ssh-add

# pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
cd ~/.pyenv && src/configure && make -C src # make sure cd is in last
# echo 'eval "$(pyenv init --path)"' >>~/.zshrc

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# emacs 需要安装依赖以format json等
npm install --global prettier @prettier/plugin-php prettier-plugin-solidity prettier-plugin-toml

# gnome插件
echo "请登录firefox浏览器..."
echo "请配置gnome插件..."
echo "URL1: https://extensions.gnome.org/extension/2986/runcat/"
echo "URL2: https://extensions.gnome.org/extension/3724/net-speed-simplified/"
echo "URL3: https://extensions.gnome.org/extension/261/kimpanel/"
