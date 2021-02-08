# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# alias
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls="lsd"
alias la="ls -lth --date \"+%Y-%m-%d %H:%M:%S\""
alias lb="ls -lh"
alias grep="rg"
alias less="bat -p"
alias baidunetdisk="/usr/lib/baidunetdisk/baidunetdisk"
alias top="glances"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
source $OMF_PATH/pkg/fish/conf.d/dracula.fish

# starship init fish | source
