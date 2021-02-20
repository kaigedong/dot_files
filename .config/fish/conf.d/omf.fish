# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
source $OMF_PATH/pkg/fish/conf.d/dracula.fish

# starship init fish | source

# alias
abbr -a la "lsd -lth --date \"+%Y-%m-%d %H:%M:%S\""
abbr -a lb "la -a"
abbr -a grep rg
abbr -a less "bat -p"
abbr -a baidunetdisk /usr/lib/baidunetdisk/baidunetdisk
abbr -a top glances
