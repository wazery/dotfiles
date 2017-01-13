# Allow local customizations in the ~/.zshrc_local_before file
if [ -f ~/.zshrc_local_before ]; then
    source ~/.zshrc_local_before
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="kennethreitz"
# ZSH_THEME="steeef"
# ZSH_THEME="jbergantine"
#ZSH_THEME="nebirhos"
ZSH_THEME="random"
# ZSH_THEME="suvash"
#ZSH_THEME="sorin"
#ZSH_THEME="re5et"

# Vim style shortcuts
bindkey -v

# Some aliases
alias delete_merged_branches="git branch --merged | grep -v "\*" | grep -v master | grep -v dev | xargs -n 1 git branch -d"

# Instabug aliases
# Copy the IBG database config file
alias pdb="cp ~/Desktop/database.yml ~/Workspace/instabug/backend/config/database.yml"
alias ibgpush="bin/rubocop && ggpush -f"
alias ibgbe='cd ~/Workspace/instabug/backend'
alias ibgfe='cd ~/Workspace/instabug/webapp'
alias ibgstag='cd ~/Desktop && ssh -i "instabug2.pem" ec2-user@ec2-52-3-65-65.compute-1.amazonaws.com'
alias ibgadmin="cd ~/Desktop && ssh -i "instabug.pem" ec2-user@ec2-52-90-11-196.compute-1.amazonaws.com && cd -"
alias dbdump='/usr/local/mysql/bin/mysqldump -u root instabug_development > ~/Desktop/instabug_development.sql'
alias dapi='cd ~/Workspace/draft/api'
alias dweb='cd ~/Workspace/draft/webapp'
alias dplug='cd ~/Workspace/draft/plugin'

# Algorithms Toolbox Course
alias gpp="g++ -pipe -O2 -std=c++11"

# Speed the Time Machine backup
alias speedbackup='sudo sysctl debug.lowpri_throttle_enabled=0'

# Draft App
alias draft="~/Workspace/draft/draft-app-api"

# The fuck
eval "$(thefuck --alias)"

# SCM Puff
eval "$(scmpuff init -s)"


# Color scheme switching
it2prof() { echo -e "\033]50;SetProfile=$1\a" }

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"
# Always use color output for `ls`
alias ls="command ls ${colorflag}"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update'

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras rails ruby gem bundler sublime terminalapp brew osx rvm cap tmux git-flow wd zsh-nvm)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"


#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH="${PATH}:/var/lib/gems/1.8/bin/"
wd() {
  . /Users/islamwazery/bin/wd/wd.sh
}
#export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/islamwazery/.rvm/bin:/Users/islamwazery/Sources/depot_tools:/Users/islamwazery/Sources/depot_tools

#function prompt_rvm {
#    rbv=`rvm-prompt`
#    rbv=${rbv#ruby-}
#    [[ $rbv == *"@"* ]] || rbv="${rbv}@default"
#    echo $rbv
#}

# Change NPM default path
export PATH="$PATH:$HOME/npm/bin"
export NODE_PATH="$NODE_PATH:$HOME/npm/lib/node_modules"

# Zsh Auto Suggestions

# Load zsh-syntax-highlighting.
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load zsh-autosuggestions.
source ~/.zsh/zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically.
zle-line-init() {
    zle autosuggest-start
    }
    zle -N zle-line-init

export NVM_DIR="/Users/islamwazery/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$HOME/.yarn/bin:$PATH"

export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin
