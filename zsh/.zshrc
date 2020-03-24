# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/oh-my-zsh"

#ZSH_THEME="lunar"
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time background_jobs dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode status command_execution_time)

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

COMPLETION_WAITING_DOTS="true"

plugins=(
    wd
    colored-man-pages
    cmdtime
    vi-mode
)

export HISTFILE=$ZDOTDIR/.zsh_history

source $ZSH/oh-my-zsh.sh

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=" %{$fg_bold[cyan]%}λ%{$reset_color%} "

alias ls="exa -F"
alias l="exa -lh"
alias ll="exa -lah"
alias cat="bat"
alias j="just"
alias py="python3"
# compiles rust program from stdin
alias playrs="cat > /tmp/play.rs && echo 'Compiling...' && rustc /tmp/play.rs -o /tmp/play && echo '==>' && /tmp/play"
# evaluates rust expr from stdin
alias evalrs="echo 'fn main() { println!(\"{:?}\", {' > /tmp/play.rs && cat >> /tmp/play.rs && echo '\n} ); }' >> /tmp/play.rs && echo 'Compiling...' && rustc -o /tmp/play /tmp/play.rs && echo '==>' && /tmp/play"
# retries last command with sudo
alias please='sudo $(fc -ln -1)'
# flashes ergodox
alias flashkb='teensy-loader-cli -mmcu=atmega32u4 -v -w'
# escaped single quotes    vvvvv           vvvv
alias extractids='grep -Po '"'"'ID:\K[0-9]*'"'"
alias extractjoins='grep -Po '"'"'ID:\K[0-9]*(?=.*joined)'"'"
# output clipboard
alias clipo='xclip -o -sel clip'
# input clipboard
alias clipi='xclip -i -sel clip'
# better lsblk default
alias lsblk='lsblk -o name,label,fstype,size,fsuse%,type,mountpoint'
# more convenient fehbg usage
alias fehbg='~/.fehbg'

# opens file with fzf
function fzo(){
    cmd="nvim"
    if [ -n "$1" ]; then
        cmd="$@"
    fi
    fzf -m | xargs "$cmd"
}

function countdown(){
    date1=$((`date +%s` + $1));
    while [ "$date1" -ge `date +%s` ]; do
        echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
        sleep 0.1
    done
}
function stopwatch(){
    date1=`date +%s`;
    while true; do
        echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
        sleep 0.1
    done
}

function packages() {
    pacman -Qq $1 | fzf --preview 'pacman -Qil {}' --bind 'enter:execute(pacman -Qil {} | less)'
}

function ban() {
    echo ">>ban $( cat "$1" ) raid botnet" | tr '\n' ' ' | clipi
}
