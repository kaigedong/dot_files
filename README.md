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
echo "URL1: https://extensions.gnome.org/extension/2986/runcat/"
echo "URL2: https://extensions.gnome.org/extension/3724/net-speed-simplified/"
echo "URL3: https://extensions.gnome.org/extension/261/kimpanel/"
echo "URL4: https://extensions.gnome.org/extension/723/pixel-saver/"
```
