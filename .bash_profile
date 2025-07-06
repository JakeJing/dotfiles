PS1="$PWD > "
export LC_ALL=en_US.UTF-8

# Set arm64 as default architecture
export ARCHFLAGS="-arch arm64"
export CPPFLAGS="-arch arm64"
export LDFLAGS="-arch arm64"

export BEAST_PACKAGE_PATH="/Users/jakejing/Library/Application\ Support/BEAST/2.7"

# added by Anaconda2 4.0.0 installer
# alias ls='ls --color'
alias ls='gls --hyperlink=auto --color=auto "$@"'

alias gcc='gcc-7'
alias rm='trash'
alias julia='/Applications/Julia-1.7.app/Contents/Resources/julia/bin/julia'

CC=gcc
#LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
#export LS_COLORS

export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export JRE_HOME=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home/bin

export PATH=$PATH:/opt/homebrew/bin:/usr/bin:/usr/local/bin:/opt/homebrew/bin:/opt/local/bin/:/usr/local/opt/openssl@3/bin:/Users/jakejing/udpipe/src/udpipe:Users/jakejing/fossil/fossil:JAVA_HOME/bin:/usr/local/bin/parallel:/Users/jakejing/RevBayes:/Users/jakejing/Documents/Circos/circos-0.69-6/bin:/Users/jakejing/git/revbayes-master/projects/cmake:/Users/jakejing/libsixel/converters:/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/System/Library/Frameworks/Tk.framework/Versions/8.5/Headers/X11:/Applications/Julia-1.7.app/Contents/Resources/julia/bin/:/Users/jakejing/.nvm:/Users/jakejing/switchdrive/uralic/TuLeD:/Users/jakejing/Library/Application\ Support/BEAST/2.7:/usr/local/go/bin

# set python3.11 path
set -x PATH "/opt/homebrew/bin" "$PATH"

export CLASSPATH=$CLASSPATH:/Users/jakejing/.nvm:/Users/jakejing/switchdrive/uralic/TuLeD

export LIBS="-L/Users/jakejing/Documents/pythonwd/word_alignment/PA3/boost_1_52_0/stage/lib"
export CPPFLAGS="-I/Users/jakejing/Documents/pythonwd/word_alignment/PA3/boost_1_52_0:-I/usr/local/opt/openssl@3/include"

export PKG_CONFIG_PATH="/usr/local/opt/openssl@3/lib/pkgconfig"

export LIBS="-L/opt/local/lib"
export LD_LIBRARY_PATH="/Library/Frameworks/R.framework/Versions/4.0/Resources/library/rgdal/R"

# path for calibre
export CALIBRE="/Applications/calibre.app/Contents/console.app/Contents/MacOS"
export PATH="$CALIBRE:$PATH"

export DYLD_LIBRARY_PATH=/Users/jakejing/git/revbayes-master/boost_1_60_0/stage/lib$DYLD_LIBRARY_PATH

export LDFLAGS="-L/opt/local/lib:-L/usr/local/opt/openssl@3/lib"

# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="/usr/local/opt/ruby/bin:$PATH"

# export path for megacmd
export PATH=/Applications/MEGAcmd.app/Contents/MacOS:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# eval "$(pyenv init -)"


# source /Users/jakejing/.config/broot/launcher/bash/br

. "$HOME/.cargo/env"

# Azure AI services multiservice keys
export SPEECH_KEY=7789fbf4d9014035981d289de0535d0a
export SPEECH_REGION=swedencentral

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
