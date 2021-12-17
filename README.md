# Arch

```bash
# 将硬件时间设置为localtime
sudo timedatectl set-local-rtc true
sudo timedatectl set-ntp true

sudo pacman -Syyu

echo "zh_CN.UTF-8 UTF-8" >>/etc/locale.gen
sudo locale-gen
```

## AUR source from tuna

## 安装并配置 xray-bin

```
export http_proxy=http://127.0.0.1:10809
export https_proxy=http://127.0.0.1:10809

https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt
```

## 安装必要软件

```bash
# 安装完xray和paru之后
bash o2_after_xray.sh
```

## 配置 rofi

```bash
rofi -show combi -combi-modi window,drun,run,ssh -modi combi -show-icons -dpi 180 -icon-theme 'Papirus'
```

## gnome 插件

```bash
# gnome插件
https://extensions.gnome.org/extension/2986/runcat/
https://extensions.gnome.org/extension/3724/net-speed-simplified/
https://extensions.gnome.org/extension/261/kimpanel/
https://extensions.gnome.org/extension/723/pixel-saver/
```

## gnome 设置桌面快捷方式

```
# paru -S dconf-editor 可通过这里，查看桌面的快捷方式：
导航到 /org/gnome/desktop/wm/keybindings 可以看到所有的快捷键。修改对应的即可。
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

## git 配置 GPG

参考：[](https://docs.github.com/cn/authentication/managing-commit-signature-verification/checking-for-existing-gpg-keys)

注意！一定要配置

```bash
git config --global commit.gpgsign true
```
