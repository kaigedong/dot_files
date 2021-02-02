echo "Initing manjaro..."

# 设置源
sudo pacman-mirrors -i -c China -m rank
sudo pacman -Syyu

# 安装必要软件
sudo pacman -S v2ray code emacs alacritty base-devel tmux fcitx5-im fcitx5-rime flameshot rofi go lsd bat

sudo timedatectl set-local-rtc true

echo "请配置 rofi 与 flameshot快捷方式"

# 配置v2ray
sudo mv ./v2ray_config.json /etc/v2ray/config.json
sudo systemctl enable v2ray
sudo systemctl restart v2ray
export http_proxy=http://127.0.0.1:10809
export https_proxy=http://127.0.0.1:10809

# 设置git
git config --global user.name bobo
git config --global user.email dongkaige@gmail.com

# 安装zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv ./zshrc ~/.zshrc

# pure theme
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# 安装rust
mkdir ~/.cargo
cp ./cargo_config ~/.cargo/config

curl https://getsubstrate.io -sSf | bash -s -- --fast
source ~/.cargo/env
cargo install --force subkey --git https://github.com/paritytech/substrate --version 2.0.0
# cargo install
rustup install nightly
cargo install tealdeer ripgrep fd-find
tldr --update

# 配置emacs
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
cp ./doom.d/* ~/.doom.d/

# 配置tmux
cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# 配置fcitx5 
echo "GTK_IM_MODULE DEFAULT=fcitx
QT_IM_MODULE  DEFAULT=fcitx
XMODIFIERS    DEFAULT=\@im=fcitx
SDL_IM_MODULE DEFAULT=fcitx" >> ~/.pam_environment

cp /usr/share/applications/org.fcitx.Fcitx5.desktop ~/.config/autostart
echo "输入法将在重启后生效"
echo "请在重启后，设置输入法引擎"

# 配置alacritty
mkdir -p ~/.config/alacritty
cp ./alacritty.yml ~/.config/alacritty/
echo "Download nerd fonts: https://www.nerdfonts.com/"

# 微软雅黑
echo "Download Yahei: https://www.download-free-fonts.com/"

# alacritty theme:
wget https://codeload.github.com/dracula/alacritty/zip/master
unzip alacritty-master.zip
cd alacritty-master
cp dracula.yml ~/.config/alacritty
cd ../ && rm -r alacritty-master.zip alacritty-master

# pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
cd ~/.pyenv && src/configure && make -C src

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

# ssh
mkdir ~/.ssh
cp ./ssh/* ~/.ssh/

# gnome插件
echo "请登录firefox浏览器..."
echo "请配置gnome插件..."
echo "URL1: https://extensions.gnome.org/extension/2986/runcat/"
echo "URL2: https://extensions.gnome.org/extension/3724/net-speed-simplified/"
echo "URL3: https://extensions.gnome.org/extension/261/kimpanel/"
