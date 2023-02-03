export http_proxy=http://127.0.0.1:10809
export https_proxy=http://127.0.0.1:10809

sudo pacman -S emacs alacritty base-devel tmux fcitx5-im fcitx5-rime \
  flameshot rofi go lsd bat i3-wm feh tig papirus-icon-theme

paru -S visual-studio-code-bin nerd-fonts-noto-sans-mono watchexec jq \
  screenkey polybar tokei xclip stylua-bin nutstore-experimental screenfetch \
  btop copyq picom

# 设置git
git config --global user.name kaigedong
git config --global user.email dongkaige@gmail.com
git config --global commit.gpgsign true

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

# rust
curl https://getsubstrate.io -sSf | bash -s -- --fast
source ~/.cargo/env
cargo install --force subkey --git https://github.com/paritytech/substrate --version 2.0.2 --locked
cargo install tealdeer ripgrep fd-find lolcat coreutils fnm
tldr --update

# under bash: init fnm
eval "$(fnm env --use-on-cd)" && fnm install 14 && fnm default 14

# nvm
#curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#nvm install 14

# emacs
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

# emacs 需要安装依赖以format json等
npm install --global prettier @prettier/plugin-php prettier-plugin-solidity prettier-plugin-toml yarn
npm i -g alacritty-themes

# tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf

# fcitx5
echo "GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
INPUT_METHOD=fcitx
SDL_IM_MODULE=fcitx
GLFW_IM_MODULE=ibus" >>/etc/environment
cp /usr/share/applications/org.fcitx.Fcitx5.desktop ~/.config/autostart/

# pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
cd ~/.pyenv && src/configure && make -C src
