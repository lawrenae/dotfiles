function toggleproxy {
    #if [ -z "$PROXY_PASSWORD" ]; then
    #    read -s -p "enter your proxy password: " PROXY_PASSWORD
    #    echo ""
    #fi
    #PROXY_URL="http://al74682:$PROXY_PASSWORD@cdcproxy.kroger.com:3128/" 
    PROXY_URL="http://127.0.0.1:3128/" 

    if [ -n "$HTTP_PROXY" ]; then
      echo "Turning off proxy"
      #sudo networksetup -setwebproxystate wi-fi off
      #sudo networksetup -setsecurewebproxystate wi-fi off
      #sed -i '' '/proxy/s/^#//g' ~/.atom/.apmrc
      unset HTTP_PROXY
      unset HTTPS_PROXY
      unset http_proxy
      unset https_proxy
      unset NO_PROXY
    else
      echo "Turning on proxy"
      #sudo networksetup -setwebproxystate wi-fi on
      #sudo networksetup -setsecurewebproxystate wi-fi on
      #sed -i '' '/proxy/s/^/#/g' ~/.atom/.apmrc
      export HTTP_PROXY=$PROXY_URL
      export HTTPS_PROXY=$PROXY_URL
      export http_proxy=$PROXY_URL
      export https_proxy=$PROXY_URL
      export NO_PROXY="169.254/16, www-local*, *.kroger.com, 192.168.99.*, 10.3.*, localhost"
    fi
}

function goct() {
    local project_hash=-1
    while true; do
        local new_project_hash="$(find . -type f -print0 | sort -z | xargs -0 shasum | shasum)"
        if [ "${new_project_hash}" != "${project_hash}" ]; then
            project_hash="${new_project_hash}"
            echo "Change detected - executing tests..."
            go test $(go list ./... | grep -v /vendor/)
            echo
        fi
        sleep 10
    done
}

export NVM_DIR="/Users/al74682/.nvm"
source $(brew --prefix nvm)/nvm.sh

export MAVEN_OPTS=-Xmx2048m
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
ulimit -n 8096

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi


# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/al74682/bin/google-cloud-sdk/path.bash.inc ]; then
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/al74682/bin/google-cloud-sdk/completion.bash.inc ]; then
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'
fi

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
GIT_PS1_SHOWDIRTYSTATE=true
YELLOW="\[$(tput setaf 3)\]"
RESET="\[$(tput sgr0)\]"

#export PS1="\h:\w \$(__git_ps1 \" ${YELLOW}(%s)${RESET} \")\$ "
export PS1="\w \$(__git_ps1 \" ${YELLOW}(%s)${RESET} \")\$ "

export PATH=$PATH:/usr/local/bin

#turn it on by default
toggleproxy

source /usr/local/bin/virtualenvwrapper.sh
