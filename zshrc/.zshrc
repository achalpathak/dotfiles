export ZSH="$HOME/.oh-my-zsh"
export PATH="/usr/bin/wezterm:$PATH"
plugins=(
    git
    history-substring-search
    colored-man-pages
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-z
)
source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"
# alias wreboot="sudo grub-reboot 3 && reboot"


HISTFILE=$HOME/.zhistory
SAVEHIST=10000
HISTSIZE=9999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

export HISTSIZE=1000000000
export HISTFILESIZE=1000000000
export HISTTIMEFORMAT=" "
export HISTCONTROL=ignoreboth:erasedups
# Upgrade
alias y="yay"

# Search
alias ys="yay -Ss"

# Install
alias yi="yay -S"

# Remove
alias yr="yay -R"

# alias "install"="sudo pacman -S"
alias "upgrade"='yay -Syu'
alias "update"= 'yay -S'
alias "install"="yay -S"
alias "uninstall"="yay -Rdd"
# alias "uninstall"="sudo pacman -Rd --nodeps"
alias "tmux"="tmux -u"
alias "vim"="nvim"
alias "tt"="tt -t 30"
alias ls="eza --icons=always -l --color=always --group-directories-first"
alias ll="eza --icons=always -al --color=always --group-directories-first"
alias sl=ls
alias htop="btop"
# alias rm=trash
alias logouthypr="hyprctl dispatch exit"
# alias tn="tmux new -s"
# alias tl="tmux list-sessions"
# alias ta="tmux attach -t"

tn() { wezterm cli activate-workspace "$1"; }
# ta() { wezterm cli activate-workspace "$1"; }
# alias tl='wezterm cli list-clients'
tl() {
  local ws
  ws=$(wezterm cli list --format json | jq -r '.[].workspace' | sort -u | fzf --prompt="Switch workspace: ")
  if [[ -n $ws ]]; then
    wezterm cli activate-tab --workspace "$ws"
  fi
}
eval "$(zoxide init --cmd cd zsh)"


# git aliases
alias ga='git add'
alias gs='git status'
alias gco='git checkout'
alias gcm='git commit -m'
alias gpush='git push origin $(git branch --show-current)' #push to current branch
alias gpull='git pull origin $(git branch --show-current)'

cermic 1 ~/.config/cermicbg
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Enables reverse search with fzf on mac
source /opt/homebrew/Cellar/fzf/0.53.0/shell/key-bindings.zsh 2>/dev/null
source /opt/homebrew/Cellar/fzf/0.53.0/shell/completion.zsh 2>/dev/null

[ -n "$WEZTERM_PANE" ] && export NVIM_LISTEN_ADDRESS="/tmp/nvim$WEZTERM_PANE"
