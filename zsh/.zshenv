export KEYTIMEOUT=1

export VISUAL=/usr/bin/nvim
export EDITOR=/usr/bin/ed


export XDG_CONFIG_HOME=$HOME/.config
export ZSH=$HOME/.config/oh-my-zsh
export ELINKS_CONFDIR=$XDG_CONFIG_HOME/elinks
export MPLAYER_HOME=$XDG_CONFIG_HOME/mplayer
export IDEA_PROPERTIES=$XDG_CONFIG_HOME/idea/config/idea.properties
export CLION_PROPERTIES=$XDG_CONFIG_HOME/clion/config/idea.properties
export CCACHE_CONFIGPATH=$XDG_CONFIG_HOME/ccache
export DOCKER_HOME=$XDG_CONFIG_HOME/docker
export IPYTHONDIR=$XDG_CONFIG_HOME/jupyter
export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export PYTHONSTARTUP=$XDG_CONFIG_HOME/python/init.py

export XDG_CACHE_HOME=$HOME/.cache
export ZSH_COMPDUMP=$XDG_CACHE_HOME/zsh
export GOPATH=$XDG_CACHE_HOME/go
export CCACHE_DIR=$XDG_CACHE_HOME/ccache
export NPM_CONFIG_CACHE=$XDG_CACHE_HOME/npm
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java
export LESSHISTFILE=-

export XDG_DATA_HOME="$HOME/.local/share"
export CARGO_HOME=$XDG_DATA_HOME/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export GNUPGHOME=$XDG_DATA_HOME/gpg
export GRADLE_USER_HOME=$XDG_DATA_HOME/gradle
export STACK_ROOT=$XDG_DATA_HOME/stack
export ANDROID_SDK_HOME=$XDG_DATA_HOME/android
export NODE_REPL_HISTORY=$XDG_DATA_HOME/node_repl_history

export PATH=$CARGO_HOME/bin:$HOME/.local/bin:$HOME/.emacs.d/bin:$PATH

export RUST_SRC_PATH=$RUSTUP_HOME/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
