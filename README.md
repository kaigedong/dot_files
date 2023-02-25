```bash
# 安装并配置 xray
export http_proxy=http://127.0.0.1:10809
export https_proxy=http://127.0.0.1:10809

# SwitchyOmega
https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt
```

### 其他软件

```shell
bash install.sh
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
