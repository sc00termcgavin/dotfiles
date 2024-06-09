#    .-') _    .-')     ('-. .-. 
#   (  OO) )  ( OO ).  ( OO )  / 
# ,(_)----.  (_)---\_) ,--. ,--. 
# |       |  /    _ |  |  | |  |                                 
# '--.   /   \  :` `.  |   .|  |    _       _    _  _  _           
# (_/   /     '..`''.) |       |   ( )     ( ) ,'_)(_)( )        
#  /   /___  .-._)   \ |  .-.  |  _| | ___ | | | |  _ | | ___  __     
# |        | \       / |  | |  | / o )( o )( _)( _)( )( )( o_)(_'     
# `--------'  `-----'  `--' `--' \___\ \_/ /_\ /_\ /_\/_\ \(  /__)
# ⮐ ⮐ ⮐ ⮐ ⮐ ⮐ ⮐ ⮐ ⮐ ⮐  ⮐ 

#   ___ _ ____   _____ 
#  / _ \ '_ \ \ / / __|
# |  __/ | | \ V /\__ \
#  \___|_| |_|\_/ |___/
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export FIREFOX_APP="Firefox work.app"
export PATH=$(brew --prefix)/bin:$PATH      
export CLICOLOR=1
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin
export PATH="/usr/local/texlive/2023/bin/universal-darwin:$PATH"

#python
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"


eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

#Node
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# set PATH so it includes user's private ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi
#  _                 _                    _            
# | |               | |                  (_)           
# | | ___   __ _  __| |   ___ _ __   __ _ _ _ __   ___ 
# | |/ _ \ / _` |/ _` |  / _ \ '_ \ / _` | | '_ \ / _ \
# | | (_) | (_| | (_| | |  __/ | | | (_| | | | | |  __/
# |_|\___/ \__,_|\__,_|  \___|_| |_|\__, |_|_| |_|\___|
#                                    __/ |             
#                                   |___/    
# speed up completions add to cache directory 
autoload -Uz compinit
for dump in ~/.cache/zsh/zcompdump(N.mh+24); do
  compinit -d ~/.cache/zsh/zcompdump
done
compinit -C -d ~/.cache/zsh/zcompdump

# call function before each prompt
autoload -Uz add-zsh-hook
autoload -Uz vcs_info
precmd () { vcs_info }
_comp_options+=(globdots)


#  _     _     _                   
# | |   (_)   | |                  
# | |__  _ ___| |_ ___  _ __ _   _ 
# | '_ \| / __| __/ _ \| '__| | | |
# | | | | \__ \ || (_) | |  | |_| |
# |_| |_|_|___/\__\___/|_|   \__, |
#                             __/ |
#                            |___/  
HISTFILE="$HOME/.cache/zsh/.zsh_history" 
HISTSIZE=32768                  # (2^15)num cmds stored in mem during session
export HISTFILESIZE="${HISTSIZE}"
SAVEHIST=4096                       

setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
setopt SHARE_HISTORY             # Share history between all sessions.

#      _ _               _             _           
#     | (_)             | |           (_)          
#   __| |_ _ __ ___  ___| |_ ___  _ __ _  ___  ___ 
#  / _` | | '__/ _ \/ __| __/ _ \| '__| |/ _ \/ __|
# | (_| | | | |  __/ (__| || (_) | |  | |  __/\__ \
#  \__,_|_|_|  \___|\___|\__\___/|_|  |_|\___||___/

setopt AUTO_CD                  #  Cmd is the dir name, cd into dir
setopt AUTO_PUSHD               #  Push old dir onto dir stack
unsetopt PUSHD_IGNORE_DUPS      #  No copies pushed onto dir stack
setopt PUSHD_MINUS              #  When used with a number to specify dir change + w/ -

#                            _      _   _             
#                           | |    | | (_)            
#   ___ ___  _ __ ___  _ __ | | ___| |_ _  ___  _ __  
#  / __/ _ \| '_ ` _ \| '_ \| |/ _ \ __| |/ _ \| '_ \ 
# | (_| (_) | | | | | | |_) | |  __/ |_| | (_) | | | |
#  \___\___/|_| |_| |_| .__/|_|\___|\__|_|\___/|_| |_|
#                     | |                             
#                     |_|               

setopt AUTO_MENU                # Menu comp upon tab repeat               
setopt ALWAYS_TO_END            # Move cursor to end if either match or completion
setopt COMPLETE_IN_WORD         # Cursor set at end 
unsetopt FLOW_CONTROL           # Output flow control via start/stop characters
unsetopt MENU_COMPLETE          # Insert the first match immediately
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path
zstyle ':completion:*' list-colors ''

# zsh-autosuggestions
if [[ -f "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
        # will first try to find a suggestion from your history, but,
        # if it can't find a match, will find a suggestion from the completion engine.
        export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
        source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
        # Search Previous Used Commands using arrows
        # up and down arrows - history search
        autoload -U history-search-end
        zle -N history-beginning-search-backward-end history-search-end
        zle -N history-beginning-search-forward-end history-search-end
        bindkey "^[[A" history-beginning-search-backward-end
        bindkey "^[[B" history-beginning-search-forward-end
fi

# zsh-syntax-highlighting
if [[ -f "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
        source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

#        _ _                     
#       | (_)                    
#   __ _| |_  __ _ ___  ___  ___ 
#  / _` | | |/ _` / __|/ _ \/ __|
# | (_| | | | (_| \__ \  __/\__ \
#  \__,_|_|_|\__,_|___/\___||___/   

alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'
alias bog="brew outdated --greedy"
 
alias ip="curl icanhazip.com"   # Your public IP address
alias varsrc="uname -m | grep arm64 && echo 'export PATH=$PATH:/VAR' >> ~/.zshrc && source ~/.zshrc"                                               

#alias python='python3'

alias kdns='sudo killall -HUP mDNSResponder'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"                  # Go to previous dir with -
alias cd.='cd $(readlink -f .)'    # Go to real dir (i.e. if current dir is linked)

alias ll='ls -lG'

#   __                  _   _                 
#  / _|                | | (_)                
# | |_ _   _ _ __   ___| |_ _  ___  _ __  ___ 
# |  _| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
# | | | |_| | | | | (__| |_| | (_) | | | \__ \
# |_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/                                                       
mkcd() {
  mkdir -p "@"
  cd "$@" || exit
}

# shell functions to encrypt files easier
secret () {
        output=~/"${1}".$(date +%s).enc
        gpg --encrypt --armor --output ${output} -r 0x0000 -r 0x0001 -r 0x0002 "${1}" && echo "${1} -> ${output}"
}

reveal () {
        output=$(echo "${1}" | rev | cut -c16- | rev)
        gpg --decrypt --output ${output} "${1}" && echo "${1} -> ${output}"
}

#                                  _   
#                                 | |  
#  _ __  _ __ ___  _ __ ___  _ __ | |_ 
# | '_ \| '__/ _ \| '_ ` _ \| '_ \| __|
# | |_) | | | (_) | | | | | | |_) | |_ 
# | .__/|_|  \___/|_| |_| |_| .__/ \__|
# | |                       | |        
# |_|                       |_|       

eval "$(starship init zsh)"

# ^ ^
#(O,O)
#(   ) Hooty Hoot
#-"-"-------------
#-----------------

# Python env
# alias brew='env PATH="${PATH//$(pyenv root)/shims:/}" brew'



# gpg
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
gpg-connect-agent UPDATESTARTUPTTY /bye > /dev/null


