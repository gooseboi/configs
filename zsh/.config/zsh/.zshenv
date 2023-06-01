typeset -U PATH path
export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'

# Other XDG paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}

# Doesn't seem to work
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
export ANDROID_AVD_HOME="$XDG_DATA_HOME"/android
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME"/android
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME"/android

# Disable files
export LESSHISTFILE=-

# Fixing Paths
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export GEM_PATH="$XDG_DATA_HOME/ruby/gems"
export GEM_SPEC_CACHE="$XDG_DATA_HOME/ruby/specs"
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export HISTFILE="$XDG_DATA_HOME"/zsh/history
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java -Dswing.aatext=true -Dawt.useSystemAAFontSettings=on"
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export OPAMROOT="$XDG_DATA_HOME/opam"
export PYTHONPATH="$HOME/.local/bin/pip"
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgreprc"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history
export ZDOTDIR=$HOME/.config/zsh
export ANDROID_HOME="$XDG_DATA_HOME"/android
export GHCUP_USE_XDG_DIRS=true
export WINEPREFIX="$XDG_DATA_HOME"/wine
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export STACK_ROOT="$XDG_DATA_HOME"/stack
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export CABAL_CONFIG="$XDG_CONFIG_HOME"/cabal/config
export CABAL_DIR="$XDG_DATA_HOME"/cabal

# Scaling
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=1
export QT_SCREEN_SCALE_FACTORS="1;1;1"
export GDK_SCALE=1
export GDK_DPI_SCALE=1

# Default Apps
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="alacritty"
export BROWSER="librewolf"
export VIDEO="mpv"
export COLORTERM="truecolor"
export OPENER="xdg-open"
export PAGER="less"

# Other program settings
export SUDO_ASKPASS="$HOME/.local/bin/rofipass"
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"
export _JAVA_AWT_WM_NONREPARENTING=1

# Path
path=("${$(find -L ~/.local/bin -type d -printf %p:)%%:}"
	  "$GEM_HOME/bin"
      "$HOME/go/bin"
      "$CARGO_HOME/bin"
      "$HOME/.ghcup/bin"
      "/opt/zig/bin"
      "$path[@]")
export PATH

# Start blinking
export LESS_TERMCAP_mb="$(tput bold; tput setaf 2)" # green
# Start bold
export LESS_TERMCAP_md="$(tput bold; tput setaf 2)" # green
# Start stand out
export LESS_TERMCAP_so="$(tput bold; tput setaf 3)" # yellow
# End standout
export LESS_TERMCAP_se="$(tput rmso; tput sgr0)"
# Start underline
export LESS_TERMCAP_us="$(tput smul; tput bold; tput setaf 1)" # red
# End Underline
export LESS_TERMCAP_ue="$(tput sgr0)"
# End bold, blinking, standout, underline
export LESS_TERMCAP_me="$(tput sgr0)"
