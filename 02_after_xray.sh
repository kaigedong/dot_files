export http_proxy=http://127.0.0.1:10809
export https_proxy=http://127.0.0.1:10809

sudo pacman -S emacs alacritty base-devel tmux fcitx5-im fcitx5-rime \
    flameshot rofi go lsd bat i3-wm feh tig papirus-icon-theme yay

yay -S visual-studio-code-bin nerd-fonts-noto-sans-mono watchexec jq \
  screenkey polybar tokei xclip fzf stylua-bin

# 设置git
git config --global user.name kaigedong
git config --global user.email dongkaige@gmail.com
git config --global commit.gpgsign true

# 安装oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh pure theme (powerlevel10k 也不错)
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

# 配置tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf

# 配置fcitx5
echo "GTK_IM_MODULE DEFAULT=fcitx
QT_IM_MODULE  DEFAULT=fcitx
XMODIFIERS    DEFAULT=\@im=fcitx
INPUT_METHOD  DEFAULT=fcitx
SDL_IM_MODULE DEFAULT=fcitx" >>~/.pam_environment

cp /usr/share/applications/org.fcitx.Fcitx5.desktop ~/.config/autostart

# fnm
eval "$(fnm env)"
fnm install 14
fnm default 14

# emacs 需要安装依赖以format json等
npm install --global prettier @prettier/plugin-php prettier-plugin-solidity prettier-plugin-toml yarn
npm i -g alacritty-themes

# pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
cd ~/.pyenv && src/configure && make -C src
