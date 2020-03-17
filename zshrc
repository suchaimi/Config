# Suchaimi ZSH Config File

# Set name of the theme to load
ZSH_THEME="spaceship"

# Disable auto update
DISABLE_AUTO_UPDATE="true"

# Load plugins
plugins=(git tmux rust cargo golang docker gitignore vi-mode web-search history-substring-search)

# Alias
alias vim='nvim'
alias sucha='tmux new -s Sucha \; new-window \;'
alias pasta='tmux new -s Pasta \; new-window \;'
alias wind='tmux new-window \; split-window -h -l 108 \; split-window -v'
alias panes='tmux split-window -h \; split-window -v'
alias aria='aria2c --check-certificate=true --http-accept-gzip=true --dir=/home/suchaimi/Downloads -s 16 -k 5M -x 4 -j 16'

# Export environment path
export EDITOR="nvim"
export SHELL="zsh"
export BAT_THEME="base16"
export ZSH="/home/suchaimi/.oh-my-zsh"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export PATH="/home/suchaimi/.local/bin:$PATH"
export FZF_DEFAULT_OPTS='--height 30%'

# Using wal colorscheme
(cat ~/.cache/wal/sequences &)

# Source file
source ~/.profile
source $ZSH/oh-my-zsh.sh
source ~/.cache/wal/colors-tty.sh

# Import the colors.
. "${HOME}/.cache/wal/colors.sh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/home/suchaimi/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

