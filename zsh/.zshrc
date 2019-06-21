# Path to your oh-my-zsh installation.
export ZSH=/home/ben/.config/oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="lunar"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  wd
  colored-man-pages
  cmdtime
  vi-mode
)

export HISTFILE=$ZDOTDIR/.zsh_history

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls="exa -F"
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
