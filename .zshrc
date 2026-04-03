# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH
export PATH=/Users/oskar1233/.cache/rebar3/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to Java
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-13.0.2.jdk/Contents/Home"
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
export ANDROID_HOME="$HOME/Library/Android/sdk"


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="3den"

# Set lis of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  zsh-vi-mode
  git
  direnv
)

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

export NVM_DIR="$HOME/.nvm"
alias load_nvm='
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
'

export EDITOR='nvim'
export VISUAL='nvim'

alias vim='nvim'

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# eval $(docker-machine env)
export ASDF_DATA_DIR=/Users/oskar1233/.asdf-old
export PATH="$ASDF_DATA_DIR/shims:$PATH"

if command -v thefuck &> /dev/null
then
	eval $(thefuck --alias)
fi

# Completion for kubectl
if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

if [ -f '/usr/local/opt/asdf/asdf.sh' ]; then . /usr/local/opt/asdf/asdf.sh
fi

if [ -f "$HOME/.asdf/asdf.sh" ]; then . $HOME/.asdf/asdf.sh
fi
export MODULAR_HOME="/Users/oskar1233/.modular"
export PATH="/Users/oskar1233/.modular/pkg/packages.modular.com_mojo/bin:$PATH"
export PATH="/Users/oskar1233/surfer/.devbox/virtenv/cargo/bin:$PATH"

alias go-reshim='asdf reshim golang && export GOROOT="$(asdf where golang)/go/"'

. ~/.asdf-old/plugins/golang/set-env.zsh

source <(fzf --zsh)

if [ -f ~/.env ]
then
  export $(grep -v '^#' ~/.env | xargs)
fi

# rustup instead of asdf for rust
. "$HOME/.cargo/env"

autoload -U compinit; compinit

# bun completions
[ -s "/Users/oskar1233/.bun/_bun" ] && source "/Users/oskar1233/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/Users/oskar1233/.hookctl/bin:$PATH"
export PATH="/Users/oskar1233/.local/bin:$PATH"

# OpenClaw Completion (very slow)
export PATH=$PATH:$HOME/.maestro/bin

# z instead of cd
eval "$(zoxide init zsh)"

export PATH="/Users/oskar1233/.pixi/bin:$PATH"

# opencode
export PATH=/Users/oskar1233/.opencode/bin:$PATH

# OpenClaw Completion
source "/Users/oskar1233/.openclaw/completions/openclaw.zsh"
