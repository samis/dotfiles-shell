# Path to your oh-my-zsh installation.
export ZSH=/home/samis/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k/powerlevel9k"

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
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(gitignore git-extras colored-man-pages extract safe-paste )

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nano'
else
    export EDITOR='emacsclient'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='green'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="black"
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="red"
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND="white"
POWERLEVEL9K_HISTORY_BACKGROUND='238'
export ALTERNATE_EDITOR=""
#export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
alias emacs=emacsclient
alias nano=emacs
#source ~/.xsh
#source /etc/profile.d/emscripten.sh
alias ls="ls --color=auto"
alias in-dotfiles='() {( cd ~/dotfiles; $@)} '
alias ind=in-dotfiles
# gpg-agent, done right.
eval $(gpg-agent --daemon --enable-ssh-support)
# GNUstep application root
export GNUSTEP_USER_ROOT="${HOME}/GNUstep"

# Add to the path variable named by $1 the component $2.  $3 must be
# "append" or "prepend" to indicate where the component is added.
addpath () {
    eval value=\"\$$1\"
    case "$value" in
        *:$2:*|*:$2|$2:*|$2)
            result="$value"
            ;;
        "")
            export $1
            result="$2"
            ;;
        *)
            case "$3" in
                p*)
                    result="$2:${value}"
                    ;;
                *)
                    result="${value}:$2"
                    ;;
            esac
    esac
    eval $1=$result
    unset result value
}

# convenience routine which appends a string to a path.
append () {
    addpath "$1" "$2" append
}

# convenience routine which prepends a string to a path.
prepend () {
    addpath "$1" "$2" prepend
}
append PATH /home/samis/.gem/ruby/2.1.0/bin
prepend PATH /home/samis/bin
