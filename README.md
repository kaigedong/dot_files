```bash
# 安装并配置 xray
export http_proxy=http://127.0.0.1:10809
export https_proxy=http://127.0.0.1:10809

# SwitchyOmega
https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt
```

### 其他软件

```shell
sudo pacman -Syu --needed --noconfirm \
emacs alacritty base-devel tmux fcitx5-im fcitx5-rime \
flameshot rofi lsd bat i3-wm feh tig papirus-icon-theme

paru -S visual-studio-code-bin nerd-fonts-noto-sans-mono watchexec jq \
  screenkey polybar tokei xclip stylua-bin nutstore-experimental screenfetch \
  btop copyq picom xfce-polkit
```

#### 设置 git

```
git config --global user.name kaigedong
git config --global user.email dongkaige@gmail.com
git config --global commit.gpgsign true
```

#### emacs

```
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
```

#### fcitx5

```
echo "GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
INPUT_METHOD=fcitx
SDL_IM_MODULE=fcitx
GLFW_IM_MODULE=ibus" >>/etc/environment
cp /usr/share/applications/org.fcitx.Fcitx5.desktop ~/.config/autostart/
```

#### Rust

```bash
curl https://getsubstrate.io -sSf | bash -s -- --fast
source ~/.cargo/env
cargo install --force subkey --git https://github.com/paritytech/substrate --version 2.0.2 --locked
cargo install tealdeer ripgrep fd-find lolcat coreutils fnm cargo-update coreutils
tldr --update
```

#### Node

```bash
# under bash: init fnm
eval "$(fnm env --use-on-cd)" && fnm install 14 && fnm default 14

# nvm
#curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#nvm install 14

# emacs 需要安装依赖以format json等
npm install --global prettier @prettier/plugin-php prettier-plugin-solidity prettier-plugin-toml yarn
npm i -g alacritty-themes
```

#### Python

```bash
# pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
cd ~/.pyenv && src/configure && make -C src
```

#### Terminal

```bash
# tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf

#安装oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#zsh theme
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
#zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/sukkaw/zsh-proxy.git ~/.oh-my-zsh/custom/plugins/zsh-proxy
```

### rofi

```bash
rofi -show combi -combi-modi window,drun,run,ssh -modi combi -show-icons -dpi 180 -icon-theme 'Papirus'
```

### Gnome 插件

[https://extensions.gnome.org/extension/2986/runcat/](https://extensions.gnome.org/extension/2986/runcat/)

[https://extensions.gnome.org/extension/3724/net-speed-simplified/](https://extensions.gnome.org/extension/3724/net-speed-simplified/)

[https://extensions.gnome.org/extension/261/kimpanel/](https://extensions.gnome.org/extension/261/kimpanel/)

[https://extensions.gnome.org/extension/723/pixel-saver/](https://extensions.gnome.org/extension/723/pixel-saver/)

### Gnome 设置桌面快捷方式

```bash
paru -S dconf-editor # (查看桌面的快捷方式)：
# 导航到 /org/gnome/desktop/wm/keybindings 可以看到所有的快捷键。修改对应的即可。
# 也可以通过命令行进行修改：

# 查看快捷键绑定：
dconf read /org/gnome/desktop/wm/keybindings/switch-to-workspace-1

dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-5 "['<Super>5']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-6 "['<Super>6']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-7 "['<Super>7']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-8 "['<Super>8']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-9 "['<Super>9']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-10 "['<Super>0']"

dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-5 "['<Shift><Super>percent']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-6 "['<Shift><Super>asciicircum']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-7 "['<Shift><Super>ampersand']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-8 "['<Shift><Super>asterisk']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-9 "['<Shift><Super>parenleft']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-10 "['<Shift><Super>parenright']"
```

## 其他问题：

### Firefox 4K 显示屏下缩放问题

> https://winaero.com/enable-hidpi-scaling-firefox/

`about:config` -- `layout.css.devPixelsPerPx`, the default value is `-1`, it means `follow the system settings`.

You can change it to `1.5`

### Firefox beep when searching not match

`about:config` -- `accessibility.typeaheadfind.enablesound`, set it to `false`.

## zsh_history to fish_history

```bash
gcc -c zsh_history_to_utf8.c && gcc zsh_history_to_utf8.o -o zsh_history_to_utf8
cat ~/.zsh_history | ./zsh_history_to_utf8 > zsh_history
python zsh_history_to_fish.py
cat fish_history >> ~/.local/share/fish/fish_history
```

### 将硬件时间设置为 localtime （win/linux 双系统时）

```shell
# 将硬件时间设置为localtime
sudo timedatectl set-local-rtc true
sudo timedatectl set-ntp true
```

### 设置中文

```shell
echo "zh_CN.UTF-8 UTF-8" >>/etc/locale.gen
sudo locale-gen
```
