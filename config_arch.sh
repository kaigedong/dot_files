# 设置源
# For Manjaro: sudo pacman-mirrors -i -c China -m rank
sudo pacman -Syyu
# 恢复默认源
# sudo pacman-mirrors --country all --api --protocol all --set-branch stable && sudo pacman -Syyu

# 本地化文本编码
sudo su
echo "zh_CN.UTF-8 UTF-8" >>/etc/locale.gen
sudo locale-gen

# 安装必要软件
sudo pacman -S emacs alacritty base-devel tmux fcitx5-im fcitx5-rime \
	flameshot rofi go lsd bat i3-wm polybar feh tig papirus-icon-theme

paru -S visual-studio-code-bin xray-bin nerd-fonts-noto-sans-mono fnm

# sway: 修改 /etc/gdm/custom.conf, 删掉 WaylandEnable=false

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

# 配置tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf

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

# echo "Download nerd fonts: https://www.nerdfonts.com/"
# nerd-fonts-noto-sans-mono.git
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=nerd-fonts-noto-sans-mono

# 微软雅黑
echo "Download Yahei: https://www.download-free-fonts.com/"

# pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
cd ~/.pyenv && src/configure && make -C src # make sure cd is in last
# echo 'eval "$(pyenv init --path)"' >>~/.zshrc
