# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
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
alias "cat"="bat --style=plain"
alias "servers"="~/MainDrive/ssh.sh"
alias wreboot="sudo grub-reboot 3 && reboot"

# Blur {{{
# if [[ $(ps --no-header -p $PPID -o comm) =~ '^yakuake|kitty$' ]]; then
#         for wid in $(xdotool search --pid $PPID); do
#             xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid; done
# fi
# }}}

export HISTSIZE=1000000000
export HISTFILESIZE=1000000000
export HISTTIMEFORMAT=" "
export HISTCONTROL=ignoreboth:erasedups

# alias "install"="sudo pacman -S"
alias "install"="yay -S"
alias "uninstall"="sudo pacman -Runs"
alias "tmux"="tmux -u"
alias "vim"="nvim"
alias ls="eza -l --color=always --group-directories-first"
alias ll="eza -al --color=always --group-directories-first"
alias sl=ls
alias htop="btop --utf-force"
# alias rm=trash
alias pbcopy="xsel --input --clipboard"
alias pbpaste="xsel --output --clipboard"
alias logouthypr="hyprctl dispatch exit"
cheat() {curl cht.sh/$1/$2}
eval "$(zoxide init --cmd cd zsh)"
# colorscript random
cermic 1 /Users/achal.pathak/tmp/cermic-tiny-art-repo/images
# alias source-zshrc="source ~/.zshrc"

# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   # exec tmux new-session -A -s main
#   # tmux attach || exec tmux new-session && exit;
#   exec tmux
# fi


. ~/.dx-zsh-completion.sh
