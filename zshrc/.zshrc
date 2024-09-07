export ZSH="$HOME/.oh-my-zsh"
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
alias "install"="yay -S"
alias "uninstall"="sudo pacman -Runs"
alias "tmux"="tmux -u"
alias "vim"="nvim"
alias "tt"="tt -t 30"
alias ls="eza --icons=always -l --color=always --group-directories-first"
alias ll="eza --icons=always -al --color=always --group-directories-first"
alias sl=ls
alias htop="btop --utf-force"
# alias rm=trash
alias pbcopy="xsel --input --clipboard"
alias pbpaste="xsel --output --clipboard"
alias logouthypr="hyprctl dispatch exit"
alias tn="tmux new -s"
alias tl="tmux list-sessions"
alias ta="tmux attach -t"
cheat() {curl cht.sh/$1/$2}
eval "$(zoxide init --cmd cd zsh)"

cermic 1 ~/.config/cermicbg
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
